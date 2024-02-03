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
 *      Draws the endless knot in a Celtic-like form.                         *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Colors for the flag of Ireland. Used for the knots outline and interior.  */
pen green_pen = rgb(0.08, 0.61, 0.38) + linewidth(6pt);
pen gold_pen = rgb(1.0, 0.51, 0.0);

/*  The left-most part of the knot.                                           */
vec2.Vec2 A[] = {
    vec2.Vec2(-9.0, 0.0),
    vec2.Vec2(-6.0, 3.0),
    vec2.Vec2(-4.0, 1.0),
    vec2.Vec2(-5.0, 0.0),
    vec2.Vec2(-6.0, 1.0),
    vec2.Vec2(-7.0, 0.0),
    vec2.Vec2(-6.0, -1.0),
    vec2.Vec2(-3.0, 2.0),
    vec2.Vec2(-2.0, 1.0),
    vec2.Vec2(-6.0, -3.0)
};

/*  The right-most part of the knot. A perfect reflection of the previous     *
 *  part: (x, y) |-> (-x, -y).                                                */
vec2.Vec2 B[] = {
    vec2.Vec2(9.0, 0.0),
    vec2.Vec2(6.0, -3.0),
    vec2.Vec2(4.0, -1.0),
    vec2.Vec2(5.0, 0.0),
    vec2.Vec2(6.0, -1.0),
    vec2.Vec2(7.0, 0.0),
    vec2.Vec2(6.0, 1.0),
    vec2.Vec2(3.0, -2.0),
    vec2.Vec2(2.0, -1.0),
    vec2.Vec2(6.0, 3.0)
};

/*  The upper left "hook" part of the knot.                                   */
vec2.Vec2 C[] = {
    vec2.Vec2(-1.0, 0.0),
    vec2.Vec2(-5.0, 4.0),
    vec2.Vec2(-2.0, 7.0),
    vec2.Vec2(0.0, 5.0),
    vec2.Vec2(-1.0, 4.0),
    vec2.Vec2(-2.0, 5.0),
    vec2.Vec2(-3.0, 4.0),
    vec2.Vec2(0.0, 1.0)
};

/*  The lower right hook. A reflection of the previous part.                  */
vec2.Vec2 D[] = {
    vec2.Vec2(1.0, 0.0),
    vec2.Vec2(5.0, -4.0),
    vec2.Vec2(2.0, -7.0),
    vec2.Vec2(0.0, -5.0),
    vec2.Vec2(1.0, -4.0),
    vec2.Vec2(2.0, -5.0),
    vec2.Vec2(3.0, -4.0),
    vec2.Vec2(0.0, -1.0)
};

/*  The upper right hook. This is a rotation of the upper left hook.          */
vec2.Vec2 E[] = {
    vec2.Vec2(-1.0, 2.0),
    vec2.Vec2(-2.0, 3.0),
    vec2.Vec2(2.0, 7.0),
    vec2.Vec2(5.0, 4.0),
    vec2.Vec2(3.0, 2.0),
    vec2.Vec2(2.0, 3.0),
    vec2.Vec2(3.0, 4.0),
    vec2.Vec2(2.0, 5.0)
};

/*  Bottom left hook. Reflection of the upper right hook.                     */
vec2.Vec2 F[] = {
    vec2.Vec2(1.0, -2.0),
    vec2.Vec2(2.0, -3.0),
    vec2.Vec2(-2.0, -7.0),
    vec2.Vec2(-5.0, -4.0),
    vec2.Vec2(-3.0, -2.0),
    vec2.Vec2(-2.0, -3.0),
    vec2.Vec2(-3.0, -4.0),
    vec2.Vec2(-2.0, -5.0)
};

/*  The bottom left bar going north-west to south-east.                       */
vec2.Vec2 BottomBar[] = {
    vec2.Vec2(0.0, -3.0),
    vec2.Vec2(-1.0, -4.0),
    vec2.Vec2(-4.0, -1.0),
    vec2.Vec2(-3.0, 0.0)
};

/*  The top bar going north-west to south-east. Shift of the first bar.       */
vec2.Vec2 TopBar[] = {
    vec2.Vec2(4.0, 1.0),
    vec2.Vec2(3.0, 0.0),
    vec2.Vec2(0.0, 3.0),
    vec2.Vec2(1.0, 4.0)
};

/*  Central bar. Rotation of the previous two.                                */
vec2.Vec2 MiddleBar[] = {
    vec2.Vec2(-2.0, -1.0),
    vec2.Vec2(1.0, 2.0),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(-1.0, -2.0)
};

/*  Guides drawn through all of the polygonal regions. Make them closed.      */
guide gA = vec2.ClosedPolygonThroughPoints(A);
guide gB = vec2.ClosedPolygonThroughPoints(B);
guide gC = vec2.ClosedPolygonThroughPoints(C);
guide gD = vec2.ClosedPolygonThroughPoints(D);
guide gE = vec2.ClosedPolygonThroughPoints(E);
guide gF = vec2.ClosedPolygonThroughPoints(F);
guide gBottomBar = vec2.ClosedPolygonThroughPoints(BottomBar);
guide gTopBar = vec2.ClosedPolygonThroughPoints(TopBar);
guide gMiddleBar = vec2.ClosedPolygonThroughPoints(MiddleBar);

/*  Draw the knot.                                                            */
filldraw(gA, gold_pen, green_pen);
filldraw(gB, gold_pen, green_pen);
filldraw(gC, gold_pen, green_pen);
filldraw(gD, gold_pen, green_pen);
filldraw(gE, gold_pen, green_pen);
filldraw(gF, gold_pen, green_pen);
filldraw(gBottomBar, gold_pen, green_pen);
filldraw(gTopBar, gold_pen, green_pen);
filldraw(gMiddleBar, gold_pen, green_pen);
