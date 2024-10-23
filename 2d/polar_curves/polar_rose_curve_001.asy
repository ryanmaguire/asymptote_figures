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
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for constructing polar (radial and azimuthal) axes.             */
import polar_axes as pa;

/*  Functions for creating paths from parametric equations provided here.     */
import parametric_curves as pc;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The number of circles used in the polar axes.                             */
int number_of_primary_circles = 5;

/*  Path for the function. The function is described below parametrically.    */
path rose_curve;

/*  Parameters for the parametric equation. It is a function of polar angle.  */
real start = 0.0;
real end = 2.0 * pi;
int samples = 512;

/*  The "rose" curve to be drawn in the plane.                                */
vec2.Vec2 curve(real theta)
{
    real r = 2.0 * cos(2.0 * theta);
    real x = r * cos(theta);
    real y = r * sin(theta);
    return vec2.Vec2(x, y);
}

/*  Create the axes and the grid lines.                                       */
pa.DrawPolarAxes(number_of_primary_circles);

/*  Create the path from the function. It is defined on [0, 2pi].             */
rose_curve = pc.PathFromParametricFunction(curve, start, end, samples);

/*  Plot the function. To help differentiate from the grid lines, use blue.   */
draw(rose_curve, default.blue_pen);
