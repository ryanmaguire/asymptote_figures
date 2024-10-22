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
 *      Draws the geometry behind complex number multiplication.              *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

margin margins = TrueMargin(0.0cm, 0.08cm);

real dot_radius = 0.05;

/*  The point under consideration.                                            */
vec2.Vec2 z = vec2.Vec2(2.0, 1.0);
vec2.Vec2 w = vec2.Vec2(2.0, 2.0);
vec2.Vec2 prod = vec2.Vec2(z.x*w.x - z.y*w.y, z.x*w.y + z.y*w.x);

/*  Labels for the arrows drawn between points.                               */
Label z_label = Label("$z$", position = 0.5);
Label w_label = Label("$w$", position = 0.5);

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -1;
int grid_end = 6;

/*  Points specifying the coordinate axes and grid lines.                     */
vec2.Vec2 axis_start = vec2.Vec2(-1.4, -1.4);
vec2.Vec2 axis_end = vec2.Vec2(6.7, 6.7);

real rad2deg = 180.0 / pi;

real theta_angle = z.PolarAngle() * rad2deg;
real theta_radius = 0.43 * z.Norm();
path theta_arc = vec2.Arc(vec2.Origin, theta_radius, 0.0, theta_angle);
Label theta_label = Label("$\theta$", position = 0.5);

real psi_angle = w.PolarAngle() * rad2deg;
real psi_radius = w.Norm() * 0.58;
path psi_arc = vec2.Arc(vec2.Origin, psi_radius, 0.0, psi_angle);
Label psi_label = Label("$\psi$", position = 0.3);

real sum_angle = psi_angle + theta_angle;
real sum_radius = prod.Norm() * 0.5;
path sum_arc = vec2.Arc(vec2.Origin, sum_radius, 0.0, sum_angle);
Label sum_label = Label("$\theta+\psi$", position = 0.5);

transform w_rotate = rotate(w.PolarAngle() * rad2deg);

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

/*  Draw the arrows indicating the sum of z and w.                            */
draw(vec2.Origin.LineTo(prod), default.thin_dash_pen);
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(vec2.Origin.LineTo(w), default.sharp_arrow, margins);

z.DrawDot(dot_radius);
w.DrawDot(dot_radius);
prod.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.NorthWest);
w.AddLabel("$w$", vec2.NorthWest);
prod.AddLabel("$zw$", vec2.NorthEast);

draw(theta_label, theta_arc, default.thin_dash_pen);
draw(theta_label, w_rotate * theta_arc, default.thin_dash_pen);

draw(psi_label, psi_arc, default.thin_dash_pen);
draw(sum_label, sum_arc, default.thin_dash_pen);
