#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    oneShot = false;
    pdfRendering = false;

    ofSetFullscreen(true);
    ofHideCursor();
    ofEnableSmoothing();
    ofBackground(255,255,255);
    beyondFont.load("rounded-l-mplus-1p-light.ttf", 40, true, true, true);
    hue = ofRandom(0,255);
    ofSetCircleResolution(60);
    
}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){

    if( oneShot ){
        ofBeginSaveScreenAsPDF("screenshot-"+ofGetTimestampString()+".pdf", false);
    }

    
    ofFill();
    beyondFont.drawStringAsShapes("Beyond 2020", ofGetWidth()/2-160, ofGetHeight()/2+150);
    ofTranslate(ofGetWidth()/2-100, ofGetHeight()/2-150);

    float amplitude = 0.9;
    float speedDampen = ofNoise(0,1000);
    float speedDampen2 = ofNoise(0,500);
    float cx = ofSignedNoise(ofGetElapsedTimef()/speedDampen)*amplitude;
    float cy = ofSignedNoise(ofGetElapsedTimef()/speedDampen2)*amplitude;
    
    float speedDampen3 = ofNoise(0,900);
    float speedDampen4 = ofNoise(0,100);
    float cx2 = ofSignedNoise(ofGetElapsedTimef()/speedDampen3)*amplitude;
    float cy2 = ofSignedNoise(ofGetElapsedTimef()/speedDampen4)*amplitude;
    
    float speedDampen5 = ofNoise(0,800);
    float speedDampen6 = ofNoise(0,200);
    float cx3 = ofSignedNoise(ofGetElapsedTimef()/speedDampen5)*amplitude;
    float cy3 = ofSignedNoise(ofGetElapsedTimef()/speedDampen6)*amplitude;
    
    
    ofNoFill();
    for(int i=0;i<100;i++){
        c.setHsb(hue, 50+i,70, alph);
        ofSetColor(c);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx, cy);
    }
   
    for(int i=0;i<100;i++){
        c.setHsb(hue, 50+i,70, alph);
        ofSetColor(c);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx2, cy2);
    }
   
    for(int i=0;i<100;i++){
        c.setHsb(hue, 50+i,70, alph);
        ofSetColor(c);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx3, cy3);
    }
    
    if( oneShot ){
        ofEndSaveScreenAsPDF();
        oneShot = false;
    }

    
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
    if( !pdfRendering && key == 's' ){
        oneShot = true;
    }

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
