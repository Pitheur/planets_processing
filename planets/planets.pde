

float x = 256;
float y = 256;

void setup() {
  size(512,512);
  smooth();
  noStroke();

  // you have to call always Ani.init() first!
  Ani.init(this);
}

void draw() {
  background(80);
  fill(#A0D0FF);
  ellipse(x,y,120,120);
}