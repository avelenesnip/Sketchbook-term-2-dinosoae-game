int mode;
final int intro    = 0;
final int game     = 1;
final int gameover = 2;


import fisica.*;

PImage[] runleft;
PImage[] runright;
PImage[] currentAction;
int costumeNum = 0;

int frame = 0;
int points = 0;


color black = #000000;
color red = color   (255, 0, 0);
color blue = color  (0, 0, 255);
color green = color (0, 255, 0);

PImage map;

int x = 0;
int y = 0;

int timer = 0;

final int gridSize = 20;

float vx, vy, zoom, angle;

boolean upkey, downkey, leftkey, rightkey, wkey, skey, akey, dkey, qkey, ekey, spacekey;

ArrayList <FBox> boxes = new ArrayList<FBox>();
boolean go;

FBox player1, player2;


FWorld world;


void setup() {/////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;

  fullScreen();




  Fisica.init(this);
  world = new FWorld(-10000, -10000, 100000, 100000);
  world.setGravity(0, 4000);

  runleft = new PImage[3];
  runright = new PImage[3];
 

  runright [0] = loadImage("dino1.png");
  runright [1] = loadImage("dino2.png");
  runright [2] = loadImage("dino3.png");

  runleft [0] = loadImage("dino4.png");
  runleft [1] = loadImage("dino5.png");
  runleft [2] = loadImage("dino6.png");




  go = true;

  map = loadImage("map2.png");  

  textAlign(CENTER, CENTER);


  player1();
  player1.setPosition(100, 420);


  while (y < map.height) {
    color c = map.get (x, y);

    if ( c == black) {
      FBox b = new FBox(gridSize, gridSize);
      b.setName("ground");
      b.setStrokeColor(black);
      b.setFillColor(black);
      b.setPosition(x*gridSize, y*gridSize);
      b.setFriction(1);
      b.setStaticBody(true);
      world.add(b);
      boxes.add(b);
    }

    if ( c == red) {
      FBox ttr = new FBox(gridSize, gridSize);
      ttr.setName("treeTrunk");
      ttr.setStrokeColor(red);
      ttr.setFillColor(red);
      ttr.setPosition(x*gridSize, y*gridSize);
      ttr.setFriction(1);
      ttr.setStaticBody(true);
      world.add(ttr);
      boxes.add(ttr);
    }


    if ( c == green) {
      FBox tto = new FBox(gridSize, gridSize);
      tto.setName("treeTop");
      tto.setStrokeColor(green);
      tto.setFillColor(green);
      tto.setPosition(x*gridSize, y*gridSize);
      tto.setFriction(1);
      tto.setStaticBody(true);
      world.add(tto);
      boxes.add(tto);
    }

    if ( c == blue) {
      FBox m = new FBox(20, 20);
      m.setName("treeTop");
      m.setStrokeColor(blue);
      m.setFillColor(blue);
      m.setPosition(x*gridSize, y*gridSize);
      m.setFriction(1);
      m.setStaticBody(true);
      world.add(m);
      boxes.add(m);
    }
    x++;

    if ( x > map.width) {
      x = 0;
      y++;
    }
  }
}///////////////////////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;


void draw () {//////////

  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("MODE ERROR" + mode);
  }
}///////////////////////
