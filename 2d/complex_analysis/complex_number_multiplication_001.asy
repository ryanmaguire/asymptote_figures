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

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Margins for the arrows at the ends of the lines that are drawn.           */
margin margins = TrueMargin(0.0cm, 0.08cm);

/*  Radius for the dots indicating points in the plane.                       */
real dot_radius = 0.05;

/*  The point under consideration.                                            */
vec2.Vec2 z = vec2.Vec2(2.0, 1.0);
vec2.Vec2 w = vec2.Vec2(2.0, 2.0);
vec2.Vec2 prod = vec2.Vec2(z.x*w.x - z.y*w.y, z.x*w.y + z.y*w.x);

/*  Labels for the arrows drawn between points.                               */
Label z_label = Label("$z$", position = 0.5);
Label w_label = Label("$w$", position = 0.5);

/*  Radians-to-Degrees conversion factor.                                     */
real rad2deg = 180.0 / pi;

/*  The angle to point z makes with the real axis.                            */
real theta_angle = z.PolarAngle() * rad2deg;
real theta_radius = 0.5 * z.Norm();
path theta_arc = vec2.Arc(vec2.Origin, theta_radius, 0.0, theta_angle);
Label theta_label = Label("$\theta$", position = 0.5);

/*  The angle to point w makes with the real axis.                            */
real psi_angle = w.PolarAngle() * rad2deg;
real psi_radius = w.Norm() * 0.88;
path psi_arc = vec2.Arc(vec2.Origin, psi_radius, 0.0, psi_angle);
Label psi_label = Label("$\psi$", position = 0.5);

/*  The angle the product z*w makes with the real axis.                       */
real sum_angle = psi_angle + theta_angle;
real sum_radius = prod.Norm() * 0.6;
path sum_arc = vec2.Arc(vec2.Origin, sum_radius, 0.0, sum_angle);
Label sum_label = Label("$\theta+\psi$", position = 0.5);

/*  Rotation transform to draw the angle theta twice. Once from the real axis *
 *  to the point z. And again from the point w to the point z*w.              */
transform w_rotate = rotate(w.PolarAngle() * rad2deg);

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 6.9;
real y_start = -1.4;
real y_end = 6.9;

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelCoordinateAxesWithGridLines(
    x_start,
    x_end,
    y_start,
    y_end,
    y_suffix = "i",
    x_string = "\textrm{Re}(z)",
    y_string = "\textrm{Im}(z)"
);

/*  Draw the arrows indicating the product of z and w.                        */
draw(vec2.Origin.LineTo(prod), default.thin_dash_pen);
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(vec2.Origin.LineTo(w), default.sharp_arrow, margins);

/*  Add the points z, w, and the product z*w, and label everything.           */
z.DrawDot(dot_radius);
w.DrawDot(dot_radius);
prod.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.NorthWest);
w.AddLabel("$w$", vec2.NorthWest);
prod.AddLabel("$zw$", vec2.NorthEast);

/*  Draw the arcs representing the angles the points make with the real axis. */
draw(theta_label, theta_arc, default.thin_dash_pen);
draw(theta_label, w_rotate * theta_arc, default.thin_dash_pen);
draw(psi_label, psi_arc, default.thin_dash_pen);
draw(sum_label, sum_arc, default.thin_dash_pen);
