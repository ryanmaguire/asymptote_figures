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
 *      Creates a visual for the Pythagorean formula in the plane.            *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The point under consideration.                                            */
vec2.Vec2 point = vec2.Vec2(4, 2);
vec2.Vec2 pointX = point.ProjectX();
vec2.Vec2 pointY = point.ProjectY();

/*  Length of the grid lines.                                                 */
real start = -1.2;
real end = 4.4;

/*  Radius for the dots used to label points.                                 */
real dot_radius = 0.05;

/*  Label for the Pythagorean formula.                                        */
string math_string = "$\sqrt{a^{2}+b^{2}}$";
Label L = rotate(27.0) * Label(math_string, position = 0.5);

/*  Draw the coordinate axes with labels and grid lines.                      */
axes.DrawAndLabelCoordinateAxesWithGridLines(start, end, start, end);

/*  Add a dot for the point.                                                  */
point.DrawDot(dot_radius);

/*  Draw a line and label it with the Pythagorean formula.                    */
draw(L, vec2.Origin.LineTo(point));

/*  Draw dashed lines for the projections onto the two axes.                  */
draw(point.LineTo(pointY), default.thin_dash_pen);
draw(point.LineTo(pointX), default.thin_dash_pen);

/*  Label the projections as well.                                            */
pointX.AddLabel("$a$", vec2.NorthWest);
pointY.AddLabel("$b$", vec2.SouthEast);
