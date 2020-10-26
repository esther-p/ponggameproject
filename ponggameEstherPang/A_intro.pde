void intro() {
  // audio
  gameover.pause();
  gameover.rewind();
  intro.play();

  // background 
  background(255);
  imageMode(CORNER);
  image(sky, 0, 0, 800, 600);
  imageMode(CENTER);
  image(cloud, 400, 190, 600, 300);

  //player buttons
  stroke(darkestpink);
  recttactile(100, 380, 250, 100);
  rect(100, 380, 250, 100, 50);
  recttactile(450, 380, 250, 100);
  rect(450, 380, 250, 100, 50);

  //Text
  textFont(bubblefont);
  fill(salmon);
  text("PONG!", width/2, 215);
  textSize(50);
  fill(darkpink);
  text("PLANET", width/2, 150);
  textSize(50);
  fill(darkpink);
  text("1 Player", 225, 425);
  text("2 Player", 575, 425);
  fill(255);

  // planets
  image(planetgreen, 670, 290, 125, 125);
  image(planetoutlined, 170, 150, 170, 150);
}


void introClicks() {
  // player 1 button (with AI)
  if (mouseX > 100 && mouseX < 350 && mouseY > 380 && mouseY < 480) {
    AI = true;
    mode = GAME;
  }

  // player 2 button (without AI)
  if (mouseX > 450 && mouseX < 700 && mouseY > 380 && mouseY < 480) {
    AI = false;
    mode = GAME;
  }
}
