boolean[] keys = new boolean[128];
Star[] stars = new Star[100];
Spaceship ship = new Spaceship();

public void setup() {
  size(1000, 800);
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    //stars[i].move();
    stars[i].show();
  }
  ship.update();
  ship.move();
  ship.show();
}

void keyPressed() {
  keys[key] = true;
  if(key == 'q') {
    ship.hyperspace();
  }
}

void keyReleased() {
  keys[key] = false;
}
