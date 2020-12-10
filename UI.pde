class UI {
  
  private int hp;
  
  public UI() {
    hp = 3;
  }
  
  public void setHP(int newHP) {
    this.hp = newHP;
  }
  
  public int getHP() {
    return hp;
  }
  
  public void show() {
    textSize(20);
    
    fill(255);
    textAlign(LEFT);
    text("Asteroids Remaining: " + asteroids.size(), 0, 20);
    
    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("Bullets Remaining: ", 0, 40);
    for(int i = 0; i < maxBullets-bullets.size(); i++) {
      stroke(0, 100, 0);
      strokeWeight(1);
      fill(0, 255, 0);
      rect(12*i + 1, 50, 10, 10);
    }
    
    fill(255);
    text("Grenade Status: ", 1, 85);
    if(millis()-tempMillis > 5000) {
      fill(255, 0, 255);
      textAlign(LEFT);
      text("Ready", 1, 110);
    } else {
      noFill();
      stroke(255);
      strokeWeight(1);
      rect(1, 95, 40*4.84, 10);
      fill(255, 0, 255);
      rect(1, 95, (millis()-tempMillis)/25.826, 10);
    }
    fill(255);
    
    textAlign(LEFT);
    text("Speed: ", 1, height-22);
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(1, height-18, 40*4.84, 10);
    fill(0, 0, 255);
    if(Math.sqrt(ship.myXspeed*ship.myXspeed + ship.myYspeed*ship.myYspeed) < 4.84) {
      rect(1, height-18, 40*(float)Math.sqrt(ship.myXspeed*ship.myXspeed + ship.myYspeed*ship.myYspeed), 10);
    } else {
      rect(1, height-18, 40*4.84, 10);
    }
    
    textAlign(RIGHT);
    fill(255);
    text("HP: " + hp, 999, 20);
    
  }
  
  public void gameOver() {
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER. REFRESH TO TRY AGAIN", width/2, height/2);
  }
    
}
