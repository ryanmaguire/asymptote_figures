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
 *      Draws the Hopf link as a star of David.                               *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Struct for working with 2D lines provided here.                           */
import line2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Pens for the drawing. Yellow is fill color, black is outline.             */
pen fill_pen = rgb(0.95, 0.95, 0.95);
pen draw_pen = rgb(0.0, 0.3, 1.0) + linewidth(6pt);

/*  Radius of the "inner" and "outer" triangles.                              */
real r = 1.0;
real R = 1.5;

/*  Points for the first triangle in star. Inner and outer portions.          */
vec2.Vec2 AInner[] = {
    vec2.FromPolar(r, pi / 2.0),
    vec2.FromPolar(r, 7.0 * pi / 6.0),
    vec2.FromPolar(r, 11.0 * pi / 6.0)
};

vec2.Vec2 AOuter[] = {
    vec2.FromPolar(R, pi / 2.0),
    vec2.FromPolar(R, 7.0 * pi / 6.0),
    vec2.FromPolar(R, 11.0 * pi / 6.0)
};

/*  Points for the second triangle in star. Inner and outer portions.         */
vec2.Vec2 BInner[] = {
    vec2.FromPolar(r, pi / 2.0 + pi / 3.0),
    vec2.FromPolar(r, 7.0 * pi / 6.0 + pi / 3.0),
    vec2.FromPolar(r, 11.0 * pi / 6.0 + pi / 3.0)
};

vec2.Vec2 BOuter[] = {
    vec2.FromPolar(R, pi / 2.0 + pi / 3.0),
    vec2.FromPolar(R, 7.0 * pi / 6.0 + pi / 3.0),
    vec2.FromPolar(R, 11.0 * pi / 6.0 + pi / 3.0)
};

/*  The link is made by computing the points of intersection. Construct lines *
 *  for both triangles in the star, inner and outer.                          */
line2.Line2 LAInner[] = {
    line2.FromPoints(AInner[0], AInner[1]),
    line2.FromPoints(AInner[1], AInner[2]),
    line2.FromPoints(AInner[2], AInner[0])
};

line2.Line2 LAOuter[] = {
    line2.FromPoints(AOuter[0], AOuter[1]),
    line2.FromPoints(AOuter[1], AOuter[2]),
    line2.FromPoints(AOuter[2], AOuter[0])
};

line2.Line2 LBInner[] = {
    line2.FromPoints(BInner[0], BInner[1]),
    line2.FromPoints(BInner[1], BInner[2]),
    line2.FromPoints(BInner[2], BInner[0])
};

line2.Line2 LBOuter[] = {
    line2.FromPoints(BOuter[0], BOuter[1]),
    line2.FromPoints(BOuter[1], BOuter[2]),
    line2.FromPoints(BOuter[2], BOuter[0])
};

/*  Compute the strands for the second triangle. There's three of them.       */
vec2.Vec2 BArc0[] = {
    LAInner[0].Intersect(LBInner[2]),
    BInner[2],
    BInner[1],
    LAOuter[1].Intersect(LBInner[0]),
    LAOuter[1].Intersect(LBOuter[0]),
    BOuter[1],
    BOuter[2],
    LAInner[0].Intersect(LBOuter[2])
};

vec2.Vec2 BArc1[] = {
    LBInner[0].Intersect(LAInner[1]),
    LBOuter[0].Intersect(LAInner[1]),
    LBOuter[0].Intersect(LAInner[0]),
    LBInner[0].Intersect(LAInner[0]),
};

vec2.Vec2 BArc2[] = {
    LAOuter[0].Intersect(LBInner[0]),
    BInner[0],
    LAOuter[0].Intersect(LBInner[2]),
    LAOuter[0].Intersect(LBOuter[2]),
    BOuter[0],
    LAOuter[0].Intersect(LBOuter[0]),
};

/*  Construct the strands from the points above.                              */
guide gBArc0 = vec2.ClosedPolygonThroughPoints(BArc0);
guide gBArc1 = vec2.ClosedPolygonThroughPoints(BArc1);
guide gBArc2 = vec2.ClosedPolygonThroughPoints(BArc2);

/*  The strands for the first triangle are obtained by rotating 180 degrees.  */
guide gAArc0 = rotate(180.0) * gBArc0;
guide gAArc1 = rotate(180.0) * gBArc1;
guide gAArc2 = rotate(180.0) * gBArc2;

/*  Draw the link.                                                            */
filldraw(gBArc0, fill_pen, draw_pen);
filldraw(gBArc1, fill_pen, draw_pen);
filldraw(gBArc2, fill_pen, draw_pen);
filldraw(gAArc0, fill_pen, draw_pen);
filldraw(gAArc1, fill_pen, draw_pen);
filldraw(gAArc2, fill_pen, draw_pen);
