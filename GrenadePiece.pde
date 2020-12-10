class GrenadePiece extends Bullet {

  
  private double multiplier;
  
  public GrenadePiece(double x, double y, double dir) {
    myCenterX = x;
    myCenterY = y;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = dir;
    multiplier = (Math.random()*4 + 4);
  }
  
  public void move() {
    myXspeed = multiplier * (Math.cos(myPointDirection * (Math.PI/180)));
    myYspeed = multiplier * (Math.sin(myPointDirection * (Math.PI/180)));
    myCenterX += myXspeed;    
    myCenterY += myYspeed;   
  }
  
  public void show() {
    noStroke();
    fill(255, 0, 255);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
    //println("x: "+(ship.getCenterX() + 20*Math.cos(ship.getPointDir())));
    //println("y: "+(ship.getCenterY() + 20*Math.sin(ship.getPointDir())));
  }
  
}
