/*
 **      beyond2020 Emblem 3D Sample
 **
 **      Original Copyright (C) 2016 - 2016 KUBOTA Akihiro.
 **                                         https://www.facebook.com/hemokosa
 **                                         kubotaa@tamabi.ac.jp
 **      Portions Copyright (C) <year> <author>
 **                             <website>
 **                             <e-mail>
 **
 **      Version     1.0
 **      Website     https://www.facebook.com/hemokosa
 **      E-mail      kubotaa@tamabi.ac.jp
 **
 **      This source code is for Processing3
 **      https://processing.org/
 **
 **      beyond2020_3D.pde
 **
 **      ------------------------------------------------------------------------
 **
 **      GNU GENERAL PUBLIC LICENSE (GPLv3)
 **
 **      This program is free software: you can redistribute it and/or modify
 **      it under the terms of the GNU General Public License as published by
 **      the Free Software Foundation, either version 3 of the License,
 **      or (at your option) any later version.
 **      This program is distributed in the hope that it will be useful,
 **      but WITHOUT ANY WARRANTY; without even the implied warranty of
 **      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 **      See the GNU General Public License for more details.
 **      You should have received a copy of the GNU General Public License
 **      along with this program. If not, see <http://www.gnu.org/licenses/>.
 **
 **      このプログラムはフリーソフトウェアです。あなたはこれをフリーソフトウェア財団によって発行された
 **      GNU 一般公衆利用許諾書（バージョン 3 か、それ以降のバージョンのうちどれか）が定める条件の下で
 **      再頒布または改変することができます。このプログラムは有用であることを願って頒布されますが、
 **      *全くの無保証* です。商業可能性の保証や特定目的への適合性は、言外に示されたものも含め全く存在しません。
 **      詳しくは GNU 一般公衆利用許諾書をご覧ください。
 **      あなたはこのプログラムと共に GNU 一般公衆利用許諾書のコピーを一部受け取っているはずです。
 **      もし受け取っていなければ <http://www.gnu.org/licenses/> をご覧ください。
 */

//import processing.pdf.*;

JSONObject json, sensors;
JSONArray results;

int time;
float lat = 0.0;
float lon = 0.0;
float alt = 0.0;
float val = 0.0;
float lat0, lon0, alt0;

PFont font;
PImage img;

void setup() {

  // for importing csv files into a 2d array
  // by che-wei wang
  // http://cwwang.com/2008/02/23/csv-import-for-processing/

  String lines[] = loadStrings("sensor_data_range.csv");
  String [][] csv;
  int csvWidth=0;

  //calculate max width of csv file
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }

  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];

  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }

  size(800, 800, P3D); // square
  smooth();
  background(255);
  //background(34,25,23);
  colorMode(HSB, 360);
  blendMode(BLEND);

  // Top Emblem

  float x, y, z;

  curveTightness(0.4);
  strokeWeight(width/40.0);
  //strokeWeight(1);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();

  translate(0.5*width, 0.5*width, 0.0);
  rotateX(PI/8);
  //rotateY(-PI/4);
  //rotateZ(PI/4);

  for (int i = 0; i < lines.length-10; i += 1) {
    int j = 0;
    int k = 0;

    beginShape();
    while (j < 4 & i+k < lines.length-1) {
      lat0 = lat;
      lon0 = lon;
      alt0 = alt;

      time = int(Float.parseFloat(csv[i+k][0]));
      lat = int(Float.parseFloat(csv[i+k][1]));
      lon = int(Float.parseFloat(csv[i+k][2]));
      alt = int(Float.parseFloat(csv[i+k][3]));
      val = int(Float.parseFloat(csv[i+k][4]));

      if (lon0!=lon) {

        x = width / 2250.0 * (alt+500) * cos(radians(lon)) * cos(radians(lat));
        y = width / 2250.0 * (alt+500) * sin(radians(lon)) * cos(radians(lat));
        z = width / 2250.0 * (alt+500) * sin(radians(lat));

        stroke(map(val, -10, 25, 250, 0), 360, 360, 240); // color
        //stroke(0, 0, map(val, -10, 15, 0, 255), 120); // gray
        curveVertex(x, y, z);
        print(time);
        print(", ");
        print(lat);
        print(", ");
        print(lon);
        print(", ");
        print(alt);
        print(", ");
        println(val);
        j += 1;
      }
      k += 1;
    }  
    endShape();
    println("draw shape");
  }
}