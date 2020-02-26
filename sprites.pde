void sprites() {

  runright [0] = loadImage("dino1.png");
  runright [1] = loadImage("dino2.png");
  runright [2] = loadImage("dino3.png");



  runleft [0] = loadImage("dino4.png");
  runleft [1] = loadImage("dino5.png");
  runleft [2] = loadImage("dino6.png");



  currentAction = runright;


  player1.attachImage(currentAction[costumeNum]);

  if (frameCount%5==0) {
    costumeNum++;
    if (costumeNum >= currentAction.length) {
      costumeNum=0;
    }
  }
}
