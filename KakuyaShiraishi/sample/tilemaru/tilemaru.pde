
int edge, col, num=5; 
float unit, sz, scal;
long rs = 100;

void setup() {
  size(600, 600);
  noStroke();
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);
  colorMode(HSB,255,100,100); 
  edge = width/14;
  unit = (width-2*edge)/num;
  col = 0;
}

void draw() {
  randomSeed(rs);
  background(255);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      float r = random(1);
      if (r>0.85) { 
        fill(col,100,90, 240);
        scal = 1.4;
      } else { 
        fill(col, 80,80,200);
        scal = 1;
      }
      float varX = random(-10, 10); 
      float varY = random(-10, 10); 
      rect(edge+(i+.5)*unit+varX, edge+(j+.5)*unit+varY, unit*scal, unit*scal,unit/3);
    }
  }
}

void mouseClicked() {
  rs = hour()+minute()+second()+millis();
  col = (int) random(255); 
}

void keyPressed() {
  saveFrame("###.jpg");


}
