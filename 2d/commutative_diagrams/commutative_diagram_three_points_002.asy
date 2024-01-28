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
 *      Basic commutative diagram featuring 3 vertices in a triangle. This is *
 *      used for projections and one of the maps is labeled "pi".             *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(64) drawings provided here.          */
import size_64_default_settings as default;

/*  Coordinates for labels.                                                   */
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(1.0, 0.0);
vec2.Vec2 C = vec2.Vec2(0.0, -1.0);

/*  Labels for the final function / arrow in the diagram.                     */
string tf = "$\tilde{f}$";

/*  Draw the arrows.                                                          */
draw("$f$", A.LineTo(B), N, default.sharp_arrow, default.small_margins);
draw("$\pi$", A.LineTo(C), W, default.sharp_arrow, default.small_margins);
draw(tf, C.LineTo(B), SE, default.sharp_arrow, default.small_margins);

/*  Add labels.                                                               */
A.AddLabel("$A$");
B.AddLabel("$B$");
C.AddLabel("$C$");
