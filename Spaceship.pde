class Spaceship extends Floater {

  public Spaceship() {
    corners = 10;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -16; yCorners[0] = -8;
    xCorners[1] = -8; yCorners[1] = -16;
    xCorners[2] = 14; yCorners[2] = -16;
    xCorners[3] = -4; yCorners[3] = -8;
    xCorners[4] = 24; yCorners[4] = 0;
    xCorners[5] = -4; yCorners[5] = 8;
    xCorners[6] = 14; yCorners[6] = 16;
    xCorners[7] = -8; yCorners[7] = 16;
    xCorners[8] = -16; yCorners[8] = 8;
    xCorners[9] = -8; yCorners[9] = 0;
    myColor = color(179, 231, 242);
    myCenterX = 500;
    myCenterY = 400;
    myXspeed = myYspeed = 0;
    myPointDirection = 0;
  }
  public void move() {
    super.move();
    if(keys['d']) {
      //turn(5);
    }
    if(keys['a']) {
      //turn(-5);
    }
    //sets max speed
    if(Math.sqrt(myXspeed*myXspeed + myYspeed*myYspeed) > 5) {  
      if(myXspeed < 0) {
        myXspeed += 0.1;
      } else {
        myXspeed -= 0.1;
      }
      if(myYspeed < 0) {
        myYspeed += 0.1;
      } else {
        myYspeed -= 0.1;
      }
    } else {
      if(keys['w']) {
        accelerate(.1);
      }
    }
    // point towards mouse
    double xDiff = mouseX - myCenterX;
    double yDiff = mouseY - myCenterY;
    double angle = Math.atan(yDiff/xDiff) * (180/Math.PI);
    if(xDiff < 0) {
      angle += 180;
    }
    myPointDirection = angle;
  }
  
  public void hyperspace() {
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myPointDirection = Math.random()*360;
    myXspeed = myYspeed = 0;
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
  
   public void show ()  //Draws the floater at the current position  
  {             
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

    if((keys['w'])) {
      stroke(255, 0, 0);
      line(-22, -9, -30, -10);
      line(-22, 7, -30, 6);
      
      stroke(252, 223, 3);
      line(-22, -7, -30, -6);
      line(-22, 9, -30, 10);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  } 

}
