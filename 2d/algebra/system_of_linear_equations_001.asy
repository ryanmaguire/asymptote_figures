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
 *      Draw two lines representing a linear system of equations.             *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_256_default_settings as default;

/*  Length of the axes.                                                       */
real axis_length = 3.98;

/*  Start and end points for the lines representing the linear equations.     */
vec2.Vec2 starta = vec2.Vec2(-4.0, 3.0);
vec2.Vec2 enda = vec2.Vec2(4.0, -2.333333);
vec2.Vec2 startb = vec2.Vec2(-4.0, 1.0);
vec2.Vec2 endb = vec2.Vec2(4.0, -0.333333);

/*  Points for the labels.                                                    */
vec2.Vec2 L1 = vec2.Vec2(-3.0, 3.5);
vec2.Vec2 L2 = vec2.Vec2(-3.0, 1.2);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(axis_length);

/*  Draw the lines representing the linear equations.                         */
draw(starta.LineTo(enda), default.red_pen);
draw(startb.LineTo(endb), default.blue_pen);

/*  Label two points on the line.                                             */
vec2.AddLabel("$2x+3y=1$", L1);
vec2.AddLabel("$x+6y=2$", L2);
