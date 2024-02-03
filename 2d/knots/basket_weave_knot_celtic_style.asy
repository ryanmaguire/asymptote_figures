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
 *      Draws the basket weave knot in a Celtic-like form.                    *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Colors for the flag of Ireland. Used for the knots outline and interior.  */
pen green_pen = rgb(0.08, 0.61, 0.38) + linewidth(6pt);
pen gold_pen = rgb(1.0, 0.51, 0.0);

/*  Upper left most corner of the knot.                                       */
vec2.Vec2 A0[] = {
    vec2.Vec2(-9.0, 0.0),
    vec2.Vec2(-11.0, 2.0),
    vec2.Vec2(-8.0, 5.0),
    vec2.Vec2(-4.0, 1.0),
    vec2.Vec2(-5.0, 0.0),
    vec2.Vec2(-8.0, 3.0),
    vec2.Vec2(-9.0, 2.0),
    vec2.Vec2(-8.0, 1.0)
};

/*  Bottom left corner of the knot, a rotation of the previous entry.         */
vec2.Vec2 A1[] = {
    vec2.Vec2(-7.0, 2.0),
    vec2.Vec2(-11.0, -2.0),
    vec2.Vec2(-8.0, -5.0),
    vec2.Vec2(-6.0, -3.0),
    vec2.Vec2(-7.0, -2.0),
    vec2.Vec2(-8.0, -3.0),
    vec2.Vec2(-9.0, -2.0),
    vec2.Vec2(-6.0, 1.0)
};


/*  Left "hook" in the top part of the knot.                                  */
vec2.Vec2 A2[] = {
    vec2.Vec2(-6.0, 3.0),
    vec2.Vec2(-4.0, 5.0),
    vec2.Vec2(0.0, 1.0),
    vec2.Vec2(-1.0, 0.0),
    vec2.Vec2(-4.0, 3.0),
    vec2.Vec2(-5.0, 2.0)
};

/*  Left hook in the bottom part. Rotation of the previous entry.             */
vec2.Vec2 A3[] = {
    vec2.Vec2(-2.0, -3.0),
    vec2.Vec2(-4.0, -5.0),
    vec2.Vec2(-8.0, -1.0),
    vec2.Vec2(-7.0, 0.0),
    vec2.Vec2(-4.0, -3.0),
    vec2.Vec2(-3.0, -2.0)
};


/*  More hooks, translations of the previous two entries.                     */
vec2.Vec2 A4[] = {
    vec2.Vec2(-2.0, 3.0),
    vec2.Vec2(0.0, 5.0),
    vec2.Vec2(4.0, 1.0),
    vec2.Vec2(3.0, 0.0),
    vec2.Vec2(0.0, 3.0),
    vec2.Vec2(-1.0, 2.0)
};

vec2.Vec2 A5[] = {
    vec2.Vec2(2.0, -3.0),
    vec2.Vec2(0.0, -5.0),
    vec2.Vec2(-4.0, -1.0),
    vec2.Vec2(-3.0, 0.0),
    vec2.Vec2(0.0, -3.0),
    vec2.Vec2(1.0, -2.0)
};

/*  Even more hooks, further translations of the previous two entries.        */
vec2.Vec2 A6[] = {
    vec2.Vec2(2.0, 3.0),
    vec2.Vec2(4.0, 5.0),
    vec2.Vec2(8.0, 1.0),
    vec2.Vec2(7.0, 0.0),
    vec2.Vec2(4.0, 3.0),
    vec2.Vec2(3.0, 2.0)
};

vec2.Vec2 A7[] = {
    vec2.Vec2(6.0, -3.0),
    vec2.Vec2(4.0, -5.0),
    vec2.Vec2(0.0, -1.0),
    vec2.Vec2(1.0, 0.0),
    vec2.Vec2(4.0, -3.0),
    vec2.Vec2(5.0, -2.0)
};

/*  Bottom right part of the knot. Mirror reflection of the upper left.       */
vec2.Vec2 A8[] = {
    vec2.Vec2(9.0, 0.0),
    vec2.Vec2(11.0, -2.0),
    vec2.Vec2(8.0, -5.0),
    vec2.Vec2(4.0, -1.0),
    vec2.Vec2(5.0, 0.0),
    vec2.Vec2(8.0, -3.0),
    vec2.Vec2(9.0, -2.0),
    vec2.Vec2(8.0, -1.0)
};

/*  Upper right part of the knot. Mirror reflection of the bottom left.       */
vec2.Vec2 A9[] = {
    vec2.Vec2(7.0, -2.0),
    vec2.Vec2(11.0, 2.0),
    vec2.Vec2(8.0, 5.0),
    vec2.Vec2(6.0, 3.0),
    vec2.Vec2(7.0, 2.0),
    vec2.Vec2(8.0, 3.0),
    vec2.Vec2(9.0, 2.0),
    vec2.Vec2(6.0, -1.0)
};

/*  Diagonal bar that connects two crossings in the left part.                */
vec2.Vec2 LeftBar[] = {
    vec2.Vec2(-6.0, -1.0),
    vec2.Vec2(-3.0, 2.0),
    vec2.Vec2(-2.0, 1.0),
    vec2.Vec2(-5.0, -2.0)
};

/*  Diagonal bar that connects two crossings in the center.                   */
vec2.Vec2 MiddleBar[] = {
    vec2.Vec2(-2.0, -1.0),
    vec2.Vec2(1.0, 2.0),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(-1.0, -2.0)
};

/*  Diagonal bar that connects two crossings in the right part.               */
vec2.Vec2 RightBar[] = {
    vec2.Vec2(2.0, -1.0),
    vec2.Vec2(5.0, 2.0),
    vec2.Vec2(6.0, 1.0),
    vec2.Vec2(3.0, -2.0)
};

/*  Guides drawn through all of the polygonal regions. Make them closed.      */
guide gA0 = vec2.ClosedPolygonThroughPoints(A0);
guide gA1 = vec2.ClosedPolygonThroughPoints(A1);
guide gA2 = vec2.ClosedPolygonThroughPoints(A2);
guide gA3 = vec2.ClosedPolygonThroughPoints(A3);
guide gA4 = vec2.ClosedPolygonThroughPoints(A4);
guide gA5 = vec2.ClosedPolygonThroughPoints(A5);
guide gA6 = vec2.ClosedPolygonThroughPoints(A6);
guide gA7 = vec2.ClosedPolygonThroughPoints(A7);
guide gA8 = vec2.ClosedPolygonThroughPoints(A8);
guide gA9 = vec2.ClosedPolygonThroughPoints(A9);
guide gLeftBar = vec2.ClosedPolygonThroughPoints(LeftBar);
guide gMiddleBar = vec2.ClosedPolygonThroughPoints(MiddleBar);
guide gRightBar = vec2.ClosedPolygonThroughPoints(RightBar);

/*  Draw the knot.                                                            */
filldraw(gA0, gold_pen, green_pen);
filldraw(gA1, gold_pen, green_pen);
filldraw(gA2, gold_pen, green_pen);
filldraw(gA3, gold_pen, green_pen);
filldraw(gA4, gold_pen, green_pen);
filldraw(gA5, gold_pen, green_pen);
filldraw(gA6, gold_pen, green_pen);
filldraw(gA7, gold_pen, green_pen);
filldraw(gA8, gold_pen, green_pen);
filldraw(gA9, gold_pen, green_pen);
filldraw(gLeftBar, gold_pen, green_pen);
filldraw(gMiddleBar, gold_pen, green_pen);
filldraw(gRightBar, gold_pen, green_pen);
