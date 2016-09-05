import processing.pdf.*;

float x, y;
float xx, yy;
float n;
int radius = 20;


void setup() {
  //size(800, 800, PDF, "00.pdf");
  size(800, 800);
  background(255);
  noiseDetail(2);
}

void draw() {
  //beginRecord(PDF, "output.pdf");
  
  //translate(width/2, height/2);
  //rotate(n);
  
  two(width/5, height/2);
  zero(width/5*2, height/2);
  two(width/5*3, height/2);
  zero(width/5*4, height/2);
  
  


  PFont F02 = loadFont("Futura-CondensedMedium-24.vlw");
  textFont(F02);
  textAlign(CENTER);
  drawOutlineText("beyond2020", width/2, height/2 +radius +200, 24, color(0), color(255));

  n += 0.1;

  endRecord();


  //exit();
}


void two(float two_x, float two_y){
  fill(0);
  noStroke();
  
  pushMatrix();
  translate(two_x, two_y);
  
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/2020) {
    float no = noise(i/5) +n;
    x = cos(i) *radius /no;
    y = sin(i) *radius /no;
    vertex(x, y);
  }
  endShape(CLOSE);

  noFill();
  stroke(0);
  strokeWeight(2);
  
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/2020) {
    float no = noise(i/5) +n;
    xx = cos(i) *radius*1.2 /no;
    yy = sin(i) *radius*1.2 /no;
    vertex(xx, yy);
  }
  endShape(CLOSE);
  popMatrix();
}



void zero(float two_x, float two_y){
  fill(0);
  noStroke();
  
  pushMatrix();
  translate(two_x, two_y);
  
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/2020) {
    float no = noise(i/5) +n;
    x = cos(i) *radius /no;
    y = sin(i) *radius /no;
    vertex(x, y);
  }
  endShape(CLOSE);
  
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