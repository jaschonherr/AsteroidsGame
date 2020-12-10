boolean[] keys = new boolean[128];
Star[] stars = new Star[100];
//Boss[] bosses = new Boss[0];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Grenade> grenades = new ArrayList<Grenade>();
ArrayList<GrenadePiece> grenadePieces = new ArrayList<GrenadePiece>();
Spaceship ship = new Spaceship();
UI gameUI = new UI();
int maxBullets = 6;
int maxGrenades = 1;
int maxPieces = 16;
int tempMillis = 0;

public void setup() {
  size(1000, 800);
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for(int i = 0; i < 25; i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw() {
  if(gameUI.getHP() > 0) {
    background(0);
    for(int i = 0; i < stars.length; i++) {
      stars[i].show();
    }
    for(int i = 0; i < asteroids.size(); i++) {
      Asteroid a = asteroids.get(i);
      a.move();
      a.show();
      if(dist((float)ship.myCenterX, (float)ship.myCenterY, 
      (float)a.myCenterX, (float)a.myCenterY) < 40) {
        asteroids.remove(i);
        gameUI.setHP(gameUI.getHP()-1);
      }
    }
    /*if(bullets.size() < maxBullets) {  
      if(mousePressed) {
        bullets.add(new Bullet(ship, ship.getCenterX() + 20*Math.cos(Math.PI/180*ship.getPointDir()-Math.atan(4/3)),
        ship.getCenterY() + 20*Math.sin(Math.PI/180*ship.getPointDir()-Math.atan(4/3))));
        bullets.add(new Bullet(ship, ship.getCenterX() + 20*Math.cos(Math.PI/180*ship.getPointDir()+Math.atan(4/3)),
        ship.getCenterY() + 20*Math.sin(Math.PI/180*ship.getPointDir()+Math.atan(4/3))));
      }
    }*/
    for(int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.move();
      b.show();
      if(b.getCenterX() > width || b.getCenterX() < 0 ||
      b.getCenterY() > height || b.getCenterY() < 0) {
        bullets.remove(i);
      }
    }
    for(int i = 0; i < grenades.size(); i++) {
      Grenade g = grenades.get(i);
      g.move();
      g.show();
      if(g.getCenterX() > width || g.getCenterX() < 0 ||
      g.getCenterY() > height || g.getCenterY() < 0) {
        grenades.remove(i);
      }
      if(!keys['e']) {
        if(grenades.size() == maxGrenades & grenadePieces.size() == 0) {
          if(grenadePieces.size() < maxPieces) {
            for(int j = 0; j < maxPieces; j++) {
              grenadePieces.add(new GrenadePiece(g.getCenterX(), g.getCenterY(), j*(360/maxPieces)));
            }
          }
          tempMillis = millis();
          grenades.remove(i);
        }
      }
    }
    for(int k = 0; k < grenadePieces.size(); k++) {
      GrenadePiece p = grenadePieces.get(k);
      p.move();
      p.show();
      if(p.getCenterX() > width || p.getCenterX() < 0 ||
      p.getCenterY() > height || p.getCenterY() < 0) {
        grenadePieces.remove(k);
      }
    }
    for(int i = 0; i < asteroids.size(); i++) {
      for(int j = 0; j < bullets.size(); j ++) {
        Asteroid a = asteroids.get(i);
        Bullet b = bullets.get(j);
        if(dist((float)a.getCenterX(), (float)a.getCenterY(), 
        (float)b.getCenterX(), (float)b.getCenterY()) < 20) {
          asteroids.remove(i);
          bullets.remove(j);
          break;
        } 
      }
    }
    for(int i = 0; i < asteroids.size(); i++) {
      for(int j = 0; j < grenadePieces.size(); j ++) {
        Asteroid a = asteroids.get(i);
        GrenadePiece p = grenadePieces.get(j);
        if(dist((float)a.getCenterX(), (float)a.getCenterY(), 
        (float)p.getCenterX(), (float)p.getCenterY()) < 20) {
          asteroids.remove(i);
          grenadePieces.remove(j);
          break;
        } 
      }
    }
    ship.move();
    ship.show();
    gameUI.show();
  } else {
    gameUI.gameOver();
  }
}

void keyPressed() {
  keys[key] = true;
  if(key == 'q') {
    ship.hyperspace();
  }
  if(grenades.size() < maxGrenades && millis()- tempMillis > 5000) {
    if(keys['e']) {
      grenades.add(new Grenade(ship));
    }
  }
}

public void keyReleased() {
  keys[key] = false;
}

public void mouseReleased () {
  if(bullets.size() < maxBullets) {  
    bullets.add(new Bullet(ship, ship.getCenterX() + 20*Math.cos(Math.PI/180*ship.getPointDir()-Math.atan(4/3)),
    ship.getCenterY() + 20*Math.sin(Math.PI/180*ship.getPointDir()-Math.atan(4/3))));
    bullets.add(new Bullet(ship, ship.getCenterX() + 20*Math.cos(Math.PI/180*ship.getPointDir()+Math.atan(4/3)),
    ship.getCenterY() + 20*Math.sin(Math.PI/180*ship.getPointDir()+Math.atan(4/3))));
  }
}
