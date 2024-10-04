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
  t.push();
  t.forward(100);
  t.left(90);
  t.penDown();
  t.forward(20);
  t.penUp();
  t.right(180);
  t.forward(20);
  t.penDown();
  t.forward(20);
  t.penUp();
  t.pop();
  
  t.setHeading(90);
  t.forward(20);
  t.penUp();
  t.right(180);
  t.forward(20);
  t.penDown();
  t.forward(20);
}
