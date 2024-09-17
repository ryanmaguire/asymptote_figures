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
 *      Plots a point in the xy plane and draws its polar angle.              *
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
vec2.Vec2 point = vec2.Vec2(-1.0, -1.7320508075688772);

/*  Point for the label for the angle.                                        */
vec2.Vec2 theta = vec2.FromPolar(0.7, -pi/3.0);

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 2;

/*  Length of the grid lines.                                                 */
real grid_length = 2.5;

/*  Add grid lines to the drawing.                                            */
grid.DrawSquareGridLinesWithTickMarks(grid_start, grid_end, grid_length);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxes(grid_length);

/*  Draw a vector representing the point in the plane.                        */
draw(vec2.Origin.LineTo(point), default.blue_pen);

/*  Draw an arc representing the angle.                                       */
draw(vec2.Arc(vec2.Origin, 0.5, 0.0, -120.0), default.blue_pen);

/*  Label the arc as well.                                                    */
theta.AddLabel("$\theta$");

/*  Label the point in Cartesian coordinates.                                 */
point.DrawDot(0.05);
point.AddLabel("$(-1,\,-\sqrt{3})$", vec2.SouthWest);
