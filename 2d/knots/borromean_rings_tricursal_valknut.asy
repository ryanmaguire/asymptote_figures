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
 *      Draws the Borromean rings depicted as the tricursal valknut.          *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Pens for the drawing. Fill color is gray, outline color is black.         */
pen black_pen = black + linewidth(7.0pt);
pen gray_pen = rgb(0.6, 0.6, 0.6);

/*  The components are made from equilateral triangles. Need this factor.     */
real sin_pi_by_3 = 0.8660254037844387;

/*  The bottom-most component of the link.                                    */
vec2.Vec2 A0[] = {
    vec2.Vec2(-3.0, 0.0),
    vec2.Vec2(-2.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(-1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(-1.5, sin_pi_by_3),
    vec2.Vec2(1.5, sin_pi_by_3),
    vec2.Vec2(1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(2.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(3.0, 0.0)
};

vec2.Vec2 A1[] = {
    vec2.Vec2(-1.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 6.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 4.0 * sin_pi_by_3),
    vec2.Vec2(-0.5, 3.0 * sin_pi_by_3)
};

/*  The right-most component of the link.                                     */
vec2.Vec2 B0[] = {
    vec2.Vec2(-1.5, sin_pi_by_3),
    vec2.Vec2(1.5, sin_pi_by_3),
    vec2.Vec2(1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 4.0 * sin_pi_by_3)
};

vec2.Vec2 B1[] = {
    vec2.Vec2(1.0, 4.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 5.0 * sin_pi_by_3),
    vec2.Vec2(3.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(2.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(2.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(4.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 7.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 5.0 * sin_pi_by_3)
};

/*  The upper-most component of the link.                                     */
vec2.Vec2 C0[] = {
    vec2.Vec2(-1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(-0.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(-1.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 6.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 5.0 * sin_pi_by_3),
    vec2.Vec2(1.0, 6.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 8.0 * sin_pi_by_3),
    vec2.Vec2(-3.0, 2.0 * sin_pi_by_3)
};

vec2.Vec2 C1[] = {
    vec2.Vec2(1.0, 4.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 5.0 * sin_pi_by_3),
    vec2.Vec2(3.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 3.0 * sin_pi_by_3)
};

/*  Create paths through the polygonal regions to fill in for the link.       */
guide gA0 = vec2.ClosedPolygonThroughPoints(A0);
guide gA1 = vec2.ClosedPolygonThroughPoints(A1);
guide gB0 = vec2.ClosedPolygonThroughPoints(B0);
guide gB1 = vec2.ClosedPolygonThroughPoints(B1);
guide gC0 = vec2.ClosedPolygonThroughPoints(C0);
guide gC1 = vec2.ClosedPolygonThroughPoints(C1);

/*  Draw the link.                                                            */
filldraw(gA0, gray_pen, black_pen);
filldraw(gA1, gray_pen, black_pen);
filldraw(gB0, gray_pen, black_pen);
filldraw(gB1, gray_pen, black_pen);
filldraw(gC0, gray_pen, black_pen);
filldraw(gC1, gray_pen, black_pen);
