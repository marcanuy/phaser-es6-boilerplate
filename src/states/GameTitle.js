class GameTitle extends Phaser.State {

    create() {
	this.textTitle1 = this.game.add.text(100, 200, "Hello World", { font: "62px Arial Black", fill: "#ff0000" });
	this.textTitle1.stroke = "#00ff00";
	this.textTitle1.strokeThickness = 16;
	this.textTitle1.setShadow(2, 2, "#888888", 2, true, false);
    }

    startGame() {
	this.game.state.start("Main");
    }

}

export default GameTitle;
