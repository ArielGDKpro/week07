class Particle {
  PVector pos;
  ArrayList<PVector> trace;
  Particle(PVector p) {
    pos = p;
    
    pos.mult(scaleSize);
    pos.sub(new PVector(width*(scaleSize-1)/20, height*(scaleSize-1)/20));
    
    trace = new ArrayList<PVector>();
    trace.add(new PVector(pos.x, pos.y));
  }

  void run() {
    if (pos.x >=0 && pos.x <= width && pos.y >=0 && pos.y <= height) {
      move();
    }
    display();
  }

  void display() {
    stroke(0);
    noFill();
    strokeWeight(0.2);
    //point(pos.x, pos.y);
    beginShape();
    for(int i = 0; i < trace.size(); i ++){
      vertex(trace.get(i).x, trace.get(i).y);
    }
    endShape();
  }

  void move() {
    PVector v = PVector.sub(pos, new PVector(width/200, height/200));
    v.normalize().mult(2);
    pos.add(v);
    
    trace.add(new PVector(pos.x, pos.y));
  }
}
