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
 *      Commutative diagram for the free object in topology. This is the      *
 *      discrete topology. Given a set X the free topological object on X is  *
 *      the topological space (C(X), CT) and map alpha : X -> C(X) such that  *
 *      for any topological space (Y, T) and any function f: X -> Y there is  *
 *      an induced continuous function f':C(X) -> Y such that                 *
 *      f(x) = f'(alpha(x)). The space (C(X), CT) is (X, P(X)), where P(X) is *
 *      the power set of X. The map alpha is the identity. This figure        *
 *      demonstrates this idea via commutative diagram.                       *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(128) drawings provided here.         */
import size_128_default_settings as default;

/*  Mark three points for A, B, and C.                                        */
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(1.0, 0.5);
vec2.Vec2 C = vec2.Vec2(1.0, -0.5);

/*  Label for the dashed arrow. "tilde-f," the induced continuous function.   */
Label L = Label("$\tilde{f}$");

/*  Draw the arrows.                                                          */
draw("$\alpha$", A.LineTo(B), NW, default.sharp_arrow, default.margins);
draw(L, B.LineTo(C), E, default.dash_pen, default.sharp_arrow, default.margins);
draw("$f$", A.LineTo(C), SW, default.sharp_arrow, default.margins);

/*  Label the points.                                                         */
A.AddLabel("$X$");
B.AddLabel("$F(X)$");
C.AddLabel("$Y$");
