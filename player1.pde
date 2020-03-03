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
