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
 *      Draws arrows for subtraction in the complex plane.                    *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Margins for the arrows to prevent them from overlapping.                  */
margin margins = TrueMargin(0.0cm, 0.08cm);

/*  Radius for dots marking the points in the plane.                          */
real dot_radius = 0.05;

/*  The point under consideration.                                            */
vec2.Vec2 z = vec2.Vec2(3.0, 1.0);
vec2.Vec2 w = vec2.Vec2(1.0, 3.0);
vec2.Vec2 diff = z - w;

/*  Labels for the arrows drawn between points.                               */
Label z_label = Label("$z$", position = 0.5);
Label w_label = Label("$w$", position = 0.5);

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 4;

/*  Points specifying the coordinate axes and grid lines.                     */
vec2.Vec2 axis_start = vec2.Vec2(-2.4, -2.4);
vec2.Vec2 axis_end = vec2.Vec2(4.7, 4.7);

/*  Add grid lines to the drawing.                                            */
grid.DrawGridLines(grid_start, grid_end, axis_start, axis_end);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelCoordinateAxesWithTickMarks(
    axis_start,
    axis_end,
    y_suffix = "i",
    x_string = "\textrm{Re}(z)",
    y_string = "\textrm{Im}(z)"
);

/*  Draw the arrows indicating the difference of z and w.                     */
draw(vec2.Origin.LineTo(diff), default.thin_dash_pen);
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(vec2.Origin.LineTo(w), default.sharp_arrow, margins);
draw(diff.LineTo(z), default.sharp_arrow, margins);
draw(diff.LineTo(w), default.sharp_arrow, margins);

z.DrawDot(dot_radius);
w.DrawDot(dot_radius);
diff.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.SouthEast);
w.AddLabel("$w$", vec2.NorthWest);
diff.AddLabel("$z-w$", vec2.East);
