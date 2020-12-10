class Grenade extends Bullet {

  public Grenade(Spaceship myShip) {
    myCenterX = myShip.getCenterX();
    myCenterY = myShip.getCenterY();
    myXspeed = myShip.getXspeed();
    myYspeed = myShip.getYspeed();
    myPointDirection = myShip.getPointDir();
    myColor = color(255, 0, 255);
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -2; yCorners[0] = 2;
    xCorners[1] = 0; yCorners[1] = -6;
    xCorners[2] = 2; yCorners[2] = -2;
    xCorners[3] = 6; yCorners[3] = 0;
    xCorners[4] = 2; yCorners[4] = 2;
    xCorners[5] = 0; yCorners[5] = 6;
    xCorners[6] = -2; yCorners[6] = 2;
    xCorners[7] = -6; yCorners[7] = 0;
  }
  
  public void move() {
    myXspeed = 5 * (Math.cos(myPointDirection * (Math.PI/180)));
    myYspeed = 5 * (Math.sin(myPointDirection * (Math.PI/180)));
    myCenterX += myXspeed;    
    myCenterY += myYspeed;   
  }
  
  public void show() {
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
