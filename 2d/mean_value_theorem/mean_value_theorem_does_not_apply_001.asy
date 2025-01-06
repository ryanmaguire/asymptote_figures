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
real xend = 1.0;
real ystart = -0.1;
real yend = 1.0;

/*  Parameters for the function to be drawn.                                  */
real fstart = 0.1;
real fend = 1.0;
int samples = 40;

real func(real x)
{
    return 0.1 / x;
}

vec2.Vec2 P0 = vec2.Origin;
vec2.Vec2 P1 = vec2.Vec2(1.0, func(1.0));



/*  Construct a smooth curve passing through all of the points.               */
path curve = pf.PathFromFunction(func, fstart, fend, samples);

/*  Draw the axes and the path for the curve.                                 */
axes.DrawAndLabelCoordinateAxes(xstart, xend, ystart, yend);
draw(curve);

draw(P0.LineTo(P1), default.red_pen);
P0.DrawDot(0.25 * default.dot_radius);
P1.DrawDot(0.25 * default.dot_radius);
