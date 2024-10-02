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
 *      Draws an area formed by two vectors in the plane.                     *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The parallelogram is formed by two vectors, the origin, and their sum.    */
vec2.Vec2 v0 = vec2.Vec2(7.0, 6.0);
vec2.Vec2 v1 = vec2.Vec2(5.0, 3.0);
vec2.Vec2 sum = v0 + v1;

/*  Create a path from this and so we can fill in the parallelogram.          */
vec2.Vec2[] path_points = {vec2.Origin, v0, sum, v1};
path parallelogram = vec2.PolygonThroughPoints(path_points, closed = true);

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 13;
vec2.Vec2 start = vec2.Vec2(-2.5, -2.5);
vec2.Vec2 end = vec2.Vec2(13.5, 13.5);

/*  Create the plot with tick-marks, axes, and directed arrows.               */
grid.DrawGridLinesWithTickMarks(grid_start, grid_end, start, end, grid_skip=2);
axes.DrawAndLabelCoordinateAxes(start, end);

/*  Draw vectors representing the edges of the parallelogram.                 */
filldraw(parallelogram, default.gray_transparent_pen);
draw(vec2.Origin.LineTo(v0), default.blue_pen, default.sharp_arrow);
draw(vec2.Origin.LineTo(v1), default.blue_pen, default.sharp_arrow);
draw(v0.LineTo(sum), default.blue_pen, default.sharp_arrow);
draw(v1.LineTo(sum), default.blue_pen, default.sharp_arrow);

/*  Label the vertices of the parallelogram.                                  */
v0.AddLabel(v0.AsString(), vec2.NorthWest);
v1.AddLabel(v1.AsString(), vec2.SouthEast);
sum.AddLabel(sum.AsString(), vec2.NorthEast);
