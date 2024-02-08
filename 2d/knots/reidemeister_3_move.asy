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
 *      Draws the Reidemeister 3 move.                                        *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Margins used to create over and under crossings.                          */
margin upper_left_margin = TrueMargin(0.0, 3.0cm);
margin lower_right_margin = TrueMargin(3.0cm, 0.0);
margin left_margin = TrueMargin(0.0, 3.0cm);
margin middle_margin = TrueMargin(0.8cm, 0.8cm);
margin right_margin = TrueMargin(3.0cm, 0.0);

/*  Points for the diagram on the right.                                      */
vec2.Vec2 A0[] = {
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(3.0, 3.0)
};

vec2.Vec2 B0[] = {
    vec2.Vec2(0.0, 3.0),
    vec2.Vec2(3.0, 0.0)
};

vec2.Vec2 C0[] = {
    vec2.Vec2(0.0, 2.5),
    vec2.Vec2(3.0, 2.5)
};

/*  Points for the diagram on the left.                                       */
vec2.Vec2 A1[] = {
    vec2.Vec2(5.0, 0.0),
    vec2.Vec2(8.0, 3.0)
};

vec2.Vec2 B1[] = {
    vec2.Vec2(5.0, 3.0),
    vec2.Vec2(8.0, 0.0)
};

vec2.Vec2 C1[] = {
    vec2.Vec2(5.0, 0.5),
    vec2.Vec2(8.0, 0.5)
};

/*  Arrow for connecting the two diagrams.                                    */
vec2.Vec2 D[] = {
    vec2.Vec2(3.5, 1.5),
    vec2.Vec2(4.5, 1.5)
};

/*  Draw the diagram on the right with crossings.                             */
draw(A0[0].LineTo(A0[1]));
draw(B0[0].LineTo(B0[1]), upper_left_margin);
draw(B0[0].LineTo(B0[1]), lower_right_margin);
draw(C0[0].LineTo(C0[1]), left_margin);
draw(C0[0].LineTo(C0[1]), middle_margin);
draw(C0[0].LineTo(C0[1]), right_margin);

/*  Draw the diagram on the left with crossings.                              */
draw(A1[0].LineTo(A1[1]));
draw(B1[0].LineTo(B1[1]), upper_left_margin);
draw(B1[0].LineTo(B1[1]), lower_right_margin);
draw(C1[0].LineTo(C1[1]), left_margin);
draw(C1[0].LineTo(C1[1]), middle_margin);
draw(C1[0].LineTo(C1[1]), right_margin);

/*  Draw the arrow connecting the two diagrams.                               */
draw(D[0].LineTo(D[1]), default.sharp_arrows);
