ArrayList<Particle> particles = new ArrayList<Particle>();
int pixelSteps = 6; 
boolean drawAsPoints = false;
ArrayList<String> words = new ArrayList<String>();
int wordIndex = 0;
color bgColor = color(255, 100);
String fontName = "Arial Bold";


class Particle {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);

  float closeEnoughTarget = 50;
  float maxSpeed = 4.0;
  float maxForce = 0.1;
  float particleSize = 5;
  boolean isKilled = false;

  color startColor = color(0);
  color targetColor = color(0);
  float colorWeight = 0;
  float colorBlendRate = 0.025;

  void move() {
 
    float proximityMult = 1.0;
    float distance = dist(this.pos.x, this.pos.y, this.target.x, this.target.y);
    if (distance < this.closeEnoughTarget) {
      proximityMult = distance/this.closeEnoughTarget;
    }

    PVector towardsTarget = new PVector(this.target.x, this.target.y);
    towardsTarget.sub(this.pos);
    towardsTarget.normalize();
    towardsTarget.mult(this.maxSpeed*proximityMult);

    PVector steer = new PVector(towardsTarget.x, towardsTarget.y);
    steer.sub(this.vel);
    steer.normalize();
    steer.mult(this.maxForce);
    this.acc.add(steer);

  
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void draw() {
    color currentColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
    if (drawAsPoints) {
      stroke(currentColor);
      point(this.pos.x, this.pos.y);
    } else {
      noStroke();
      fill(currentColor);
      ellipse(this.pos.x, this.pos.y, this.particleSize, this.particleSize);
    }

    if (this.colorWeight < 1.0) {
      this.colorWeight = min(this.colorWeight+this.colorBlendRate, 1.0);
    }
  }

  void kill() {
    if (! this.isKilled) {

      PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
      this.target.x = randomPos.x;
      this.target.y = randomPos.y;

      this.startColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
      this.targetColor = color(0);
      this.colorWeight = 0;

      this.isKilled = true;
    }
  }
}


PVector generateRandomPos(int x, int y, float mag) {
  PVector sourcePos = new PVector(x, y);
  PVector randomPos = new PVector(random(0, width), random(0, height));

  PVector direction = PVector.sub(randomPos, sourcePos);
  direction.normalize();
  direction.mult(mag);
  sourcePos.add(direction);

  return sourcePos;
}


void nextWord(String word) {
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textSize(100);
  pg.textAlign(CENTER);
  PFont font = createFont(fontName, 100);
  pg.textFont(font);
  pg.text(word, width/2, height/2);
  pg.endDraw();
  pg.loadPixels();

  color newColor = color(random(0.0, 255.0), random(0.0, 255.0), random(0.0, 255.0));

  int particleCount = particles.size();
  int particleIndex = 0;

  ArrayList<Integer> coordsIndexes = new ArrayList<Integer>();
  for (int i = 0; i < (width*height)-1; i+= pixelSteps) {
    coordsIndexes.add(i);
  }

  for (int i = 0; i < coordsIndexes.size (); i++) {

    int randomIndex = (int)random(0, coordsIndexes.size());
    int coordIndex = coordsIndexes.get(randomIndex);
    coordsIndexes.remove(randomIndex);

    if (pg.pixels[coordIndex] != 0) {

      int x = coordIndex % width;
      int y = coordIndex / width;

      Particle newParticle;

      if (particleIndex < particleCount) {
 
        newParticle = particles.get(particleIndex);
        newParticle.isKilled = false;
        particleIndex += 1;
      } else {

        newParticle = new Particle();
        
        PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
        newParticle.pos.x = randomPos.x;
        newParticle.pos.y = randomPos.y;
        
        newParticle.maxSpeed = random(2.0, 5.0);
        newParticle.maxForce = newParticle.maxSpeed*0.025;
        newParticle.particleSize = random(3, 6);
        newParticle.colorBlendRate = random(0.0025, 0.03);
        
        particles.add(newParticle);
      }
      
      newParticle.startColor = lerpColor(newParticle.startColor, newParticle.targetColor, newParticle.colorWeight);
      newParticle.targetColor = newColor;
      newParticle.colorWeight = 0;
      
      newParticle.target.x = x;
      newParticle.target.y = y;
    }
  }

  if (particleIndex < particleCount) {
    for (int i = particleIndex; i < particleCount; i++) {
      Particle particle = particles.get(i);
      particle.kill();
    }
  }
}


void setup() {
  size(1000, 300);
  background(255);

  words.add("BEYOND 2020");
  words.add("Beyond 2020");
  words.add("beyond 2020");
  words.add("beyond2020");
  words.add("");
  nextWord(words.get(wordIndex));
}


void draw() {
  fill(bgColor);
  noStroke();
  rect(0, 0, width*2, height*2);

  for (int x = particles.size ()-1; x > -1; x--) {
    Particle particle = particles.get(x);
    particle.move();
    particle.draw();

    if (particle.isKilled) {
      if (particle.pos.x < 0 || particle.pos.x > width || particle.pos.y < 0 || particle.pos.y > height) {
        particles.remove(particle);
      }
    }
  }

}

/*
void mousePressed() {
  if (mouseButton == LEFT) {
    wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
    nextWord(words.get(wordIndex));
  }
}
*/

void mouseDragged() {
  if (mouseButton == LEFT) {
    for (Particle particle : particles) {
      if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 50) {
        particle.kill();
      }
    }
  }
}


void keyPressed() {
  if (key == 'c'){
    drawAsPoints = (! drawAsPoints);
    if (drawAsPoints) {
      background(0);
      bgColor = color(0, 40);
    } else {
      background(255);
      bgColor = color(255, 100);
    }
  } else if (key == ' '){
    if(key == ' '){
    wordIndex += 1;
    if(wordIndex > words.size()-1){
      wordIndex = 0;
    }
    nextWord(words.get(wordIndex));
  }
  }
}
