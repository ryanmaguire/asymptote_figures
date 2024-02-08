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
 *      Draws the Hopf link as the mon of the Aso clan.                       *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Struct for working with 2D lines provided here.                           */
import line2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Pens for the drawing. Black is fill color, silver is outline.             */
pen fill_pen = rgb(0.0, 0.0, 0.0);
pen draw_pen = rgb(0.75, 0.75, 0.75) + linewidth(6pt);

/*  Shifts for the center of the square.                                      */
real shift = sqrt(2.0) / 2.0;

/*  Thickness of the strands of the link components.                          */
real thickness = 0.8;

/*  Points for the square of the right-most link component.                   */
vec2.Vec2 AInner[] = {
    vec2.Vec2(shift - 1.0, 0.0),
    vec2.Vec2(shift, 1.0),
    vec2.Vec2(shift + 1.0, 0.0),
    vec2.Vec2(shift, -1.0)
};

vec2.Vec2 AOuter[] = {
    vec2.Vec2(shift - thickness - 1.0, 0.0),
    vec2.Vec2(shift, 1.0 + thickness),
    vec2.Vec2(shift + thickness + 1.0, 0.0),
    vec2.Vec2(shift, -1.0 - thickness)
};

/*  Points for the square of the left-most link component.                    */
vec2.Vec2 BInner[] = {
    vec2.Vec2(-shift - 1.0, 0.0),
    vec2.Vec2(-shift, 1.0),
    vec2.Vec2(-shift + 1.0, 0.0),
    vec2.Vec2(-shift, -1.0)
};

vec2.Vec2 BOuter[] = {
    vec2.Vec2(-shift - thickness - 1.0, 0.0),
    vec2.Vec2(-shift, 1.0 + thickness),
    vec2.Vec2(-shift + thickness + 1.0, 0.0),
    vec2.Vec2(-shift, -1.0 - thickness)
};

/*  Several points are computed from line intersections. Create the lines.    */
line2.Line2 LAO0 = line2.FromPoints(AOuter[0], AOuter[1]);
line2.Line2 LAO1 = line2.FromPoints(AOuter[0], AOuter[3]);
line2.Line2 LAI0 = line2.FromPoints(AInner[0], AInner[1]);
line2.Line2 LAI1 = line2.FromPoints(AInner[0], AInner[3]);
line2.Line2 LBO0 = line2.FromPoints(BOuter[2], BOuter[1]);
line2.Line2 LBO1 = line2.FromPoints(BOuter[2], BOuter[3]);
line2.Line2 LBI0 = line2.FromPoints(BInner[2], BInner[1]);
line2.Line2 LBI1 = line2.FromPoints(BInner[2], BInner[3]);

/*  The right-most strand.                                                    */
vec2.Vec2 ArcA0[] = {
    AOuter[0],
    AOuter[1],
    AOuter[2],
    AOuter[3],
    LBO1.Intersect(LAO1),
    LBO1.Intersect(LAI1),
    AInner[3],
    AInner[2],
    AInner[1],
    AInner[0],
    LBI1.Intersect(LAI1),
    LBI1.Intersect(LAO1),
};

/*  The left-most strand.                                                     */
vec2.Vec2 ArcB0[] = {
    BOuter[1],
    BOuter[0],
    BOuter[3],
    BOuter[2],
    LAI0.Intersect(LBO0),
    LAI0.Intersect(LBI0),
    BInner[2],
    BInner[3],
    BInner[0],
    BInner[1],
    LAO0.Intersect(LBI0),
    LAO0.Intersect(LBO0)
};

/*  Create the paths from the specified points.                               */
guide gA0 = vec2.ClosedPolygonThroughPoints(ArcA0);
guide gB0 = vec2.ClosedPolygonThroughPoints(ArcB0);

/*  Draw the link.                                                            */
filldraw(gA0, fill_pen, draw_pen);
filldraw(gB0, fill_pen, draw_pen);
