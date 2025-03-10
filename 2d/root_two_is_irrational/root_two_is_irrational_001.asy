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
 *      Visual for root 2, which is the magnitude of the hypotenuse of a      *
 *      square with side lengths equal to 1.                                  *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_256_default_settings as default;

/*  Radius used for the two circles in Euclid's construction.                 */
real radius = 1.0;

/*  Four points for the square.                                               */
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(1.0, 0.0);
vec2.Vec2 C = vec2.Vec2(1.0, 1.0);
vec2.Vec2 D = vec2.Vec2(0.0, 1.0);

/*  Draw the square and the diagonal across.                                  */
draw("$1$", A.LineTo(B), N);
draw("$1$", B.LineTo(C), W);
draw("$1$", C.LineTo(D), S);
draw("$1$", D.LineTo(A), E);
draw("$\sqrt{2}$", A.LineTo(C), SE);
