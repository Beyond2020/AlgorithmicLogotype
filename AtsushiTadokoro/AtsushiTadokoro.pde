//Algrithmic Logotype Example

import processing.pdf.*;
PVector[] verts = new PVector[7];

void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  beginRecord(PDF, "output.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  pushMatrix();

  noStroke();
  translate(width/2, height/2);
  rotate(radians(30));
  fill(random(360), 70, 100, 30);
  polygon(0, 0, width*0.45, 6);

  for (int j = 0; j < 3; j++) {
    PVector pos = new PVector(random(-width*0.3, width*0.3), 
      random(-width*0.4, width*0.4));
    for (int i = 0; i < 6; i++) {
      fill(random(360), 70, 100, 30);
      triangle(pos.x, pos.y, verts[i].x, verts[i].y, verts[i+1].x, verts[i+1].y);
    }
  }
  popMatrix();
  endRecord();
}  


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  int i = 0;
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
    verts[i] = new PVector(sx, sy);
    i++;
  }
  endShape(CLOSE);
}