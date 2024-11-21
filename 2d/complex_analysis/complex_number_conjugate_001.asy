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
 *      Draws arrows representing the complex conjugate of a point.           *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Margins for the arrows at the ends of the lines that are drawn.           */
margin margins = TrueMargin(0.0cm, 0.15cm);

/*  Radius for the dots indicating points in the plane.                       */
real dot_radius = 0.05;

/*  The points under consideration.                                           */
vec2.Vec2 z = vec2.Vec2(3.0, 2.0);
vec2.Vec2 w = vec2.Vec2(z.x, -z.y);

/*  Conversion factor from radians to degrees.                                */
real rad2deg = 180.0 / pi;

/*  Angle for the point z.                                                    */
real theta_angle = z.PolarAngle() * rad2deg;
real theta_radius = 0.5 * z.Norm();
path theta_arc = vec2.Arc(vec2.Origin, theta_radius, 0.0, theta_angle);
Label theta_label = Label("$\theta$", position = 0.5);

/*  Angle for the complex conjugate of z.                                     */
real psi_angle = -theta_angle;
real psi_radius = theta_radius;
path psi_arc = vec2.Arc(vec2.Origin, psi_radius, psi_angle, 0.0);
Label psi_label = Label("$-\theta$", position = 0.5);

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 3.9;
real y_start = -2.9;
real y_end = -y_start;

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
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(vec2.Origin.LineTo(w), default.sharp_arrow, margins);

/*  Draw the point z and its complex conjugate and label everything.          */
z.DrawDot(dot_radius);
w.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.NorthWest);
w.AddLabel("$\textrm{conj}(z)$", vec2.SouthWest);

/*  Add arcs indicating the angles made by z and conj(z).                     */
draw(theta_label, theta_arc, default.thin_dash_pen);
draw(psi_label, psi_arc, default.thin_dash_pen);
