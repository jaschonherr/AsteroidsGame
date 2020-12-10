class Asteroid extends Floater {

  private double rotSpeed;
  private int flip;
  public Asteroid() {
    rotSpeed = (int)(Math.random()*3)+2;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -7; yCorners[0] = -8;
    xCorners[1] = 7; yCorners[1] = -8;
    xCorners[2] = 13; yCorners[2] = 0;
    xCorners[3] = 6; yCorners[3] = 10;
    xCorners[4] = -7; yCorners[4] = 8;
    xCorners[5] = -13; yCorners[5] = 0;
    flip = (int)(Math.random()*2);
    if(flip == 0) {
      myColor = color(random(75, 190));
    } else {
      myColor = color(random(46, 80), 40, 0);
    }
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*1000);
    myXspeed = (2*Math.random()) - 1;
    myYspeed = (2*Math.random()) - 1;
    myPointDirection = Math.random()*360;
  }
  
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
  
  public void move() {
    turn(rotSpeed);
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    super.move();
  } 
  
  public void show() {
    super.show();
  }
}
