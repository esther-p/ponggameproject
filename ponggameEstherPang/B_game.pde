void game () {
  // draw paddles
  stroke(0);
  background(lightpink);
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);
  planet.resize(245, 225);
  image(planet, leftx-2, lefty+2);
  planetcopy.resize(245, 225);
  image(planetcopy, rightx-2, righty+2);

  // display score;
  textSize(50);
  text(leftscore, width/4, 100);
  text(rightscore, 3*width/4, 100);

  // move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;

  // AI player
  if (AI == false) {
    if (upkey == true) righty = righty - 5;
    if (downkey == true) righty = righty + 5;
  } else {
    if (ballx > 400) {
      if (righty > bally) { 
        righty = righty - 5;
      }

      if (righty < bally) {
        righty = righty + 5;
      }
    }
  }

  //middle line
  stroke(255);
  strokeWeight(5);
  line(width/2, 0, width/2, 800);
  strokeWeight(1);

  // draw ball
  stroke(0);
  circle(ballx, bally, balld);
  image(planetgreen, ballx+3, bally+2, balld+12, balld+11);

  // moving ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  //pause button
  recttactile(15, 15, 75, 75);
  strokeWeight(2);
  stroke(245, 133, 163);
  square(15, 15, 75);
  stroke(245, 133, 163);
  fill(245, 133, 163);
  rect(40, 30, 3, 45);
  rect(60, 30, 3, 45);
  fill(255);
  strokeWeight(1);

  // timer
  timer = timer - 1;

  // circle collosions
  if (dist(leftx, lefty, ballx, bally) < leftd/2 + balld/2) {
    vx = (ballx - leftx)/15;
    vy = (bally- lefty)/15 ;
    leftpaddle.rewind();
    leftpaddle.play();
  }
  if (dist(rightx, righty, ballx, bally) < rightd/2 + balld/2) {
    vx = (ballx - rightx)/15;
    vy = (bally- righty)/15;
    rightpaddle.rewind();
    rightpaddle.play();
  }

  // limiting paddle movement 
  if (lefty > 500) {
    lefty = 500;
  }
  if (lefty < 100) {
    lefty = 100;
  }  

  if (righty > 500) {
    righty = 500;
  }
  if (righty < 100) {
    righty = 100;
  }

  // ball scoring ================== 
  // right scoring
  if (ballx < -50) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 4;
    vy = 0;
    score.rewind();
    score.play();
  }

  // left scoring
  if (ballx > 850) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 4;
    vy = 0;
    score.rewind();
    score.play();
  }
  // ===============================  

  // boundaries for ball 
  if (bally < balld/2 || bally > height- balld/2) {
    vy = vy * -1;
    if (bally < 25) {
      bally =  25;
    }
    if (bally > 750) {
      bally = 750;
    }  

    wall.rewind();
    wall.play();
  }

  // gameover scoring
  if (leftscore >= 3 || rightscore >= 3) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  if (mouseX > 15 && mouseX < 95 && mouseY > 15 && mouseY < 95) {
    mode = PAUSE;

    //play button
    strokeWeight(2);
    square(15, 15, 75);
    fill(245, 133, 163);
    triangle(42, 35, 67, 52.5, 42, 70);
    fill(255);
  }
}
