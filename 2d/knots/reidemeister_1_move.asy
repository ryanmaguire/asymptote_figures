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

/*  Margins to give the loop and over-under look.                             */
margin right_margins = TrueMargin(0.0, 4.5cm);
margin left_margins = TrueMargin(18.5cm, 0.0);

/*  Points for the loop part of the drawing.                                  */
vec2.Vec2 A[] = {
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(3.0, 3.0),
    vec2.Vec2(2.0, 4.0),
    vec2.Vec2(1.0, 3.0),
    vec2.Vec2(2.0, 1.0),
    vec2.Vec2(4.0, 0.0),
};

/*  The unknotted loop is a line. These are the defining points.              */
vec2.Vec2 B[] = {
    vec2.Vec2(0.0, -1.0),
    vec2.Vec2(4.0, -1.0)
};

/*  Arrow connecting the two diagrams.                                        */
vec2.Vec2 C[] = {
    vec2.Vec2(2.0, -0.25),
    vec2.Vec2(2.0, -0.75)
};

/*  Draw the loop, preserving over-under information in the diagram.          */
guide g = vec2.CurveThroughPoints(A);
draw(g, right_margins);
draw(g, left_margins);

/*  Draw the line segment.                                                    */
draw(B[0].LineTo(B[1]));

/*  Draw and arrow connecting the two diagrams.                               */
draw(C[0].LineTo(C[1]), default.sharp_arrows);
