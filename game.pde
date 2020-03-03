void game() {

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






  ArrayList<FContact> contactsdeath = player1.getContacts();

  for (FContact cont : contactsdeath) {
    if (cont.contains ("treeTop") ) {
      mode = gameover;
    }
  }

  for (FContact cont : contactsdeath) {
    if (cont.contains ("treeTrunk") ) {
      mode = gameover;
    }
  }


  if (player1.getX() > 1000 && player1.getY() > 2000) {
    player1.setPosition(900, 435);
  }


  ArrayList<FContact> contacts1 = player1.getContacts();
  if (upkey && contacts1.size() > 0)  player1.setVelocity (player1.getVelocityX(), -1390);




  player1.setVelocity (vx, player1.getVelocityY());


  fill (255, 0, 0);
  textSize(30);

  text ("Points:", width-200, 100);
  text (points, width-100, 100);

  println(player1.getY());

  if (player1.getY()==  1527.6011) {
    points = points + 1/10;
  }
  sprites();
}///////////////////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;


void keyPressed() {/////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == UP) upkey = true;
}



void keyReleased() {
  if (keyCode == DOWN) downkey = false;
  if (keyCode == UP) upkey = false;
}////////////////////////////////////////////////////////////////////////;;;;;;;;;;;;;;;;;;;;
