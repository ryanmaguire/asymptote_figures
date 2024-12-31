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
 *  Date:       December 31, 2024                                             *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Figure for Rolle's theorem.                                           *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Functions for creating smooth splines through points provided here.       */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_256_default_settings as default;

/*  Start and end for the x and y axes.                                       */
real xstart = -0.1;
real xend = 1.2;
real ystart = -0.1;
real yend = 1.0;

/*  Parameters for the function to be drawn.                                  */
real fstart = 0.1;
real fend = 1.1;
int samples = 40;

/*  MVT is Rolle's theorem with a shift. Set parameters for the shift.        */
real m = 0.25;
real b = 0.125;

/*  The function. It evaluates to zero at both 0.1 and 1.1.                   */
real func(real x)
{
    real y = x - 0.1;
    real y_squared = y*y;
    real y_cubed = y * y_squared;
    real y_shift = 1.0 - y;
    real y_shift_squared = y_shift * y_shift;

    real rolle = 16.0 * y_cubed * y_shift_squared;

    return rolle + b + m*y;
}

/*  The point where the derivative is zero.                                   */
real x0 = 0.7;
real y0 = func(x0);
vec2.Vec2 point = vec2.Vec2(x0, y0);
vec2.Vec2 proj = point.ProjectX();
vec2.Vec2 Q0 = vec2.Vec2(fstart, y0 + m*(fstart - x0));
vec2.Vec2 Q1 = vec2.Vec2(fend, y0 + m*(fend - x0));
vec2.Vec2 P0 = vec2.Vec2(fstart, func(fstart));
vec2.Vec2 P1 = vec2.Vec2(fend, func(fend));

/*  Points for the tick marks.                                                */
real tick_length = 0.0125;
vec2.Vec2 a_tick_top = vec2.Vec2(fstart, 0.0);
vec2.Vec2 a_tick_bottom = vec2.Vec2(fstart, -tick_length);
vec2.Vec2 b_tick_top = vec2.Vec2(fend, 0.0);
vec2.Vec2 b_tick_bottom = vec2.Vec2(fend, -tick_length);
vec2.Vec2 c_tick_top = vec2.Vec2(x0, 0.0);
vec2.Vec2 c_tick_bottom = vec2.Vec2(x0, -tick_length);

/*  Labels for the tick marks, and for the point c in the middle.             */
Label a_label = Label("$a$", position = 1.0);
Label b_label = Label("$b$", position = 1.0);
Label c_label = Label("$c$", position = 1.0);

/*  Construct a smooth curve passing through all of the points.               */
path curve = pf.PathFromFunction(func, fstart, fend, samples);

/*  Draw the axes and the path for the curve.                                 */
axes.DrawAndLabelCoordinateAxes(xstart, xend, ystart, yend);
draw(curve);

/*  Label the point and draw the tangent line.                                */
draw(Q0.LineTo(Q1), default.blue_thin_pen);
draw(point.LineTo(proj), default.thin_dash_pen);
point.DrawDot(0.125 * default.dot_radius);

/*  Draw the secant line as well.                                             */
draw(P0.LineTo(P1), default.red_thin_pen);

/*  Tick marks for "a", "b", and "c".                                         */
draw(a_label, a_tick_top.LineTo(a_tick_bottom), default.thin_pen);
draw(b_label, b_tick_top.LineTo(b_tick_bottom), default.thin_pen);
draw(c_label, c_tick_top.LineTo(c_tick_bottom), default.thin_pen);

/*  Dashed lines and dots indicating f(a) and f(b).                           */
draw(P0.LineTo(P0.ProjectX()), default.thin_dash_pen);
draw(P1.LineTo(P1.ProjectX()), default.thin_dash_pen);
P0.DrawDot(0.125 * default.dot_radius);
P1.DrawDot(0.125 * default.dot_radius);
