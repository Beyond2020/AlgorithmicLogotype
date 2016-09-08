#include "ofApp.h"

////2020年以降のロゴデザイン制作の方法を見据えた。
////プログラムによって作られたロゴは常に姿形を変えることができる。
////象徴となるロゴは静止しているものに限らず、アニメーションしていたり毎回パターンが変わるものも在りうる。

////このロゴのプログラムは起動する度に異なる色相と多様なパターンを持つグラフィックが発生する。
////複雑な動きをするグラフィックの一瞬を切り取って使用することもできる。
////また、プログラムによって描かれるロゴは数値を調整するだけで色をカスタムすることができる。

//--------------------------------------------------------------
void ofApp::setup(){
    
    oneShot = false;
    pdfRendering = false;
    ofSetFullscreen(true);
    ofHideCursor();
    ofEnableSmoothing();
    ofBackground(255,255,255);
    ofSetCircleResolution(60);
    beyondFont.load("SourceSansPro-Light.otf", 40, true, true, true);
    ofBlendMode(OF_BLENDMODE_ALPHA);
    
    
    
    ////起動する度に異なって現れる色相は地域性、多様性などを表す。
    ////数値を調整することで色相をカスタムできる。
//    hue = ofRandom(0,120);
//    hue2 = ofRandom(121,241);
//    hue3 = ofRandom(242,360);
    
    hue = ofRandom(1,255);
    hue2 = ofRandom(1,255);
    hue3 = ofRandom(1,255);

}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    ////「s」キーを押すことで現在のフレームをPDFとして保存することができる。
    ////「PmiyBeyond2020」フォルダ内「bin」-> 「data」フォルダ内に保存される。
    
    if( oneShot ){
        ofBeginSaveScreenAsPDF("screenshot-"+ofGetTimestampString()+".pdf", false);
    }
    
    ofTranslate(ofGetWidth()/2-100, ofGetHeight()/2-150);
    ofFill();
    ofSetColor(c);
    beyondFont.drawStringAsShapes("Beyond 2020", -40, 300);
    
    ////常に動き続ける円を描くための変数。
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
    
    ////複雑に動き続ける円は、多様性や創造性、複雑な動きを見せる国際化、共存社会などを表す。
    
    ofNoFill();
    for(int i=0;i<100;i++){
        c.setHsb(hue, saturation+i, brightness-100, alph);
        ofSetColor(c);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx, cy);
    }
    
    for(int i=0;i<100;i++){
        c2.setHsb(hue2, saturation+i,brightness, alph);
        ofSetColor(c2);
        ofDrawCircle(100, 100, 100);
        ofTranslate(cx2, cy2);
    }
    
    for(int i=0;i<100;i++){
        c3.setHsb(hue3, saturation+i, brightness, alph-50);
        ofSetColor(c3);
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
