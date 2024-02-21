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
 *      Draws the signs of the edges for the Tait graph.                      *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Pen for shading.                                                          */
pen gray_pen = gray(0.8);

/*  Margins to give the crossings an under-over look.                         */
margin right_margins = TrueMargin(0.0, 2.3cm);
margin left_margins = TrueMargin(2.3cm, 0.0);

/*  Points for the negative crossing on the left.                             */
vec2.Vec2 NegOver[] = {
    vec2.Vec2(1.0, 0.0),
    vec2.Vec2(0.0, 1.0)
};

vec2.Vec2 NegUnder[] = {
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(1.0, 1.0)
};

/*  Shaded triangles for the negative crossing.                               */
vec2.Vec2 NegUpperTriangle[] = {
    NegOver[1],
    vec2.Vec2(0.5, 0.5),
    NegUnder[1]
};

vec2.Vec2 NegLowerTriangle[] = {
    NegOver[0],
    vec2.Vec2(0.5, 0.5),
    NegUnder[0]
};

/*  Points for the positive crossing on the right.                            */
vec2.Vec2 PosOver[] = {
    vec2.Vec2(2.0, 0.0),
    vec2.Vec2(3.0, 1.0)
};

vec2.Vec2 PosUnder[] = {
    vec2.Vec2(3.0, 0.0),
    vec2.Vec2(2.0, 1.0)
};

/*  Shaded triangles for the positive crossing.                               */
vec2.Vec2 PosUpperTriangle[] = {
    PosOver[1],
    vec2.Vec2(2.5, 0.5),
    PosUnder[1]
};

vec2.Vec2 PosLowerTriangle[] = {
    PosOver[0],
    vec2.Vec2(2.5, 0.5),
    PosUnder[0]
};

/*  Points for the labels.                                                    */
vec2.Vec2 NegLabel = vec2.Vec2(0.5, -0.2);
vec2.Vec2 PosLabel = vec2.Vec2(2.5, -0.2);

/*  Guides for the shaded in triangles.                                       */
guide gNegUpper = vec2.ClosedPolygonThroughPoints(NegUpperTriangle);
guide gNegLower = vec2.ClosedPolygonThroughPoints(NegLowerTriangle);
guide gPosUpper = vec2.ClosedPolygonThroughPoints(PosUpperTriangle);
guide gPosLower = vec2.ClosedPolygonThroughPoints(PosLowerTriangle);

/*  Draw the shaded triangles.                                                */
filldraw(gNegUpper, gray_pen, invisible);
filldraw(gNegLower, gray_pen, invisible);
filldraw(gPosUpper, gray_pen, invisible);
filldraw(gPosLower, gray_pen, invisible);

/*  Draw the crossings.                                                       */
draw(NegOver[0].LineTo(NegOver[1]));
draw(NegUnder[0].LineTo(NegUnder[1]), right_margins);
draw(NegUnder[0].LineTo(NegUnder[1]), left_margins);

draw(PosOver[0].LineTo(PosOver[1]));
draw(PosUnder[0].LineTo(PosUnder[1]), right_margins);
draw(PosUnder[0].LineTo(PosUnder[1]), left_margins);

/*  Add the labels.                                                           */
NegLabel.AddLabel("$-$");
PosLabel.AddLabel("$+$");
