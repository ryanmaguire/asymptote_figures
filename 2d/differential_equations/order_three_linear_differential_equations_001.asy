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
 *      Plots a family of solutions to x''' = x' with x(0) = x'(0) = 1.       *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for creating paths from real-valued functions.                  */
import path_functions as pf;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Length of the coordinate axes and grid lines.                             */
real grid_length = 3.4;

/*  Parameter for the differential equation x''' = x' with x(0) = x'(0) = 1.  */
real ode_a;

/*  Number of samples used in drawing the solutions.                          */
int samples = 20;

/*  Sample parameters for plotting solutions.                                 */
real[] a_samples = {-1.0, 0.0, 0.5, 1.0, 2.0};
real[] a_start = {-1.21, -1.61, -2.1, -3.0, -1.52};
real[] a_end = {1.9, 3.0, 1.44, 1.09, 0.83};
pen[] colors = {
    default.blue_pen,
    default.red_pen,
    default.green_pen,
    default.cyan_pen,
    default.magenta_pen
};

/*  Index for varying over the a parameter.                                   */
int n;

/*  The solutions to x''' = x' with x(0) = x'(0) = 1, parameterized by "a".   */
real solution(real t)
{
    real exp_t = exp(t);
    real diff = 1.0 - ode_a;
    return 2.0*diff + ode_a*exp_t - diff / exp_t;
}

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxesWithGridLines(grid_length);

/*  Loop over the five solutions and plot them.                               */
for (n = 0; n < 5; ++n)
{
    real left = a_start[n];
    real right = a_end[n];
    ode_a = a_samples[n];
    path g = pf.PathFromFunction(solution, left, right, samples);
    draw(g, colors[n], default.sharp_arrows);
}

/*  Label the solution parameter.                                             */
label("$c=-1$", (2.0, -3.2));
label("$c=0$", (2.5, 1.6));
label("$c=0.5$", (-2.6, -2.5));
label("$c=1$", (-2.0, 0.5));
label("$c=2$", (-2.0, 2.7));
