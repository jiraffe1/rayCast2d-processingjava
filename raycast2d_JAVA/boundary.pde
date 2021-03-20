class Boundary {
  PVector a;
  PVector b;
  
  Boundary(float x1_, float y1_, float x2_, float y2_) {
    a = new PVector(x1_, y1_);
    b = new PVector(x2_, y2_);
  }
  
  void show() {
    stroke(255);
    line(this.a.x, this.a.y, this.b.x, this.b.y);
  }
}
