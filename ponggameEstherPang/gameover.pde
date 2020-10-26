void gameover () {
  intro.pause();

  // gameover window
  strokeWeight(2);
  fill(255);
  rect(25, 25, 750, 550, 100);
  fill(0);
  textFont(bubblefont);

  // gameover winner screens
  // left winner screen
  if (leftscore > rightscore) {
    gameover.play();
    background(lightteal);
    stroke(53, 172, 229);
    fill(255);
    rect(25, 25, 750, 550, 100);
    fill(lightblue);
    text("Left Wins!", 400, 200);
    image(planet, 400, 400, 225, 200);
  } else {
    // right winner screen
    gameover.play();
    background(purple);
    stroke(178, 112, 232);
    textFont(bubblefont);
    fill(255);
    rect(25, 25, 750, 550, 100);
    fill(lightlilac);
    text("Right Wins!", 400, 200);
    image(planetcopy, 400, 400, 225, 200);
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
    reset();
    mode = INTRO;
    intro.rewind();
  }
}
