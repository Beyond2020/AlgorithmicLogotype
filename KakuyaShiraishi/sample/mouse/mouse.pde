void setup() {                       
    size(600, 600);               
    smooth();                     
}

void draw() {
    background (213,213,213);
    fill(200,200,200);
    triangle(0, 0, width, 0, mouseX,mouseY); 
    fill(80,80,80);
    triangle(height, height, width, 0, mouseX,mouseY);
    triangle(0, 0, 0, height, mouseX,mouseY);
    fill(20,20,20);
    triangle(0, height, height, height, mouseX, mouseY);
   
    for (int i=0; i < width; i+=20) {  
       line(i, 0, mouseX, mouseY);     
     }
     for (int z=0; z < height; z+=20) {
       line(0, z, mouseX, mouseY);     
     }
     for (int t=0; t < height+20; t+=20) {
       line(mouseX, mouseY, height, t);     
     }
     for (int k=0; k < width+20; k+=20) {
       line(mouseX, mouseY, k, width);     
     }
    
    strokeWeight(2);
    /*
    int linksobenX = (mouseX/20)+25;
    int linksobenY = mouseY/20;
    int linksuntenX = (mouseX/4)+25;
    int linksuntenY = mouseY/4;
    
    pushMatrix();
    translate(600,600);
    float rechtsobenX = -mouseX/20;
    int rechtsobenY = mouseY/20;
    translate(0,0);
     popMatrix();
 
    float rechtsuntenX = width-(mouseX/4);
    int rechtsuntenY = mouseY/4;   
        
    quad(linksobenX, linksobenY, rechtsobenX, rechtsobenY, rechtsuntenX, rechtsuntenY, linksuntenX, linksuntenY);
    
    */
    //
    
    /* fill(233,201,201);
    rect(mouseX-20,mouseY-20,40,40); */
}

void keyPressed(){
  if(key == ' '){
    saveFrame("###.jpg");
  }
}


void mouseClicked() {
      fill(255,255,0);
      triangle(80, 0, 140, 0, mouseX, mouseY);
      triangle(220, 0, 280, 0, mouseX, mouseY);
      triangle(360, 0, 420, 0, mouseX, mouseY);
      triangle(500, 0, 560, 0, mouseX, mouseY);
}