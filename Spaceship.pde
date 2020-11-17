class Spaceship extends Floater {

  public Spaceship() {
    corners = 10;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -16; yCorners[0] = -8;
    xCorners[1] = -8; yCorners[1] = -16;
    xCorners[2] = 12; yCorners[2] = -16;
    xCorners[3] = -4; yCorners[3] = -8;
    xCorners[4] = 24; yCorners[4] = 0;
    xCorners[5] = -4; yCorners[5] = 8;
    xCorners[6] = 12; yCorners[6] = 16;
    xCorners[7] = -8; yCorners[7] = 16;
    xCorners[8] = -16; yCorners[8] = 8;
    xCorners[9] = -8; yCorners[9] = 0;
    myColor = color(179, 231, 242);
    myCenterX = 500;
    myCenterY = 400;
    myXspeed = myYspeed = myPointDirection = 0;
  }
  
  public void update () {
    if(keys['d']) {
      turn(5);
    }
    if(keys['a']) {
      turn(-5);
    }
    if(keys['w']) {
      accelerate(.1);
    }
  }
  
  public void hyperspace() {
    myCenterX = Math.random()*1000;
    myCenterY = Math.random()*800;
    myPointDirection = Math.random()*360;
    myXspeed = myYspeed = 0;
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
