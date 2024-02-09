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
 *      Draws an oriented trefoil with unsigned Gauss code.                   *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Points for the virtual knot.                                              */
vec2.Vec2 A = vec2.Vec2(0.0, 0.0);
vec2.Vec2 B = vec2.Vec2(0.3, 0.5);
vec2.Vec2 AB0 = A + 0.45*(B - A);
vec2.Vec2 AB1 = A + 0.55*(B - A);
vec2.Vec2 C = vec2.Vec2(0.0, 1.0);
vec2.Vec2 D = vec2.Vec2(1.0, 1.5);
vec2.Vec2 E = vec2.Vec2(0.3, 0.0);
vec2.Vec2 F = vec2.Vec2(0.0, 0.5);
vec2.Vec2 G = vec2.Vec2(0.3, 1.0);
vec2.Vec2 FG0 = F + 0.45*(G - F);
vec2.Vec2 FG1 = F + 0.55*(G - F);
vec2.Vec2 H = vec2.Vec2(1.0, -0.5);
vec2.Vec2 I = B + 0.1*(C - B);
vec2.Vec2 J = vec2.Vec2(0.53, 0.5);

/*  Draw the knot diagram with over-under information.                        */
draw(B.LineTo(C));
draw(C.LineTo(D));
draw(D.LineTo(E));
draw(E.LineTo(F));
draw(F.LineTo(FG0));
draw(FG1.LineTo(G));
draw(G.LineTo(H));
draw(A.LineTo(AB0));
draw(AB1.LineTo(B));
draw(H.LineTo(A));
draw(B.LineTo(I));

/*  Mark off the virtual crossing with a circle.                              */
J.DrawCircle(0.05);
