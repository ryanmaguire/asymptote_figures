/******************************************************************************
 *                                  LICENSE                                   *
 ******************************************************************************
 *  This file is part of asymptote_figures.                                   *
 *                                                                            *
 *  asymptote_figures is free software: you can redistribute it and/or        *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  asymptote_figures is distributed in the hope that it will be useful       *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with asymptote_figures. If not see <https://www.gnu.org/licenses/>. *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Draw a commutative diagram showing associativity of composition.      *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Four points for the vertices of the commutative diagram.                  */
vec2.Vec2 A = vec2.Vec2(-3.0, 0.000);
vec2.Vec2 B = vec2.Vec2(+0.0, 5.196);
vec2.Vec2 C = vec2.Vec2(+3.0, 0.000);
vec2.Vec2 D = vec2.Vec2(+0.0, 1.732);

/*  Label the points.                                                         */
A.AddLabel("$A$");
B.AddLabel("$B$");
C.AddLabel("$C$");
D.AddLabel("$D$");

/*  Labels for the three rotated arrows. These are the function compositions. */
Label h = rotate(-30)*Label("$h$");
Label hg = rotate(-90)*Label("$h\circ{g}$");
Label hgf = rotate(30)*Label("$h\circ{g}\circ{f}$");

/*  Draw arrows between the points.                                           */
draw("$f$", A.LineTo(B), NW, default.sharp_arrow, default.margins);
draw("$g$", B.LineTo(C), NE, default.sharp_arrow, default.margins);
draw("$g\circ{f}$", A.LineTo(C), default.sharp_arrow, default.margins);
draw(h, C.LineTo(D), SW, default.sharp_arrow, default.margins);
draw(hg, B.LineTo(D), E, default.sharp_arrow, default.margins);
draw(hgf, A.LineTo(D), default.sharp_arrow, default.margins);
