# Phaser ES6 Boilerplate

This project sets up a common structure for building standard games using 
Phaser and Javascript ES6/2015.

It aims to reduce the time spent configurating a project and
installing dependencies by providing a template that can work as an
scaffold for any Phaser game.

# Notes

** This template is a modified version of
https://github.com/joshuamorony/phaser-es6-boilerplate.git which is
also a
modified version of:
https://github.com/belohlavek/phaser-es6-boilerplate ** 8)

It has been modified to 

- use a simple Makefile (instead of Grunt) 
- keeping the following common states:
  - Boot
  - Preload
  - GameTitle
  - Main
  - GameOver
- using [Phaser Community Edition](https://photonstorm.github.io/phaser-ce/)

## Features

- [Browserify](https://github.com/substack/node-browserify) + [Babelify](https://github.com/babel/babelify) (Yes, it uses [Babel](https://babeljs.io/)).

- [Browsersync](http://www.browsersync.io/) = Livereload + Mobile debugging with [Weinre](http://people.apache.org/~pmuellr/weinre-docs/latest/).

- Modular development.

- Production ([UglifyJS](https://github.com/mishoo/UglifyJS2)) and Development ([Sourcemaps](https://developer.chrome.com/devtools/docs/javascript-debugging#source-maps)) builds.

- Usage of [ES6](http://www.ecma-international.org/publications/standards/Ecma-262.htm)
  with clean class-based syntax. 

- Thanks to Babel it generates all your project in a single Javascript
  file (`game.js` in this case)
  
## Usage

Clone the repository (or download the ZIP file)

`git clone https://github.com/marcanuy/phaser-game-boilerplate.git`

Install dependencies

`make install`

Run a development server...

`make serve`

...or a production build.

`make build-prod`

### Notes

Development builds will copy `phaser.min.js` together with `phaser.map` and `phaser.js`
Your ES6 code will be transpiled into ES5 and concatenated into a single file.
A sourcemap for your code will also be included (by default `game.map.js`).

Production builds will only copy `phaser.min.js`. Your ES6 code will be transpiled and
minified using UglifyJS.

Any modification to the files inside the `./src` and `./static` folder will trigger a full page reload.

If you modify the contents of other files, please manually restart the server.

## Contributing

Please report any bugs or add requests on [Github Issues](https://github.com/marcanuy/phaser-game-boilerplate/issues).

## License

This project is released under the MIT License.
