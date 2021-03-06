import controlP5.*;
import processing.pdf.*;


ControlP5 controlP5; 

public float punkt1=263; 
public float punkt2=330;
public float r = 150;
public float g = 150;
public float b = 150;
public float boden=320;

int counter;

void setup(){
  size(600,600);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1", 0,800, 400, 10,10, 200, 10);
  controlP5.addSlider("punkt2", 0,800, 400, 10,30, 200, 10);
  controlP5.addSlider("boden", 0,800, 400, 10,50, 200, 10);
  controlP5.addSlider("r", 0, 255, 150, 10,70, 200, 10);
  controlP5.addSlider("g", 0, 255, 150, 10,90, 200, 10);
  controlP5.addSlider("b", 0, 255, 150, 10,110, 200, 10);
}

void draw(){
  background(255);
beginShape();
fill(r,g,b, 95);
vertex(59, boden);
bezierVertex(77, 171, 143, 193, 165, punkt1);
bezierVertex(183, punkt2, 236, 187, 290, punkt1);
bezierVertex(347, punkt2, 369, 228, 412, boden);

endShape();
  

beginShape();
fill(r,b,g, 95);
vertex(109, boden); 
bezierVertex(127, 221, 193, 193, 215, punkt1);
bezierVertex(233, punkt2, 286, 187, 340, punkt1);
bezierVertex(397, punkt2, 429, 228, 462, boden);
endShape();  
  
  
  endRecord(); 

}


void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"logo"+counter+".pdf"); 
  }
}
