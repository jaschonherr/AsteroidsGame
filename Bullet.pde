class Bullet extends Floater {

  public Bullet(Spaceship myShip, double x, double y) {
    myCenterX = x;
    myCenterY = y;
    myXspeed = myShip.getXspeed();
    myYspeed = myShip.getYspeed();
    myPointDirection = myShip.getPointDir();
  }
  public Bullet() {
    myCenterX = 0;
    myCenterY = 0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    corners = 0;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color(0);
  }
  
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
  public double getXspeed() {
    return myXspeed;
  }
  public double getYspeed() {
    return myYspeed;
  }
  public double getPointDir() {
    return myPointDirection;
  }
  
  public void show() {
    noStroke();
    fill(0, 255, 0);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
    //println("x: "+(ship.getCenterX() + 20*Math.cos(ship.getPointDir())));
    //println("y: "+(ship.getCenterY() + 20*Math.sin(ship.getPointDir())));
  }
  
  public void move() {
    myXspeed = 10 * (Math.cos(myPointDirection * (Math.PI/180)));
    myYspeed = 10 * (Math.sin(myPointDirection * (Math.PI/180)));
    myCenterX += myXspeed;    
    myCenterY += myYspeed;   
  }

}
