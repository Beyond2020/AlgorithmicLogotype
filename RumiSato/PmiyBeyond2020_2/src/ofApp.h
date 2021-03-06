#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    
    ofTrueTypeFont beyondFont;
    ofColor c;
    ofColor c2;
    ofColor c3;
    float hue;
    float hue2;
    float hue3;
    float alph = 100;
    float saturation = 100;
    float brightness = 180;
    
    bool						oneShot;
    bool						pdfRendering;

};


