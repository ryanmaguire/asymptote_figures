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
 *      Draws the Reidemeister 1 move.                                        *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Margins to make it appear like bottom arc passed beneath the upper one.   */
margin right_margin = TrueMargin(0.0, 9.0cm);
margin middle_margin = TrueMargin(2.0cm, 2.0cm);
margin left_margin = TrueMargin(9.0cm, 0.0);

/*  Coordinates for the bottom arc.                                           */
vec2.Vec2 A[] = {
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(2.5, 1.0),
    vec2.Vec2(5.0, 0.0)
};

/*  Coordinates for the top arc.                                              */
vec2.Vec2 B[] = {
    vec2.Vec2(0.0, 1.0),
    vec2.Vec2(2.5, 0.0),
    vec2.Vec2(5.0, 1.0)
};

/*  Positions for the two line segments that are the result of the R2 move.   */
vec2.Vec2 C[] = {
    vec2.Vec2(0.0, -2.0),
    vec2.Vec2(5.0, -2.0)
};

vec2.Vec2 D[] = {
    vec2.Vec2(0.0, -3.0),
    vec2.Vec2(5.0, -3.0)
};

/*  Line for drawing an arrow connecting the diagrams.                        */
vec2.Vec2 E[] = {
    vec2.Vec2(2.5, -0.5),
    vec2.Vec2(2.5, -1.5)
};

/*  Arcs for the two strands.                                                 */
guide gA = vec2.CurveThroughPoints(A);
guide gB = vec2.CurveThroughPoints(B);

/*  Draw the bottom arc in such a way as to pass beneath the upper one.       */
draw(gA, right_margin);
draw(gA, middle_margin);
draw(gA, left_margin);

/*  The upper arc is drawn normally.                                          */
draw(gB);

/*  The resulting lines from the Reidemeister 2 move.                         */
draw(C[0].LineTo(C[1]));
draw(D[0].LineTo(D[1]));

/*  An arrow connecting the two diagrams.                                     */
draw(E[0].LineTo(E[1]), default.sharp_arrows);
