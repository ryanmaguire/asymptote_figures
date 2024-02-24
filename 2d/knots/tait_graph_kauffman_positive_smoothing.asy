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
margin right_margins = TrueMargin(0.0, 2.5cm);
margin left_margins = TrueMargin(2.5cm, 0.0);

vec2.Vec2[] operator + (vec2.Vec2[] v, vec2.Vec2 s)
{
    int n;
    vec2.Vec2[] out = new vec2.Vec2[v.length];

    for (n = 0; n < v.length; ++n)
        out[n] = v[n] + s;

    return out;
}

vec2.Vec2[] operator - (vec2.Vec2[] v, vec2.Vec2 s)
{
    int n;
    vec2.Vec2[] out = new vec2.Vec2[v.length];

    for (n = 0; n < v.length; ++n)
        out[n] = v[n] - s;

    return out;
}

vec2.Vec2 UpShift = vec2.Vec2(1.8, 0.9);
vec2.Vec2 DownShift = vec2.Vec2(1.8, -0.9);
vec2.Vec2 VertDisplace = vec2.Vec2(0.0, 0.15);
vec2.Vec2 HoriDisplace = vec2.Vec2(0.15, 0.0);

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

vec2.Vec2 UpperTop[] = {
    NegUpperTriangle[0] + UpShift,
    NegUpperTriangle[1] + UpShift + VertDisplace,
    NegUpperTriangle[2] + UpShift
};

vec2.Vec2 UpperBot[] = {
    NegLowerTriangle[0] + UpShift,
    NegLowerTriangle[1] + UpShift - VertDisplace,
    NegLowerTriangle[2] + UpShift
};

vec2.Vec2 LowerLeft[] = {
    NegUpperTriangle[0] + DownShift,
    NegUpperTriangle[1] + DownShift - HoriDisplace,
    NegLowerTriangle[2] + DownShift
};

vec2.Vec2 LowerRight[] = {
    NegLowerTriangle[0] + DownShift,
    NegUpperTriangle[1] + DownShift + HoriDisplace,
    NegUpperTriangle[2] + DownShift
};

vec2.Vec2 CTop = vec2.Vec2(0.5, 0.75);
vec2.Vec2 CBot = vec2.Vec2(0.5, 0.25);

vec2.Vec2 STop = CTop + UpShift + VertDisplace;
vec2.Vec2 SBot = CBot + UpShift - VertDisplace;
vec2.Vec2 MDot = NegUpperTriangle[1] + DownShift;

vec2.Vec2 TopLine[] = {
    vec2.Vec2(1.0, 0.7),
    vec2.Vec2(1.6, 0.9)
};

vec2.Vec2 BotLine[] = {
    vec2.Vec2(1.0, 0.3),
    vec2.Vec2(1.6, 0.1)
};

/*  Guides for the shaded in triangles.                                       */
guide gNegUpper = vec2.ClosedPolygonThroughPoints(NegUpperTriangle);
guide gNegLower = vec2.ClosedPolygonThroughPoints(NegLowerTriangle);

guide gUpperTop = vec2.CurveThroughPoints(UpperTop);
guide gUpperBot = vec2.CurveThroughPoints(UpperBot);
guide gLowerLeft = vec2.CurveThroughPoints(LowerLeft);
guide gLowerRight = vec2.CurveThroughPoints(LowerRight);
guide gUpperTopClosed = gUpperTop -- cycle;
guide gUpperBotClosed = gUpperBot -- cycle;
guide gMergedClosed = gLowerLeft -- gLowerRight -- cycle;

/*  Draw the shaded triangles.                                                */
filldraw(gNegUpper, gray_pen, invisible);
filldraw(gNegLower, gray_pen, invisible);

/*  Draw the crossings.                                                       */
draw(NegOver[0].LineTo(NegOver[1]));
draw(NegUnder[0].LineTo(NegUnder[1]), right_margins);
draw(NegUnder[0].LineTo(NegUnder[1]), left_margins);

draw(CTop.LineTo(CBot), red);
draw(gUpperTop);
draw(gUpperBot);
draw(gLowerLeft);
draw(gLowerRight);
filldraw(gUpperTopClosed, gray_pen, invisible);
filldraw(gUpperBotClosed, gray_pen, invisible);
filldraw(gMergedClosed, gray_pen, invisible);
draw("$0$", TopLine[0].LineTo(TopLine[1]), default.sharp_arrow);
draw("$1$", BotLine[0].LineTo(BotLine[1]), default.sharp_arrow);

CTop.DrawDot(default.dot_radius);
CBot.DrawDot(default.dot_radius);
STop.DrawDot(default.dot_radius);
SBot.DrawDot(default.dot_radius);
MDot.DrawDot(default.dot_radius);
