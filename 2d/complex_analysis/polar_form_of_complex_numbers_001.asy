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
 *      Plots a point in the complex plane and draws its polar coordinates.   *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The point under consideration.                                            */
real radius = 7.0 * sqrt(2.0);
real angle = 3.0 * pi / 4.0;
vec2.Vec2 point = vec2.FromPolar(radius, angle);

/*  Points for labeling the radial component and the angle.                   */
vec2.Vec2 r_point = 0.5*point;
vec2.Vec2 theta_point = vec2.FromPolar(1.5, 0.5 * angle);

/*  Get the x and y projection for plotting.                                  */
vec2.Vec2 x_projection = point.ProjectX();
vec2.Vec2 y_projection = point.ProjectY();

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -10;
int grid_end = 10;

/*  Length of the grid lines.                                                 */
real grid_length = 11.0;

/*  Radius for the dots used to label points.                                 */
real dot_radius = 0.15;

/*  Add grid lines to the drawing.                                            */
grid.DrawSquareGridLinesWithTickMarks(
    grid_start, grid_end, grid_length, grid_skip = 2
);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxes(grid_length);

/*  Draw a line representing the point in the plane.                          */
draw(vec2.Origin.LineTo(point), default.blue_pen);

/*  Draw an arc representing the angle.                                       */
draw(vec2.Arc(vec2.Origin, 0.8, 0.0, 135.0), default.blue_pen);

/*  Dashed lines representing the projections.                                */
draw(point.LineTo(x_projection), default.dash_pen);
draw(point.LineTo(y_projection), default.dash_pen);

/*  Label the point in Cartesian coordinates.                                 */
point.DrawDot(dot_radius);
x_projection.AddLabel("$-7$", vec2.NorthEast);
y_projection.AddLabel("$7$", vec2.East);
point.AddLabel("$(-7,\,7)$", vec2.NorthEast);

/*  Add labels for the radial component and the angle.                        */
r_point.AddLabel("$r$", vec2.North);
theta_point.AddLabel("$\theta$");
