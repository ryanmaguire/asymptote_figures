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
 *      Draws a commutative diagram with 4 vertices, three in 1 column on the *
 *      left and 1 by itself on the right, with arrows connecting to form     *
 *      two triangular regions. This is used in various lecture notes.        *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(128) drawings provided here.         */
import size_128_default_settings as default;

/*  Mark coordinates for the points.                                          */
real height = -0.7;
real width = 0.9;
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(0.0, -height);
vec2.Vec2 C = vec2.Vec2(0.0, -2.0*height);
vec2.Vec2 D = vec2.Vec2(width, -height);

/*  Draw the arrows.                                                          */
draw("$f_{1}$", A.LineTo(D), SE, default.sharp_arrow, default.small_margins);
draw("$f_{2}$", B.LineTo(D), S, default.sharp_arrow, default.small_margins);
draw("$f_{3}$", C.LineTo(D), NE, default.sharp_arrow, default.small_margins);
draw("$g_{1}$", A.LineTo(B), W, default.sharp_arrow, default.small_margins);
draw("$g_{2}$", B.LineTo(C), W, default.sharp_arrow, default.small_margins);

/*  Label the points.                                                         */
A.AddLabel("$A$");
B.AddLabel("$B$");
C.AddLabel("$C$");
D.AddLabel("$D$");
