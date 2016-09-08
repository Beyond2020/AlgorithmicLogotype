/* ------------------------------------------------------------------ *
 * beyond2020 アルゴリズミック・ロゴタイプ
 *
 * Created by 白石 覚也
 *
 * ------------------------------------------------------------------ */
import processing.pdf.*;

int a = -70;
int b = -50;
int c = 100;
int d = 133;
float corner = 30;

boolean record;

void setup(){
  size(500,500);
  background(255);
  noLoop();
  noFill();
 
  beginRecord(PDF,month()+"／"+nf(day(),2)+"_"+nf(hour(),2)+"："+nf(minute(),2)+"："+nf(second(),2)+".pdf");
  
  PFont font = createFont("GenShinGothic-ExtraLight.ttf",50);
  textFont(font);
  textAlign(CENTER);
  Textdraw("beyond2020", width/2, height/2 + 80, 50, color(0));
}

void draw(){
  strokeWeight(3);
  smooth();
  translate(width/2, height/2-150);

  pushMatrix();

  noStroke();
  fill(232,107,121,150); //紅梅色 -日本の力強さ-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  stroke(5);
  rotate(36*PI/180);
  
  translate(100,0);
  rotate(-36*PI/180);
  noStroke();
  fill(138,162,211,150); //青藤 -日本の優美さと華麗さ-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(108*PI/180);
  
  translate(100,0);
  rotate(-108*PI/180);
  noStroke();
  fill(251,210,107,150); //花葉色 -温かみと親しみやすさ-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(180*PI/180);
  
  translate(100,0);
  rotate(-180*PI/180);
  noStroke();
  fill(108,187,80,150); //鮮緑 -日本の平和の永遠性と自然の美-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(252*PI/180);

  translate(100,0);
  rotate(-252*PI/180);
  noStroke();
  fill(126,199,216,150); //水縹  -日本の人々の思いやり-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  
  popMatrix();

  endRecord();
}

void Textdraw(String text, float x, float y, int size , int fgColor) {
  float outlineWidth = (float)(size / 24.0);
  textSize(size);
  fill(fgColor);
  text(text, x, y + size);
}