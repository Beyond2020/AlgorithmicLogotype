#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    oneShot = false;
    pdfRendering = false;

    
    ofSetFullscreen(true);
    ofHideCursor();
    ofEnableSmoothing();
    ofBackground(255,255,255);
    ofSetBackgroundAuto(false);
    beyondFont.load("Andis-Light.ttf", 40, true, true, true);
    hue = ofRandom(0,255);
    
}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){

    
    ofTranslate(ofGetWidth()/2-100, ofGetHeight()/2-150);
    ofFill();
    beyondFont.drawStringAsShapes("Beyond 2020", -30, 330);
    
    float amplitude = 1;
    float speedDampen = ofNoise(0,1000);
    float speedDampen2 = ofNoise(0,500);
    float cx = ofSignedNoise(ofGetElapsedTimef()/speedDampen)*amplitude;
    float cy = ofSignedNoise(ofGetElapsedTimef()/speedDampen2)*amplitude;
    
    ofNoFill();
    for(int i=0;i<100;i++){
    
        c.setHsb(hue, 50+i, 10+i);
        ofSetColor(c);
        ofSetCircleResolution(60);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx, cy);
    }
    
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
    if( key=='r'){
        pdfRendering = !pdfRendering;
        if( pdfRendering ){
            ofSetFrameRate(12);  // so it doesn't generate tons of pages
            ofBeginSaveScreenAsPDF("recording-"+ofGetTimestampString()+".pdf", true);
        }else{
            ofSetFrameRate(60);
            ofEndSaveScreenAsPDF();
        }
    }
    
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
