import Turtle.*;
Turtle t;

void setup() {
  t = new Turtle(this);
  background(255);
  stroke(0);
  size(300,300);
  noLoop();
}

void draw() {
  t.right(30);
  t.forward(100);
  t.right(120);
  t.forward(100);
  t.right(120);
  t.forward(100);
}
