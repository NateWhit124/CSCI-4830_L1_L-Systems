import Turtle.*;
Turtle t;
float radius = 225;
int subdivisions = 32;

void setup() {
  t = new Turtle(this);
  background(255);
  stroke(0);
  size(500,500);
  noLoop();
}

void draw() {
  float current_angle = t.getHeading();
  t.penUp();
  float x = radius*cos(current_angle) + width/2;
  float y = radius*sin(current_angle) + height/2;
  t.goToPoint(x,y);
  t.penDown();
  
  while(current_angle < 2*PI) {
    current_angle = min(current_angle + (PI/subdivisions) , 2*PI);
    x = radius*cos(current_angle) + width/2;
    y = radius*sin(current_angle) + height/2;
    t.goToPoint(x,y);
  }
}
