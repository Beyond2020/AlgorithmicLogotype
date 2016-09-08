import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class beyond2020 extends PApplet {

/* ------------------------------------------------------------------ *
 * beyond2020 \u30a2\u30eb\u30b4\u30ea\u30ba\u30df\u30c3\u30af\u30fb\u30ed\u30b4\u30bf\u30a4\u30d7
 *
 * Created by \u767d\u77f3 \u899a\u4e5f
 *
 * ------------------------------------------------------------------ */


int a = -70;
int b = -50;
int c = 100;
int d = 133;
float corner = 30;

boolean record;

public void setup(){
  
  background(255);
  noLoop();
  noFill();
 
  beginRecord(PDF,month()+"\uff0f"+nf(day(),2)+"_"+nf(hour(),2)+"\uff1a"+nf(minute(),2)+"\uff1a"+nf(second(),2)+".pdf");
  
  PFont font = createFont("GenShinGothic-ExtraLight.ttf",50);
  textFont(font);
  textAlign(CENTER);
  Textdraw("beyond2020", width/2, height/2 + 80, 50, color(0));
}

public void draw(){
  strokeWeight(3);
  smooth();
  translate(width/2, height/2-150);

  pushMatrix();

  noStroke();
  fill(232,107,121,150); //\u7d05\u6885\u8272 -\u65e5\u672c\u306e\u529b\u5f37\u3055-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  stroke(5);
  rotate(36*PI/180);
  
  translate(100,0);
  rotate(-36*PI/180);
  noStroke();
  fill(138,162,211,150); //\u9752\u85e4 -\u65e5\u672c\u306e\u512a\u7f8e\u3055\u3068\u83ef\u9e97\u3055-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(108*PI/180);
  
  translate(100,0);
  rotate(-108*PI/180);
  noStroke();
  fill(251,210,107,150); //\u82b1\u8449\u8272 -\u6e29\u304b\u307f\u3068\u89aa\u3057\u307f\u3084\u3059\u3055-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(180*PI/180);
  
  translate(100,0);
  rotate(-180*PI/180);
  noStroke();
  fill(108,187,80,150); //\u9bae\u7dd1 -\u65e5\u672c\u306e\u5e73\u548c\u306e\u6c38\u9060\u6027\u3068\u81ea\u7136\u306e\u7f8e-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  rotate(252*PI/180);

  translate(100,0);
  rotate(-252*PI/180);
  noStroke();
  fill(126,199,216,150); //\u6c34\u7e39  -\u65e5\u672c\u306e\u4eba\u3005\u306e\u601d\u3044\u3084\u308a-
  rect(random(a,b),random(a,b),random(c,d),random(c,d),corner);
  
  popMatrix();

  endRecord();
}

public void Textdraw(String text, float x, float y, int size , int fgColor) {
  float outlineWidth = (float)(size / 24.0f);
  textSize(size);
  fill(fgColor);
  text(text, x, y + size);
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "beyond2020" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
