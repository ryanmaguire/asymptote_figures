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
 *      Draws the real part of a point in the complex plane.                  *
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
vec2.Vec2 z = vec2.Vec2(1.4, 1.7);
vec2.Vec2 re = z.ProjectX();

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 2.7;
real y_start = -1.4;
real y_end = 2.7;

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

/*  Draw the arrows indicating the point z and the real part of z.            */
draw(vec2.Origin.LineTo(z), default.sharp_arrow, margins);
draw(z.LineTo(re), default.thin_dash_pen);

/*  Mark the point z, and add labels to z and real(z).                        */
z.DrawDot(dot_radius);
z.AddLabel("$z=a+ib$", vec2.NorthWest);
re.AddLabel("$a$", vec2.NorthWest);
re.DrawDot(dot_radius);
