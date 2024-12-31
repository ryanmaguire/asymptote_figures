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
 *  Author:     Ryan Maguire                                                  *
 *  Date:       October 6, 2021                                               *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Figure from a first semester calculus course. This shows a secant     *
 *      line approximating the derivative at a particular point.              *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Functions for creating paths from real-valued functions.                  */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_256_default_settings as default;

/*  The function being plotted.                                               */
real func(real x)
{
    return x*x;
}

/*  Number of samples for the function.                                       */
int samples = 30;

/*  Start and end for the x and y axes.                                       */
real xstart = -0.2;
real xend = 1.1;
real ystart = -0.2;
real yend = 1.1;

/*  Start and end points for the function.                                    */
real fstart = -0.1;
real fend = 1.0;

/*  Displacement for the secant line.                                         */
real dx = 0.4;

/*  The point we care about.                                                  */
real x0 = 0.2;
real y0 = func(x0);

/*  The point (x0, y0) and the perturbed point creating the secant line.      */
vec2.Vec2 P0 = vec2.Vec2(x0, y0);
vec2.Vec2 P1 = vec2.Vec2(x0 + dx, func(x0 + dx));

/*  The bottom of the right-angle triangle made by P0 and P1.                 */
vec2.Vec2 corner = vec2.Vec2(P0.x, P1.y);

/*  Variables for the secant line, including the slope and y-intercept.       */
real m = (P1.y - P0.y)/(P1.x - P0.x);
real b = y0 - m*x0;
vec2.Vec2 Q0 = vec2.Vec2(fstart, m*fstart + b);
vec2.Vec2 Q1 = vec2.Vec2(fend, m*fend + b);

/*  Path for the function.                                                    */
path func_path = pf.PathFromFunction(func, fstart, fend, samples);

/*  Draw the axes and the path for the function.                              */
axes.DrawAndLabelCoordinateAxes(
    xstart,         /*  Left-most end-point for the x axis.     */
    xend,           /*  Right-most end-point for the x axis.    */
    ystart,         /*  Bottom-most end-point for the y axis.   */
    yend,           /*  Top-most end-point for the y axis.      */
    x_string = "t", /*  Label for the x-axis, which is time.    */
    y_string = "x"  /*  Label for the y-axis, which is position.*/
);

draw(func_path);

/*  Draw dashed lines creating the right angled triangle.                     */
draw(P0.LineTo(corner), default.dash_pen);
draw(P1.LineTo(corner), default.dash_pen);

/*  Draw the secant line.                                                     */
draw(Q0.LineTo(Q1));

/*  Draw the dots.                                                            */
P0.DrawDot(0.25 * default.dot_radius);
P1.DrawDot(0.25 * default.dot_radius);
corner.DrawDot(0.25 * default.dot_radius);
