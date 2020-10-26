//making rectangles tactile
void recttactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(5);
  } else {
    strokeWeight(2);
  }
}

//making circles tactile
void tactilecircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(darkestpink);
    strokeWeight(4);
  } else {
    strokeWeight(2);
  }
}

void reset () {
  //reset code
  leftx = 0;
  lefty = height/2;
  leftd= 200;
  rightx = width;
  righty = height/2;
  rightd = 200;
  ballx = width/2;
  bally = height/2;
  balld= 50;
  vx = random(-10, 10);
  vy = random(-10, 10);
  leftscore = 0;
  rightscore = 0;
  timer = 100;
  wkey = skey = upkey = downkey = false;
  AI = true;
}
