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
real xend = 1.5;
real ystart = -0.1;
real yend = 1.0;

real xshift = 0.2;
real xmiddle = 0.5 + xshift;
real xlast = 1.0 + xshift;

real tick_length = 0.0125;
vec2.Vec2 a_tick_top = vec2.Vec2(xshift, 0.0);
vec2.Vec2 a_tick_bottom = vec2.Vec2(xshift, -tick_length);
vec2.Vec2 b_tick_top = vec2.Vec2(xlast, 0.0);
vec2.Vec2 b_tick_bottom = vec2.Vec2(xlast, -tick_length);

Label a_label = Label("$a$", position = 1.0);
Label b_label = Label("$b$", position = 1.0);

/*  Parameters for the function to be drawn.                                  */
real fstart = xmiddle;
real fend = xlast;
int samples = 100;

real func(real x)
{
    real y = x - xshift;
    return 0.25*cos(2.0 * pi * y) + 0.5;
}

vec2.Vec2 P0 = vec2.Vec2(xshift, 0.5);
vec2.Vec2 P1 = vec2.Vec2(xmiddle, 0.125);
vec2.Vec2 Q1 = vec2.Vec2(xmiddle, func(xmiddle));
vec2.Vec2 Q2 = vec2.Vec2(xlast, func(xlast));

/*  Construct a smooth curve passing through all of the points.               */
path curve = pf.PathFromFunction(func, fstart, fend, samples);

/*  Draw the axes and the path for the curve.                                 */
axes.DrawAndLabelCoordinateAxes(xstart, xend, ystart, yend);
draw(curve);

draw(P0.LineTo(P1));
draw(P0.LineTo(P0.ProjectX()), default.thin_dash_pen);
draw(Q2.LineTo(Q2.ProjectX()), default.thin_dash_pen);
P0.DrawDot(0.25 * default.dot_radius);
P1.DrawDot(0.25 * default.dot_radius);
Q2.DrawDot(0.25 * default.dot_radius);
filldraw(Q1.Circle(0.25 * default.dot_radius), white, black);
draw(a_label, a_tick_top.LineTo(a_tick_bottom), default.thin_pen);
draw(b_label, b_tick_top.LineTo(b_tick_bottom), default.thin_pen);
