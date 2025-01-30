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
 *      Draws the x axis, labeled as the real line.                           *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The point under consideration.                                            */
vec2.Vec2 point = vec2.Vec2(4.7, 0.0);
vec2.Vec2 point_label = vec2.Vec2(3.3, 2.5);

/*  Length of the grid lines.                                                 */
real grid_length = 6.7;

/*  Radius for the dots used to label points.                                 */
real dot_radius = 0.15;

/*  Draw the coordinate axes with grid lines.                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(
    grid_length, x_skip = 2, y_skip = 2
);

/*  Label the point in Cartesian coordinates.                                 */
point.DrawDot(dot_radius);
point_label.AddLabel("$r=(r,\,0)$");
draw(point_label.LineTo(point), default.sharp_arrow, default.margins);
