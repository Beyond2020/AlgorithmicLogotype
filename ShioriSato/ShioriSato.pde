import processing.pdf.*;

float x_fill, y_fill;
float x_line, y_line;
int radius = 60;
int S = 100;
int B = 100;
int A = 50;
static float min = 0.15;

void setup() {
  size(800, 800, PDF, "01.pdf");
  //size(800, 800);
  background(255);
  noiseDetail(2);
  colorMode(HSB, 360, 100, 100, 100);
}


void draw() {
  noLoop();
  
  translate(width/2, height/2);
  
   //ロゴ
   //個人からひとつのかたちへ形成
  pushMatrix();
  for(int i=180; i<=720; i+=90){
    one(random(2.0,2.9), random(80));
    rotate(radians(i));
  }
  popMatrix();
  
  
  exit();
}


//ひとりひとり、個人
void one(float n, float H){
  fill(H, S, B, A);
  noStroke();
  
  pushMatrix();
  beginShape();
  for (float i = -0.05; i < TWO_PI/1.97; i += TWO_PI/2020) {
    //noise = 個性
    float no = min + noise(i /n);
    x_fill = cos(i) *radius /no;
    y_fill = sin(i) *radius /no;
    vertex(x_fill, y_fill);
  }
  endShape(CLOSE);
  
  noFill();
  stroke(H, S, B, A);
  strokeWeight(3);
  
  beginShape();
  for (float i = -0.2; i < TWO_PI/1.8; i += TWO_PI/360) {
    //上と同様、noise = 個性
    float no = min + noise(i /n);
    x_line = cos(i) *radius*1.2 /no;
    y_line = sin(i) *radius*1.2 /no;
    vertex(x_line, y_line);
  }
  endShape();
  popMatrix();
}