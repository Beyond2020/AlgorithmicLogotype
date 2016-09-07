import processing.pdf.*;

float x_fill, y_fill;
float x_line, y_line;
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
}


void draw() {
  noLoop();
  
  translate(width/2, height/2.3);
  
   //ロゴ
   //個人からひとつのかたちへ形成
  pushMatrix();
  for(int i=180; i<=720; i+=90){
    one(random(2.0,2.9), random(80));
    rotate(radians(i));
  }
  popMatrix();
  
  //ロゴタイプ
  PFont font = loadFont("Courier-32.vlw");
  textFont(font);
  textAlign(CENTER);
  drawOutlineText("beyond2020", 0,0 +radius +200, 36, color(193,35,41), color(0,0,100));
  
  //exit();
}


//ひとりひとり、個人
void one(float n, float H){
  fill(H, S, B, A);
  noStroke();
  
  pushMatrix();
  beginShape();
  for (float i = 0; i < TWO_PI/2; i += TWO_PI/2020) {
    //noise = 個性
    float no = noise(i /n);
    x_fill = cos(i) *radius /no;
    y_fill = sin(i) *radius /no;
    vertex(x_fill, y_fill);
  }
  endShape(CLOSE);
  
  noFill();
  stroke(H, S, B, A);
  strokeWeight(3);
  
  beginShape();
  for (float i = 0; i < TWO_PI/2; i += TWO_PI/360) {
    //上と同様、noise = 個性
    float no = noise(i /n);
    x_line = cos(i) *radius*1.2 /no;
    y_line = sin(i) *radius*1.2 /no;
    vertex(x_line, y_line);
  }
  endShape();
  popMatrix();
}


//ロゴタイプの白フチ
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