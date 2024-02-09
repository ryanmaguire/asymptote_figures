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
 *      Draws an oriented trefoil with unsigned Gauss code.                   *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Coordinates for the vertices of the graph.                                */
vec2.Vec2 A[] = {
    vec2.Vec2(-1.0, 1.0),
    vec2.Vec2(0.0, 0.0),
    vec2.Vec2(1.0, -1.0)
};

vec2.Vec2 B[] = {
    vec2.Vec2(1.0, 1.0),
    vec2.Vec2(-1.0, -1.0)
};

/*  Radius of the dots.                                                       */
default.dot_radius = 0.02;

/*  Draw the edges.                                                           */
draw(A[0].LineTo(B[0]));
draw(A[0].LineTo(B[1]));
draw(A[1].LineTo(B[0]));
draw(A[1].LineTo(B[1]));
draw(A[2].LineTo(B[0]));
draw(A[2].LineTo(B[1]));

/*  Dots for the vertices of the graph.                                       */
A[0].DrawDot(default.dot_radius);
A[1].DrawDot(default.dot_radius);
A[2].DrawDot(default.dot_radius);
B[0].DrawDot(default.dot_radius);
B[1].DrawDot(default.dot_radius);
