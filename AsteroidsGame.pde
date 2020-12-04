boolean[] keys = new boolean[128];
Star[] stars = new Star[100];
//Boss[] bosses = new Boss[0];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
Spaceship ship = new Spaceship();

public void setup() {
  size(1000, 800);
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  /*for(int i = 0; i < bosses.length; i++) {
    bosses[i] = new Boss(i*50, 0);
  }*/
  for(int i = 0; i < 20; i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  /*for(int i = 0; i < bosses.length; i++) {
    bosses[i].move();
    bosses[i].show();
  }*/
  for(int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();
    if(dist((float)ship.getCenterX(), (float)ship.getCenterY(), 
    (float)a.getCenterX(), (float)a.getCenterY()) < 40) {
      asteroids.remove(i);
    }
  }
  ship.update();
  ship.move();
  ship.show();
  fill(255);
  textSize(20);
  text("Asteroids Remaining: " + asteroids.size(), 0, 20);
}

public void keyPressed() {
  keys[key] = true;
  if(key == 'q') {
    ship.hyperspace();
  }
}

public void keyReleased() {
  keys[key] = false;
}
