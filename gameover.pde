void gameover(){
// setup();
    player1.setPosition(100, 420);
    textSize(100);
    fill(0);
    text("YOU DIED", width/2, 200);
    
    textSize(40);
    fill(0);
    text("click to restart", width/2, 300);
    
    
    points = 0;
    
    if (mousePressed){
      
      mode = game;
      
    }
  
}
