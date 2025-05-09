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
 *      Draw a line representing an affine equation y = ax + b in the plane.  *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Length of the axes.                                                       */
real axis_length = 3.95;

/*  Start and end points for the line representing the linear equation.       */
vec2.Vec2 start = vec2.Vec2(-2.17, -3.95);
vec2.Vec2 end = vec2.Vec2(2.57, 3.95);

/*  Points for the dots in the figure.                                        */
vec2.Vec2 D1 = vec2.Vec2(-1.0, -2.0);
vec2.Vec2 D2 = vec2.Vec2(2.0, 3.0);

/*  Points for the labels for the dots.                                       */
vec2.Vec2 L1 = vec2.Vec2(+1.58, +3.50);
vec2.Vec2 L2 = vec2.Vec2(-2.08, -1.50);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(axis_length);

/*  Draw the line representing the linear equation.                           */
draw(start.LineTo(end));

/*  Label two points on the line.                                             */
vec2.DrawDot(D1, default.dot_radius);
vec2.DrawDot(D2, default.dot_radius);
vec2.AddLabel("$(2, 3)$", L1);
vec2.AddLabel("$(-1, -2)$", L2);
