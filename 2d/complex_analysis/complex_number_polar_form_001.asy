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
 *      Draws a point in the complex plane in polar form.                     *
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
vec2.Vec2 z = vec2.Vec2(3.0, 2.0);

/*  Radians-to-Degrees conversion factor.                                     */
real rad2deg = 180.0 / pi;

/*  The polar angle for the point.                                            */
real theta_angle = z.PolarAngle() * rad2deg;
real theta_radius = 0.4 * z.Norm();
path theta_arc = vec2.Arc(vec2.Origin, theta_radius, 0.0, theta_angle);
Label theta_label = Label("$\theta$", position = 0.5);
Label r_label = Label("$r$", position = 0.5, vec2.NorthWest.AsPair());

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 3.9;
real y_start = -1.4;
real y_end = 3.9;

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

/*  Draw the arrows indicating the point z.                                   */
draw(r_label, vec2.Origin.LineTo(z), default.sharp_arrow, margins);

/*  Mark the point z and label it.                                            */
z.DrawDot(dot_radius);
z.AddLabel("$z$", vec2.NorthWest);

/*  Draw the angle the point z makes with the real axis.                      */
draw(theta_label, theta_arc, default.thin_dash_pen);
