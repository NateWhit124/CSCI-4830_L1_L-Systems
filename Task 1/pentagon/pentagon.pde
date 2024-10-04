import Turtle.*;
Turtle t;

void setup() {
  t = new Turtle(this);
  background(255);
  stroke(0);
  size(350,350);
  noLoop();
}

void draw() {
  t.right(72);
  for(int i=0; i<5; i++) {
    t.forward(100);
    t.right(72);
  }
}
