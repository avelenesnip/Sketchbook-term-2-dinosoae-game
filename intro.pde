void intro() {


  textSize(100);
  fill(0);
  text("DINO GAME", width/2, 200);

  textSize(100);
  fill(0);
    text("play", width/2, 300);


  if (dist(mouseX, mouseY, width/2, 300)<50) { 

    if (mousePressed)  mode = game;
 
  }
}
