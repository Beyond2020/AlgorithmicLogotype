/*  beyond2020 Emblem Sample Program
**
**      Original Copyright (C) 2015 - 2015 KUBOTA Akihiro.
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
**      Sample2020P.pde
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

size(600, 600, PDF, "Sample2020P.pdf");
background(0);
noStroke();

float a = 200;

fill(#FFD700);
rect(0, 0, a, a);

fill(#808080);
rect(2*a, 2*a, 3*a, 3*a);

ellipseMode(RADIUS);
float r = sqrt(1.5*1.5+0.5*0.5)*a;
fill(#000000);
ellipse(1.5*a, 1.5*a, r, r);

fill(#FFFFFF);
rect(a, 0, a, 3*a);

fill(#FF0000);
ellipse(2.5*a, 0.5*a, 0.5*a, 0.5*a); 