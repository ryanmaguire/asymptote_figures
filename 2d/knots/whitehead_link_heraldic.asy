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
 *      Draws the Whitehead link in "Heraldic" fashion.                       *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Struct for working with 2D lines provided here.                           */
import line2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Pens for the drawing. Blue and red are fill colors, gold is outline.      */
pen fill_pen_blue = rgb(0.00, 0.42, 0.78);
pen fill_pen_red = rgb(0.83, 0.13, 0.21);
pen draw_pen = rgb(0.97, 0.80, 0.07) + linewidth(6pt);

/*  Half the thickness of the strands.                                        */
real d = 0.2;

/*  Shift factor for computing the points of the left and right squares.      */
vec2.Vec2 shift = vec2.Vec2(1.0, 0.0);

/*  Points for the central square. Inner and outer portions.                  */
vec2.Vec2 AInner[] = {
    vec2.Vec2(-1.0+d, 0.0),
    vec2.Vec2(0.0, 1.0-d),
    vec2.Vec2(1.0-d, 0.0),
    vec2.Vec2(0.0, -1.0+d)
};

vec2.Vec2 AOuter[] = {
    vec2.Vec2(-1.0-d, 0.0),
    vec2.Vec2(0.0, 1.0+d),
    vec2.Vec2(1.0+d, 0.0),
    vec2.Vec2(0.0, -1.0-d)
};

/*  Points for the left-most square. Inner and outer portions.                */
vec2.Vec2 BInner[] = {
    AInner[0] - shift,
    AInner[1] - shift,
    AInner[2] - shift,
    AInner[3] - shift
};

vec2.Vec2 BOuter[] = {
    AOuter[0] - shift,
    AOuter[1] - shift,
    AOuter[2] - shift,
    AOuter[3] - shift
};

/*  Points for the right-most square. Inner and outer portions.               */
vec2.Vec2 CInner[] = {
    AInner[0] + shift,
    AInner[1] + shift,
    AInner[2] + shift,
    AInner[3] + shift
};

vec2.Vec2 COuter[] = {
    AOuter[0] + shift,
    AOuter[1] + shift,
    AOuter[2] + shift,
    AOuter[3] + shift
};

/*  The link is made by computing the points of intersection. Construct lines *
 *  for both the squares in the drawing, inner and outer.                     */
line2.Line2 LAInner[] = {
    line2.FromPoints(AInner[0], AInner[1]),
    line2.FromPoints(AInner[1], AInner[2]),
    line2.FromPoints(AInner[2], AInner[3]),
    line2.FromPoints(AInner[3], AInner[0]),
};

line2.Line2 LAOuter[] = {
    line2.FromPoints(AOuter[0], AOuter[1]),
    line2.FromPoints(AOuter[1], AOuter[2]),
    line2.FromPoints(AOuter[2], AOuter[3]),
    line2.FromPoints(AOuter[3], AOuter[0]),
};

line2.Line2 LBInner[] = {
    line2.FromPoints(BInner[2], BInner[1]),
    line2.FromPoints(BInner[2], BInner[3])
};

line2.Line2 LBOuter[] = {
    line2.FromPoints(BOuter[2], BOuter[1]),
    line2.FromPoints(BOuter[2], BOuter[3])
};

line2.Line2 LCInner[] = {
    line2.FromPoints(CInner[0], CInner[1]),
    line2.FromPoints(CInner[0], CInner[3])
};

line2.Line2 LCOuter[] = {
    line2.FromPoints(COuter[0], COuter[1]),
    line2.FromPoints(COuter[0], COuter[3])
};

/*  Compute the strands for the first square.                                 */
vec2.Vec2 AArc0[] = {
    AOuter[0],
    AOuter[1],
    LAOuter[1].Intersect(LCOuter[0]),
    LAInner[1].Intersect(LCOuter[0]),
    AInner[1],
    AInner[0],
    LAInner[3].Intersect(LCOuter[0]),
    LAOuter[3].Intersect(LCOuter[0]),
};

vec2.Vec2 BArc0[] = {
    BOuter[0],
    BOuter[1],
    LBOuter[0].Intersect(LAOuter[0]),
    LBInner[0].Intersect(LAOuter[0]),
    BInner[1],
    BInner[0],
    BInner[3],
    LBInner[1].Intersect(LBInner[0]),
    LBOuter[1].Intersect(LBInner[0]),
    BOuter[3]
};

/*  The central rectangle through the origin.                                 */
vec2.Vec2 MidArc[] = {
    LAInner[0].Intersect(LCInner[1]),
    LAInner[0].Intersect(LCOuter[1]),
    LAInner[2].Intersect(LBInner[0]),
    LAInner[2].Intersect(LBOuter[0])
};

/*  Construct the strands from the points above.                              */
guide gAArc0 = vec2.ClosedPolygonThroughPoints(AArc0);
guide gAArc1 = rotate(180.0) * gAArc0;
guide gBArc0 = vec2.ClosedPolygonThroughPoints(BArc0);
guide gBArc1 = rotate(180.0) * gBArc0;
guide gMidArc = vec2.ClosedPolygonThroughPoints(MidArc);

/*  Draw the link.                                                            */
filldraw(gAArc0, fill_pen_red, draw_pen);
filldraw(gAArc1, fill_pen_red, draw_pen);
filldraw(gBArc0, fill_pen_blue, draw_pen);
filldraw(gBArc1, fill_pen_blue, draw_pen);
filldraw(gMidArc, fill_pen_blue, draw_pen);

