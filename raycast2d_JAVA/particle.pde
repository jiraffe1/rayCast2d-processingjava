class Particle {
  PVector pos;
  ArrayList<Ray>rays = new ArrayList<Ray>();
  int lookDir =  0;
  int fieldOfView = 180;
  PVector[] look = new PVector[73];
  int moveSpeed = -5;
  float res = 2;
  float rotateSpeed = 50;
  
  Particle() {
    this.pos = new PVector(width / 2, height / 2);
    
    for (int a = lookDir-fieldOfView; a < lookDir+fieldOfView; a += res) {
      rays.add(new Ray(this.pos, radians(a)));
    }
  }

  void update(float x, float y) {
    this.pos.set(x, y);
  }
  void movement() {
    
    if(keyPressed) {
      if(key == 'a') {
        this.lookDir-=this.rotateSpeed;
      }
      else if(key == 'd') {
        this.lookDir+=this.rotateSpeed; 
      }
      else if(key == 'w') {
        PVector addVelocity = PVector.fromAngle(this.lookDir);
        addVelocity.setMag(this.moveSpeed);
        this.pos.add(addVelocity);
      }
      else if(key == 's') {
        PVector addVelocity = PVector.fromAngle(this.lookDir);
        addVelocity.setMag(-this.moveSpeed);
        this.pos.add(addVelocity);
      }
    }
  }
  void look(ArrayList<Boundary> walls) {
    
    rays.clear();
    for (int a = lookDir-fieldOfView; a < lookDir+fieldOfView; a += res) {
      rays.add(new Ray(this.pos, radians(a)));
    }
    for (int i = 0; i < this.rays.size(); i++) {
      Ray ray = this.rays.get(i);
      PVector closest = null;
      float record = 10000000;
      for (Boundary wall : walls) {
        PVector pt = ray.cast(wall);
        if (pt != new PVector(-694201337,-694201337)) {
          float d = dist(this.pos.x, this.pos.y, pt.x, pt.y);
          if (d < record) {
            record = d;
            closest = pt;
          }
        }
      }
      if (closest!=null) {
        // colorMode(HSB);
         //stroke((i + frameCount * 2) % 360, 255, 255, 50);
        stroke(255);
        line(this.pos.x, this.pos.y, closest.x, closest.y);
      }
    }
  }


  void show() {
    fill(255);
    ellipse(this.pos.x, this.pos.y,4 ,4);
    for (Ray ray :this.rays) {
      ray.show();
    }
  }
}
