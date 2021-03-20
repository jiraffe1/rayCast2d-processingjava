// Thanks to Dan Shiffman for the original javascript code, i rewrote it in java

ArrayList<Boundary> walls = new ArrayList<Boundary>();
Ray ray;
Particle particle;
int xoff = 0;
int yoff = 10000;

void setup() {
  size(800, 800);
  for (int i = 0; i < 5; i++) {
    float x1 = random(width);
    float x2 = random(width);
    float y1 = random(height);
    float y2 = random(height);
    walls.add(new Boundary(x1, y1, x2, y2));
  }
  walls.add(new Boundary(0, 0, width, 0));
  walls.add(new Boundary(width, 0, width, height));
  walls.add(new Boundary(width, height, 0, height));
  walls.add(new Boundary(0, height, 0, 0));
  particle = new Particle();
}

void draw() {
  background(0);
  for (Boundary wall : walls) {
    wall.show();
  }
  //particle.movement();
  particle.update(mouseX, mouseY);
  particle.show();

  particle.look(walls);
  
  xoff += 0.03;
  yoff += 0.03;
  fill(255);
  text(frameRate, 20,20);
  text(particle.pos.x+" , " + particle.pos.y, 20,40);
}
