void sprites() {

  //currentAction = runright;
  if (costumeNum >= currentAction.length) {
    costumeNum=0;
  }

  println(costumeNum);
  player1.attachImage(currentAction[costumeNum]);

  if (frameCount%3==0) {
    costumeNum++;
  }
}
