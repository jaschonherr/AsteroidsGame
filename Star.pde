class Star {
  
  int myX, myY;
  double mySize;
  
  public Star() {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*800);
    mySize = Math.random()*4 + 1;
  }
  
  public void show() {
    noStroke();
    fill(255);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  
  public void move() {
    myX += 1;
    if(myX > 1000) {
      myX = 0;
    }
  }
}
