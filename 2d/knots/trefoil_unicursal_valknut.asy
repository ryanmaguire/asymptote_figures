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
 *      Draws the trefoil knot depicted as the unicursal valknut.             *
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

/*  Three pieces for the trefoil valknut. This is the bottom-most one.        */
vec2.Vec2 A[] = {
    vec2.Vec2(-2.0, 0.0),
    vec2.Vec2(2.0, 0.0),
    vec2.Vec2(0.5, 3.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(-1.5, 1.0 * sin_pi_by_3)
};

/*  The upper left portion of the knot.                                       */
vec2.Vec2 B[] = {
    vec2.Vec2(0.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(-1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.0, 4.0 * sin_pi_by_3),
    vec2.Vec2(-0.5, 5.0 * sin_pi_by_3),
    vec2.Vec2(-2.5, 1.0 * sin_pi_by_3)
};

/*  The upper right portion of the knot.                                      */
vec2.Vec2 C[] = {
    vec2.Vec2(0.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(-1.0, 2.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 5.0 * sin_pi_by_3),
    vec2.Vec2(2.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(1.5, 1.0 * sin_pi_by_3),
    vec2.Vec2(0.5, 3.0 * sin_pi_by_3)
};

/*  Create paths through the polygonal regions to fill in for the knot.       */
guide gA = vec2.ClosedPolygonThroughPoints(A);
guide gB = vec2.ClosedPolygonThroughPoints(B);
guide gC = vec2.ClosedPolygonThroughPoints(C);

/*  Draw the knot.                                                            */
filldraw(gA, gray_pen, black_pen);
filldraw(gB, gray_pen, black_pen);
filldraw(gC, gray_pen, black_pen);
