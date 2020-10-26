// Pong
// Blk: 1-2a
// Esther Pang

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// VARIABLES ================================================
// mode framework
int  mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float vx, vy; //ball velocity 

//keyboard variables
boolean wkey, skey, upkey, downkey;

// AI
boolean AI;

//scoring
int leftscore, rightscore, timer;

//Font
PFont bubblefont;
Minim minim;
AudioPlayer leftpaddle, rightpaddle, wall, score, intro, gameover;

//color palettes
color lightblue = #C0EDFA;
color lightteal= #B7DFE5;
color lightlilac = #C9BDFA;
color pink = #F8DAFB;
color purple = #BEA6F5;
color darkpurple = #d5a6e6;
color darkestpink = #FA9299;
color lightpink = #FAE1E9;
color medblue = #C2E0F9;
color lightyellow = #FFFFEA;
color salmon = #F5D0D2;
color darkpink = #F5BCC0;

// image variables
PImage cloud;
PImage sky;
PImage planet;
PImage planetcopy;
PImage planetgreen;
PImage planetoutlined;
PImage gamebackground;
// ===============================================

void setup() {
  size(800, 600);
  mode = INTRO;

  // loading images
  sky =loadImage("sky.jpg");
  cloud = loadImage("cloud.png");
  planet = loadImage("planet.png");
  planetcopy = loadImage("planet copy.png");
  planetgreen = loadImage("greenplanet.png");
  planetoutlined = loadImage("planetoutline.png");
  gamebackground = loadImage("pinkblue.jpg");

  // intialize reset
  reset();

  // intialize AI
  AI = true;

  // intialize paddles
  leftx = 0;
  lefty = height/2;
  leftd= 200;
  rightx = width;
  righty = height/2;
  rightd = 200;

  // intialize ball
  ballx = width/2;
  bally = height/2;
  balld= 50;
  vx = random(-10, 10);
  vy = random(-10, 10);

  // intialize scoring
  leftscore = 0;
  rightscore = 0;
  timer = 100;

  // intialize keyboard vars
  wkey = skey = upkey = downkey = false;

  // minim
  minim = new Minim(this);
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
  intro = minim.loadFile("Coconut Mall.mp3");
  gameover = minim.loadFile("gameoverwinner.mp3");
  bubblefont = createFont("Mikan DEMO.otf", 100);
  textAlign(CENTER, CENTER);
}


void draw () {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error:Mode = " + mode);
  }
}
