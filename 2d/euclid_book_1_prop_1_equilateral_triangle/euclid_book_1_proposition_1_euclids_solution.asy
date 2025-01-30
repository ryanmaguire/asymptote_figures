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
 *      Draws the construction of an equilateral triangle described by        *
 *      Euclid in book 1 proposition 1.                                       *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Functions for drawing polygonal figures found here.                       */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Radius used for the two circles in Euclid's construction.                 */
real radius = 1.0;

/*  Radius of a dot used to mark a point.                                     */
real dot_radius = 0.025;

/*  Location of the 3 points for Euclid's construction.                       */
vec2.Vec2 triangle_points[] = {
    vec2.Origin,
    vec2.Vec2(radius, 0.0),
    vec2.FromPolar(radius, pi / 3.0)
};

/*  Create a closed path through the points.                                  */
path triangle = pf.PolyFromPoints(triangle_points, closed = true);

/*  Draw the triangle and fill it in green.                                   */
filldraw(triangle, green, black);

/*  Draw the two circles in Euclid's construction.                            */
triangle_points[0].DrawCircle(radius);
triangle_points[1].DrawCircle(radius);

/*  Mark and label all of the points.                                         */
triangle_points[0].DrawDot(dot_radius);
triangle_points[1].DrawDot(dot_radius);
triangle_points[2].DrawDot(dot_radius);

triangle_points[0].AddLabel("$A$", 2.0 * vec2.SouthWest);
triangle_points[1].AddLabel("$B$", 2.0 * vec2.SouthEast);
triangle_points[2].AddLabel("$C$", 2.0 * vec2.North);
