  int bg1 = 0;
  int bg2 = 0;
  int bg3 = 0;
  int colorR = 0;
  int colorG = 0;
  int colorB = 0;
  
  
void setup() {

    size(800, 600);
    smooth();
    background(bg1,bg2,bg3); 
    colorMode(RGB);
    colorbrush();
    
}

void colorbrush() {
   PImage b;
   b = loadImage("color.jpg");
   image(b, 0, 0);
  
  int fillcolor1 = 1;
  int fillcolor2 = 111;
  int fillcolor3 = 122;
  int rectposX = 0;
  int strokegroesse = 4;  
  
  for (int i=0; i < height; i++) {
    stroke(fillcolor1, fillcolor2, fillcolor3);
    strokeWeight(strokegroesse);
    line (0, rectposX, 20, rectposX);
    fillcolor1 = fillcolor1 + 2;
    fillcolor2 = fillcolor2 + 10;
    fillcolor3 = fillcolor3 + 3;
    rectposX = rectposX + strokegroesse-1;    
  } 
  
}

void keyReleased() {
    if  ( key == 'l' || key == 'L' ) {  
     background(bg1, bg2, bg3);
     colorbrush();
  }
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("####.jpg");
  }
  
  if (key == 'p' || key == 'P') {
    beginRecord(PDF, "skecth.pdf");
    colorMode(HSB, 100);
    background(100);  
  }
}

void draw() {
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  if (abstand > 20) {  abstand = 20; }
  if (mousePressed && (mouseButton == LEFT))  {  
    if (mouseX >= 35 ) {
      strokeWeight(20-abstand);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
  }
 if (mousePressed && (mouseButton == LEFT) && mouseX < 34) {
    color mouseColor = get(mouseX, mouseY);
    println (round(red(mouseColor)) + "," + round(green(mouseColor)) + "," + round(blue(mouseColor)));
    colorR = (round(red(mouseColor)));
    colorG = (round(green(mouseColor)));
    colorB = (round(blue(mouseColor)));
    
    stroke(colorR, colorG, colorB);
  
  }
  
  if (mousePressed && (mouseButton == LEFT)) {
      if (mouseX <=34 && mouseY >= 550) {
        background(bg1,bg2,bg3); 
       colorbrush();     
     }
    
  }
}