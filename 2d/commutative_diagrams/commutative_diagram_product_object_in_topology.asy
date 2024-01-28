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
 *      Shows a commutative diagram depicting the product of topological      *
 *      spaces. This is the "categorical" definition of topological product.  *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Mark three points for the labels.                                         */
vec2.Vec2 Y = vec2.Vec2(0.0, 0.0);
vec2.Vec2 X1 = vec2.Vec2(-1.5, -1.0);
vec2.Vec2 X2 = vec2.Vec2(1.5, -1.0);
vec2.Vec2 X12 = vec2.Vec2(0.0, -1.0);

/*  Custom margins for the center label, which is wider than the others.      */
margin widemargins = TrueMargin(0.9cm, 0.5cm);

/*  Draw the arrows.                                                          */
draw("$f_{1}$", Y.LineTo(X1), NW, default.sharp_arrow, default.margins);
draw("$f_{2}$", Y.LineTo(X2), NE, default.sharp_arrow, default.margins);
draw("$f$", Y.LineTo(X12), W, default.sharp_arrow, default.margins);
draw("$\pi_{1}$", X12.LineTo(X1), S, default.sharp_arrow, widemargins);
draw("$\pi_{2}$", X12.LineTo(X2), S, default.sharp_arrow, widemargins);

/*  Label the points.                                                         */
X1.AddLabel("$X_{1}$");
X2.AddLabel("$X_{2}$");
Y.AddLabel("$Y$");
X12.AddLabel("$X_{1}\times{X}_{2}$");
