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

import processing.pdf.*;

void setup() {

  size(1000, 200, PDF, "Tokyo2020T.pdf");
  smooth();
  background(255);
  colorMode(HSB, 360);

  // Word Mark

  stroke(0);
  strokeWeight(0.2);
  strokeCap(PROJECT);
  strokeJoin(MITER);

  translate(width*0.03, width*0.05);
  scale(width*0.018, width*0.018);

  draw_B();
  translate(5, 0);
  draw_E();
  translate(5, 0);
  draw_Y();
  translate(5, 0);
  draw_O();
  translate(5, 0);
  draw_N();
  translate(5, 0);
  draw_D();
  translate(6.2, 0);
  draw_2();
  translate(5, 0);
  draw_0();
  translate(5, 0);
  draw_2();
  translate(5, 0);
  draw_0();

  exit();
}


// Letters

void draw_B() {
  line( 0, 0, 4, 0 );
  line( 4, 0, 2, 3 );
  line( 2, 3, 4, 6 );
  line( 4, 6, 0, 6 );
  line( 0, 6, 0, 0 );
}

void draw_E() {
  line( 0, 0, 4, 0 );
  line( 0, 3, 3, 3 );
  line( 4, 6, 0, 6 );
  line( 0, 6, 0, 0 );
}

void draw_Y() {
  line( -0.2, 0, 2, 4 );
  line( 4.2, 0, 2, 4 );
  line( 2, 4, 2, 6 );
}

void draw_O() {
  line( 0, 0, 4, 0 );
  line( 4, 0, 4, 6 );
  line( 4, 6, 0, 6 );
  line( 0, 6, 0, 0 );
}

void draw_N() {
  line( 0, 6, 0, 0 );
  line( 0, 0, 4, 6 );
  line( 4, 6, 4, 0 );
}

void draw_D() {
  line( 0, 0, 4, 1 );
  line( 4, 1, 4, 5 );
  line( 4, 5, 0, 6 );
  line( 0, 6, 0, 0 );
}

void draw_2() {
  line( 0, 0, 4, 0 );
  line( 4, 0, 4, 3 );
  line( 4, 3, 0, 3 );
  line( 0, 3, 0, 6 );
  line( 0, 6, 4, 6 );
}

void draw_0() {
  line( 0, 0, 4, 0 );
  line( 4, 0, 4, 6 );
  line( 4, 6, 0, 6 );
  line( 0, 6, 0, 0 );
  line( 0.1, 4, 6.1, 1.25 );
}