PHASER_PATH = ./node_modules/phaser-ce/build/
BUILD_PATH = ./build
SCRIPTS_PATH = $(BUILD_PATH)/scripts
SOURCE_PATH = ./src
STATIC_PATH = ./static
ENTRY_FILE = $(SOURCE_PATH)/index.js
OUTPUT_FILE = $(SCRIPTS_PATH)/game.js
OUTPUT_FILE_MAP = $(OUTPUT_FILE).map

BROWSERIFY := ./node_modules/browserify/bin/cmd.js
BROWSER_SYNC := ./node_modules/browser-sync/dist/bin.js
UGLIFYJS := ./node_modules/uglify-js/bin/uglifyjs

install:
	npm install

# Deletes all content inside the './build' folder.
clean-build:
	rm -fr $(BUILD_PATH) && mkdir $(BUILD_PATH) && mkdir $(SCRIPTS_PATH)

# Copies the content of the './static' folder into the '/build' folder.
copy-static: clean-build
	cp -pr $(STATIC_PATH)/* $(BUILD_PATH)

# Copies required Phaser files from the './node_modules/Phaser' folder into the './build/scripts' folder.
# This way you can call 'npm update', get the lastest Phaser version and use it on your project with ease.
copy-phaser-dev: copy-static
	cp $(PHASER_PATH)/phaser.min.js $(PHASER_PATH)/phaser.map $(PHASER_PATH)/phaser.js $(SCRIPTS_PATH)
copy-phaser-prod: 
	cp $(PHASER_PATH)/phaser.min.js $(SCRIPTS_PATH)

build-dev: copy-phaser-dev
	$(BROWSERIFY) $(ENTRY_FILE) -t babelify --presets env -o $(OUTPUT_FILE)
build-prod: copy-phaser-prod
	$(BROWSERIFY) $(ENTRY_FILE) -t babelify --presets env -o /tmp/game.js
	$(UGLIFYJS) --compress --mangle -- /tmp/game.js > $(OUTPUT_FILE)
serve: build-dev
	$(BROWSER_SYNC) start --server '$(BUILD_PATH)' --files '$(SOURCE_PATH)/**/*.js'
