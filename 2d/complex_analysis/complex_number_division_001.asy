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

/*  Margins for the arrows to prevent them from overlapping with the dots.    */
margin margins = TrueMargin(0.0cm, 0.08cm);

/*  Radius for the dots drawn which represent points in the plane.            */
real dot_radius = 0.03;

/*  The points under consideration.                                           */
vec2.Vec2 z = vec2.Vec2(1.0, 4.0);
vec2.Vec2 w = vec2.Vec2(4.0, 1.0);
vec2.Vec2 winv = vec2.Vec2(w.x, -w.y) / w.NormSq();
vec2.Vec2 div = vec2.Vec2(z.x*winv.x - z.y*winv.y, z.x*winv.y + z.y*winv.x);

/*  Radians-to-Degrees conversion factor.                                     */
real rad2deg = 180.0 / pi;

/*  The angle the point z makes with the real axis.                           */
real theta_angle = z.PolarAngle() * rad2deg;
real theta_radius = 0.4 * z.Norm();
path theta_arc = vec2.Arc(vec2.Origin, theta_radius, 0.0, theta_angle);
Label theta_label = Label("$\theta$", position = 0.5);

/*  The angle the point w makes with the real axis.                           */
real psi_angle = w.PolarAngle() * rad2deg;
real psi_radius = w.Norm() * 0.5;
path psi_arc = vec2.Arc(vec2.Origin, psi_radius, 0.0, psi_angle);
Label psi_label = Label("$\psi$", position = 0.5);

/*  The angle the quotient z / w makes with the real axis.                    */
real diff_angle = theta_angle - psi_angle;
real diff_radius = div.Norm() * 0.5;
path diff_arc = vec2.Arc(vec2.Origin, diff_radius, 0.0, diff_angle);
Label diff_label = Label("$\theta-\psi$", position = 0.6);

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 4.9;
real y_start = -1.4;
real y_end = 4.9;

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

/*  Draw the arrows indicating the sum of z and w.                            */
draw(vec2.Origin.LineTo(div), default.thin_dash_pen);
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(vec2.Origin.LineTo(w), default.sharp_arrow, margins);

/*  Add the points and give them labels.                                      */
z.DrawDot(dot_radius);
w.DrawDot(dot_radius);
div.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.NorthWest);
w.AddLabel("$w$", vec2.NorthWest);
div.AddLabel("$z/w$", vec2.NorthEast);

/*  Label the angles for z, w, and the quotient z / w.                        */
draw(theta_label, theta_arc, default.thin_dash_pen);
draw(psi_label, psi_arc, default.thin_dash_pen);
draw(diff_label, diff_arc, default.thin_dash_pen);
