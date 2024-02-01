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
 *      Part of a sequence of drawings for smoothings of crossings in a knot. *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import "vec2.asy" as vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import "size_256_default_settings.asy" as default;

/*  Distances for the rectangles.                                             */
real close = 0.3;
real far = 1.0;
real height = 1.0;

/*  Points for the left rectangle.                                            */
vec2.Vec2 AL = vec2.Vec2(-far, height);
vec2.Vec2 BL = vec2.Vec2(-far, -height);
vec2.Vec2 CL = vec2.Vec2(-close, -height);
vec2.Vec2 DL = vec2.Vec2(-close, height);

/*  Points for the right rectangle.                                           */
vec2.Vec2 AR = vec2.Vec2(far, height);
vec2.Vec2 BR = vec2.Vec2(far, -height);
vec2.Vec2 CR = vec2.Vec2(close, -height);
vec2.Vec2 DR = vec2.Vec2(close, height);

/*  Position of points for the top crossing thing.                            */
vec2.Vec2 X0 = vec2.Vec2(-close, 0.3);
vec2.Vec2 Y0 = vec2.Vec2(close, 0.7);
vec2.Vec2 X1 = vec2.Vec2(-close, 0.7);
vec2.Vec2 Y1 = vec2.Vec2(close, 0.3);
vec2.Vec2 Mid0 = X0 + 0.60 * (Y0 - X0);
vec2.Vec2 Mid1 = X0 + 0.40 * (Y0 - X0);

/*  Position of points for the bottom crossing thing.                         */
vec2.Vec2 X2 = vec2.Vec2(-close, -0.3*height);
vec2.Vec2 X3 = vec2.Vec2(-close, -0.7*height);
vec2.Vec2 Y2 = vec2.Vec2(close, -0.7*height);
vec2.Vec2 Y3 = vec2.Vec2(close, -0.3*height);
vec2.Vec2 Mid2 = Y2 + 0.60 * (X2 - Y2);
vec2.Vec2 Mid3 = Y2 + 0.40 * (X2 - Y2);

/*  Guides for the two rectangles, both of which are drawn green.             */
vec2.Vec2 LeftRectanglePoints[] = {AL, BL, CL, DL};
vec2.Vec2 RightRectanglePoints[] = {AR, BR, CR, DR};
guide LeftRectangle = vec2.ClosedPolygonThroughPoints(LeftRectanglePoints);
guide RightRectangle = vec2.ClosedPolygonThroughPoints(RightRectanglePoints);

/*  Draw the top crossing thing. It is split in to two too simulate being the *
 *  under strand of this crossing.                                            */
draw(X0.LineTo(Mid0), default.margins);
draw(Mid1.LineTo(Y0), default.sharp_arrow, default.margins);

/*  Draw the over strand for the top crossing. Goes through the under strand. */
draw(Y1.LineTo(X1), default.sharp_arrow, default.margins);

/*  Draw the bottom crossing thing, same idea as before.                      */
draw(Y2.LineTo(Mid2), default.margins);
draw(Mid3.LineTo(X2), default.sharp_arrow, default.margins);
draw(X3.LineTo(Y3), default.sharp_arrow, default.margins);

/*  Draw the left rectangle.                                                  */
draw(LeftRectangle, default.green_pen);

/*  Draw the right rectangle.                                                 */
draw(RightRectangle, default.green_pen);
