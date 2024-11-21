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
 *      Draw a line representing a linear equation y = ax in the plane.       *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Length of the coordinate axes.                                            */
real axis_length = 3.95;

/*  Start and end points for the line representing the linear equation.       */
vec2.Vec2 start = vec2.Vec2(-axis_length, -axis_length);
vec2.Vec2 end = vec2.Vec2(axis_length, axis_length);

/*  Points for the labels.                                                    */
vec2.Vec2 O = vec2.Vec2(0.0, 0.0);
vec2.Vec2 P = vec2.Vec2(1.0, 1.0);
vec2.Vec2 L1 = vec2.Vec2(-0.58, 0.5);
vec2.Vec2 L2 = vec2.Vec2(+0.58, 1.5);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(axis_length);

/*  Draw the line representing the linear equation.                           */
draw(start.LineTo(end));

/*  Label two points on the line.                                             */
vec2.DrawDot(O, default.dot_radius);
vec2.DrawDot(P, default.dot_radius);
vec2.AddLabel("$(0, 0)$", L1);
vec2.AddLabel("$(1, 1)$", L2);
