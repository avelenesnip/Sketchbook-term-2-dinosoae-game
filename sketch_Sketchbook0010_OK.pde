import fisica.*;

PImage[] runleft;
PImage[] runright;
PImage[] currentAction;
int costumeNum = 0;

int frame = 0;


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

  go = true;

  map = loadImage("map2.png");  

  textAlign(CENTER, CENTER);

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

  player1();
  sprites();
}///////////////////////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;








void draw() {//////////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;

  background(#E0FFFF);


  pushMatrix();
  translate (-player1.getX() + width/2 + 100, -player1.getY() + height/2 + 100);
  world.step();  
  world.draw();
  popMatrix();


  vx = 0;
  vy = 0;


  if (player1.getX() < 700) go = true;
  if (player1.getX() > 9500) go = false;

  if (go == true) {
    vx = 500;
    currentAction = runright;
  }

  if (go == false) {
    vx = -500;
    currentAction = runleft;
  }


  if (timer>0) {
    textSize(100);
    fill(0);
    text("YOU DIED", width/2, 200);
    timer--;
  }


  ArrayList<FContact> contactsdeath = player1.getContacts();

  for (FContact cont : contactsdeath) {
    if (cont.contains ("treeTop") ) {
      player1.setPosition(100, 420);
      timer = 200;
    }
  }

  for (FContact cont : contactsdeath) {
    if (cont.contains ("treeTrunk") ) {
      player1.setPosition(100, 420);
      timer = 200;
    }
  }


  if (player1.getX() > 1000 && player1.getY() > 2000) {
    player1.setPosition(900, 435);
  }


  ArrayList<FContact> contacts1 = player1.getContacts();
  if (upkey && contacts1.size() > 0) player1.setVelocity (player1.getVelocityX(), -1390);

  player1.setVelocity (vx, player1.getVelocityY());
}///////////////////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;



void player1() {/////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;

  player1 = new FBox(20, 45);
  player1.setPosition(100, 420);

  player1.setStroke(0);
  player1.setStrokeWeight(2);
  player1.setFillColor(red);

  player1.setDensity(0.8);
  player1.setFriction(0);
  player1.setRestitution(0);
  player1.setRotatable(false);

  world.add(player1);
}////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;






void keyPressed() {/////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == UP) upkey = true;
}



void keyReleased() {
  if (keyCode == DOWN) downkey = false;
  if (keyCode == UP) upkey = false;
}////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;
