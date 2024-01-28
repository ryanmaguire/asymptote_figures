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
 *      Draws a commutative diagram with four vertices in a square with       *
 *      arrows drawn so that the figure commutes.                             *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(128) drawings provided here.         */
import size_128_default_settings as default;

/*  Coordinates for the labels.                                               */
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(1.0, 0.0);
vec2.Vec2 C = vec2.Vec2(0.0, -1.0);
vec2.Vec2 D = vec2.Vec2(1.0, -1.0);

/*  Draw the arrows.                                                          */
draw("$\alpha$", A.LineTo(B), N, default.sharp_arrow, default.margins);
draw("$\beta$", B.LineTo(D), E, default.sharp_arrow, default.margins);
draw("$\gamma$", A.LineTo(C), W, default.sharp_arrow, default.margins);
draw("$\delta$", C.LineTo(D), S, default.sharp_arrow, default.margins);

/*  Label the points.                                                         */
A.AddLabel("$A$");
B.AddLabel("$B$");
C.AddLabel("$C$");
D.AddLabel("$D$");
