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
 *      Draw a visual for the slope-intercept form of a line.                 *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Length of the grid lines.                                                 */
real axis_length = 3.9;

/*  Start and end points for the line representing the linear equation.       */
vec2.Vec2 start = vec2.Vec2(-4.0, -1.0);
vec2.Vec2 end = vec2.Vec2(4.0, 3.0);

/*  Coordinates for the points on the triangle indicating rise over run.      */
vec2.Vec2 p1 = vec2.Vec2(0.0, 1.0);
vec2.Vec2 p2 = vec2.Vec2(2.0, 1.0);
vec2.Vec2 p3 = vec2.Vec2(2.0, 2.0);

/*  Coordinates for the labels for the function y = mx + b and rise/run.      */
vec2.Vec2 m = vec2.Vec2(-2.7, 2.7);
vec2.Vec2 b = vec2.Vec2(-2.1, 1.6);
vec2.Vec2 y = vec2.Vec2(2.0, 3.3);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(axis_length);

/*  Draw the line.                                                            */
draw(start.LineTo(end));

/*  Mark points on the line to help indicate the rise and the run.            */
vec2.DrawDot(p1, default.dot_radius);
vec2.DrawDot(p2, default.dot_radius);
vec2.DrawDot(p3, default.dot_radius);

/*  Draw perpendicular lines to form a triangle.                              */
draw(Label("Rise"), p2.LineTo(p3), E, default.dash_pen);
draw(Label("Run"), p1.LineTo(p2), S, default.dash_pen);

/*  Labels for the equation y = mx + b.                                       */
vec2.AddLabel("$m=\frac{\textrm{Rise}}{\textrm{Run}}$", m);
vec2.AddLabel("$b=y\textrm{-intercept}$", b);
vec2.AddLabel("$y=mx+b$", y);
