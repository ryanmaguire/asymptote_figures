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

/*  Points for the left strands.                                              */
vec2.Vec2 A[] = {
    vec2.Vec2(-0.5, 0.0),
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(0.5, 0.1),
    vec2.Vec2(1.5, 0.9),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(2.5, 1.0)
};

vec2.Vec2 B0[] = {
    vec2.Vec2(-0.5, 1.0),
    vec2.Vec2(0.0, 1.0),
    vec2.Vec2(0.5, 0.9),
    vec2.Vec2(0.7, 0.8),
    vec2.Vec2(0.9, 0.6)
};

vec2.Vec2 B1[] = {
    vec2.Vec2(1.1, 0.4),
    vec2.Vec2(1.3, 0.2),
    vec2.Vec2(1.5, 0.1),
    vec2.Vec2(2.0, 0.0),
    vec2.Vec2(2.5, 0.0)
};

/*  Points for the right strands.                                             */
vec2.Vec2 C[] = {
    vec2.Vec2(3.5, 0.0),
    vec2.Vec2(4.0, 0.0),
    vec2.Vec2(4.5, 0.1),
    vec2.Vec2(5.5, 0.9),
    vec2.Vec2(6.0, 1.0),
    vec2.Vec2(6.5, 1.0)
};

vec2.Vec2 D0[] = {
    vec2.Vec2(3.5, 1.0),
    vec2.Vec2(4.0, 1.0),
    vec2.Vec2(4.5, 0.9),
    vec2.Vec2(4.7, 0.8),
    vec2.Vec2(4.9, 0.6)
};

vec2.Vec2 D1[] = {
    vec2.Vec2(5.1, 0.4),
    vec2.Vec2(5.3, 0.2),
    vec2.Vec2(5.5, 0.1),
    vec2.Vec2(6.0, 0.0),
    vec2.Vec2(6.5, 0.0)
};

/*  Points for the combined braid.                                            */
vec2.Vec2 E0[] = {
    vec2.Vec2(0.0, -2.0),
    vec2.Vec2(0.5, -2.0),
    vec2.Vec2(1.0, -1.9),
    vec2.Vec2(2.0, -1.1),
    vec2.Vec2(2.5, -1.0),
    vec2.Vec2(3.0, -1.0),
    vec2.Vec2(3.5, -1.0),
    vec2.Vec2(4.0, -1.1),
    vec2.Vec2(4.2, -1.2),
    vec2.Vec2(4.4, -1.4)
};

vec2.Vec2 E1[] = {
    vec2.Vec2(4.6, -1.6),
    vec2.Vec2(4.8, -1.8),
    vec2.Vec2(5.0, -1.9),
    vec2.Vec2(6.0, -2.0)
};

vec2.Vec2 F0[] = {
    vec2.Vec2(0.0, -1.0),
    vec2.Vec2(0.5, -1.0),
    vec2.Vec2(1.0, -1.1),
    vec2.Vec2(1.4, -1.4)
};

vec2.Vec2 F1[] = {
    vec2.Vec2(1.6, -1.6),
    vec2.Vec2(1.8, -1.8),
    vec2.Vec2(2.0, -1.9),
    vec2.Vec2(2.5, -2.0),
    vec2.Vec2(3.0, -2.0),
    vec2.Vec2(3.5, -2.0),
    vec2.Vec2(4.0, -1.9),
    vec2.Vec2(5.0, -1.1),
    vec2.Vec2(5.5, -1.0),
    vec2.Vec2(6.0, -1.0)
};

/*  Guides for the strands.                                                   */
guide gA = vec2.CurveThroughPoints(A);
guide gB0 = vec2.CurveThroughPoints(B0);
guide gB1 = vec2.CurveThroughPoints(B1);
guide gC = vec2.CurveThroughPoints(C);
guide gD0 = vec2.CurveThroughPoints(D0);
guide gD1 = vec2.CurveThroughPoints(D1);
guide gE0 = vec2.CurveThroughPoints(E0);
guide gE1 = vec2.CurveThroughPoints(E1);
guide gF0 = vec2.CurveThroughPoints(F0);
guide gF1 = vec2.CurveThroughPoints(F1);

/*  Draw the braids.                                                          */
draw(gA);
draw(gB0);
draw(gB1);
draw(gC);
draw(gD0);
draw(gD1);
draw(gE0);
draw(gE1);
draw(gF0);
draw(gF1);

/*  Mark off the start and end points for the strands in the braids.          */
A[0].DrawDot(default.dot_radius);
B0[0].DrawDot(default.dot_radius);
C[0].DrawDot(default.dot_radius);
D0[0].DrawDot(default.dot_radius);
E0[0].DrawDot(default.dot_radius);
F0[0].DrawDot(default.dot_radius);

A[A.length - 1].DrawDot(default.dot_radius);
B1[B1.length - 1].DrawDot(default.dot_radius);
C[C.length - 1].DrawDot(default.dot_radius);
D1[D1.length - 1].DrawDot(default.dot_radius);
E1[E1.length - 1].DrawDot(default.dot_radius);
F1[F1.length - 1].DrawDot(default.dot_radius);
