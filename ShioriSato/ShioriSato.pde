import processing.pdf.*;

float x, y;
float xx, yy;
int radius = 50;
int S = 100;
int B = 100;
int A = 50;

void setup() {
  //size(800, 800, PDF, "00.pdf");
  size(1000, 1000);
  background(255);
  noiseDetail(2);
  colorMode(HSB, 360, 100, 100, 100);
  //blendMode(REPLACE);
}


void draw() {
  //beginRecord(PDF, "output.pdf");
  noLoop();
  
  translate(width/2, height/2.3);
  pushMatrix();
  for(int i=180; i<=720; i+=90){
    two(random(2.0,2.9), random(80));
    rotate(radians(i));
  }
  popMatrix();
  
  //PFont F02 = loadFont("Futura-CondensedMedium-24.vlw");
  PFont F01 = loadFont("JCfg-32.vlw");
  textFont(F01);
  textAlign(CENTER);
  drawOutlineText("beyond2020", 0,0 +radius +200, 36, color(100), color(0,0,100));

  endRecord();
  //exit();
}


void two(float n, float H){
  fill(H, S, B, A);
  noStroke();
  
  pushMatrix();
  beginShape();
  for (float i = 0; i < TWO_PI/2; i += TWO_PI/2020) {
    float no = noise(i /n);
    x = cos(i) *radius /no;
    y = sin(i) *radius /no;
    vertex(x, y);
    //println("no=", no);
    //println("", no);
  }
  
  endShape(CLOSE);

  noFill();
  stroke(H, S, B, A);
  strokeWeight(3);
  
  beginShape();
  for (float i = 0; i < TWO_PI/2; i += TWO_PI/360) {
    float no = noise(i /n);
    xx = cos(i) *radius*1.2 /no;
    yy = sin(i) *radius*1.2 /no;
    vertex(xx, yy);
  }
  endShape();
  popMatrix();
  
  
  
}



void drawOutlineText(String text, float x, float y, int size, int fgColor, int bgColor) {
  float outlineWidth = (float)(size / 24.0);
  textSize(size);
  fill(bgColor);
  text(text, x - outlineWidth, y + size - outlineWidth);
  text(text, x + outlineWidth, y + size - outlineWidth);
  text(text, x - outlineWidth, y + size + outlineWidth);
  text(text, x + outlineWidth, y + size + outlineWidth);
  fill(fgColor);
  text(text, x, y + size);
}