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
 *      Draws a braid closure for the Hopf link.                              *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Points for the braid.                                                     */
vec2.Vec2 A0[] = {
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

vec2.Vec2 A1[] = {
    vec2.Vec2(4.6, -1.6),
    vec2.Vec2(4.8, -1.8),
    vec2.Vec2(5.0, -1.9),
    vec2.Vec2(6.0, -2.0)
};

vec2.Vec2 B0[] = {
    vec2.Vec2(0.0, -1.0),
    vec2.Vec2(0.5, -1.0),
    vec2.Vec2(1.0, -1.1),
    vec2.Vec2(1.4, -1.4)
};

vec2.Vec2 B1[] = {
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

/*  Guides for closing off the braid and forming a Hopf link.                 */
vec2.Vec2 CA[] = {
    vec2.Vec2(0.0, -1.0),
    vec2.Vec2(-0.5, -0.1),
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(1.0, 0.0),
    vec2.Vec2(2.0, 0.0),
    vec2.Vec2(3.0, 0.0),
    vec2.Vec2(4.0, 0.0),
    vec2.Vec2(5.0, 0.0),
    vec2.Vec2(6.0, 0.0),
    vec2.Vec2(6.5, -0.1),
    vec2.Vec2(6.0, -1.0)
};

vec2.Vec2 CB[] = {
    vec2.Vec2(0.0, -2.0),
    vec2.Vec2(-1.0, -1.5),
    vec2.Vec2(0.0, 1.0),
    vec2.Vec2(1.0, 1.0),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(3.0, 1.0),
    vec2.Vec2(4.0, 1.0),
    vec2.Vec2(5.0, 1.0),
    vec2.Vec2(6.0, 1.0),
    vec2.Vec2(7.0, -1.5),
    vec2.Vec2(6.0, -2.0)
};

/*  Guides for the strands.                                                   */
guide gA0 = vec2.CurveThroughPoints(A0);
guide gA1 = vec2.CurveThroughPoints(A1);
guide gB0 = vec2.CurveThroughPoints(B0);
guide gB1 = vec2.CurveThroughPoints(B1);
guide gCA = vec2.CurveThroughPoints(CA);
guide gCB = vec2.CurveThroughPoints(CB);

/*  Draw the braid.                                                           */
draw(gA0);
draw(gA1);
draw(gB0);
draw(gB1);
draw(gCA);
draw(gCB);

/*  Mark off the start and end points for the strands in the braid.           */
A0[0].DrawDot(default.dot_radius);
B0[0].DrawDot(default.dot_radius);
A1[A1.length - 1].DrawDot(default.dot_radius);
B1[B1.length - 1].DrawDot(default.dot_radius);
