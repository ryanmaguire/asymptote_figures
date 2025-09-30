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
 *      Plots for a graphing problem for students studying elementary algebra.*
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Parameters for the two axes, distance (rho) and retarded time (y).        */
real x_start = -0.2;
real x_end = 4.2;
real y_start = -3.2;
real y_end = 1.2;
string x_string = "\rho";
string y_string = "t_{r}";

/*  Start and end for the curve describing the initial guess for Newton's     *
 *  method. It is given by tr_0 = t - (1 / c) * rho, where c is the speed of  *
 *  light, and rho is the location on the x axis. We use c = 1 for this plot. */
vec2.Vec2 start = vec2.Vec2(0.0, 1.0);
vec2.Vec2 end = vec2.Vec2(4.0, -3.0);

/*  Locations for the labels for the two curves.                              */
vec2.Vec2 tr_label = vec2.Vec2(2.5, 0.7);
vec2.Vec2 rho_label = vec2.Vec2(2.44, 0.5);

/*  Array with the pre-computed values for tr, the retarded time, as a        *
 *  function of rho.                                                          */
vec2.Vec2 pts[] = {
    vec2.Vec2(0.00e+00,  5.10973e-01),
    vec2.Vec2(5.00e-02,  5.09609e-01),
    vec2.Vec2(1.00e-01,  5.05520e-01),
    vec2.Vec2(1.50e-01,  4.98725e-01),
    vec2.Vec2(2.00e-01,  4.89250e-01),
    vec2.Vec2(2.50e-01,  4.77130e-01),
    vec2.Vec2(3.00e-01,  4.62406e-01),
    vec2.Vec2(3.50e-01,  4.45122e-01),
    vec2.Vec2(4.00e-01,  4.25324e-01),
    vec2.Vec2(4.50e-01,  4.03054e-01),
    vec2.Vec2(5.00e-01,  3.78351e-01),
    vec2.Vec2(5.50e-01,  3.51245e-01),
    vec2.Vec2(6.00e-01,  3.21762e-01),
    vec2.Vec2(6.50e-01,  2.89914e-01),
    vec2.Vec2(7.00e-01,  2.55706e-01),
    vec2.Vec2(7.50e-01,  2.19132e-01),
    vec2.Vec2(8.00e-01,  1.80175e-01),
    vec2.Vec2(8.50e-01,  1.38812e-01),
    vec2.Vec2(9.00e-01,  9.50136e-02),
    vec2.Vec2(9.50e-01,  4.87509e-02),
    vec2.Vec2(1.00e+00,  0.00000e+00),
    vec2.Vec2(1.05e+00, -5.12489e-02),
    vec2.Vec2(1.10e+00, -1.04980e-01),
    vec2.Vec2(1.15e+00, -1.61138e-01),
    vec2.Vec2(1.20e+00, -2.19615e-01),
    vec2.Vec2(1.25e+00, -2.80233e-01),
    vec2.Vec2(1.30e+00, -3.42736e-01),
    vec2.Vec2(1.35e+00, -4.06786e-01),
    vec2.Vec2(1.40e+00, -4.71972e-01),
    vec2.Vec2(1.45e+00, -5.37831e-01),
    vec2.Vec2(1.50e+00, -6.03885e-01),
    vec2.Vec2(1.55e+00, -6.69672e-01),
    vec2.Vec2(1.60e+00, -7.34783e-01),
    vec2.Vec2(1.65e+00, -7.98884e-01),
    vec2.Vec2(1.70e+00, -8.61729e-01),
    vec2.Vec2(1.75e+00, -9.23153e-01),
    vec2.Vec2(1.80e+00, -9.83069e-01),
    vec2.Vec2(1.85e+00, -1.04145e+00),
    vec2.Vec2(1.90e+00, -1.09830e+00),
    vec2.Vec2(1.95e+00, -1.15369e+00),
    vec2.Vec2(2.00e+00, -1.20768e+00),
    vec2.Vec2(2.05e+00, -1.26035e+00),
    vec2.Vec2(2.10e+00, -1.31180e+00),
    vec2.Vec2(2.15e+00, -1.36211e+00),
    vec2.Vec2(2.20e+00, -1.41139e+00),
    vec2.Vec2(2.25e+00, -1.45972e+00),
    vec2.Vec2(2.30e+00, -1.50718e+00),
    vec2.Vec2(2.35e+00, -1.55386e+00),
    vec2.Vec2(2.40e+00, -1.59984e+00),
    vec2.Vec2(2.45e+00, -1.64518e+00),
    vec2.Vec2(2.50e+00, -1.68996e+00),
    vec2.Vec2(2.55e+00, -1.73423e+00),
    vec2.Vec2(2.60e+00, -1.77807e+00),
    vec2.Vec2(2.65e+00, -1.82151e+00),
    vec2.Vec2(2.70e+00, -1.86463e+00),
    vec2.Vec2(2.75e+00, -1.90747e+00),
    vec2.Vec2(2.80e+00, -1.95007e+00),
    vec2.Vec2(2.85e+00, -1.99249e+00),
    vec2.Vec2(2.90e+00, -2.03476e+00),
    vec2.Vec2(2.95e+00, -2.07693e+00),
    vec2.Vec2(3.00e+00, -2.11903e+00),
    vec2.Vec2(3.05e+00, -2.16112e+00),
    vec2.Vec2(3.10e+00, -2.20322e+00),
    vec2.Vec2(3.15e+00, -2.24537e+00),
    vec2.Vec2(3.20e+00, -2.28761e+00),
    vec2.Vec2(3.25e+00, -2.32997e+00),
    vec2.Vec2(3.30e+00, -2.37249e+00),
    vec2.Vec2(3.35e+00, -2.41521e+00),
    vec2.Vec2(3.40e+00, -2.45814e+00),
    vec2.Vec2(3.45e+00, -2.50134e+00),
    vec2.Vec2(3.50e+00, -2.54483e+00),
    vec2.Vec2(3.55e+00, -2.58864e+00),
    vec2.Vec2(3.60e+00, -2.63281e+00),
    vec2.Vec2(3.65e+00, -2.67736e+00),
    vec2.Vec2(3.70e+00, -2.72233e+00),
    vec2.Vec2(3.75e+00, -2.76774e+00),
    vec2.Vec2(3.80e+00, -2.81363e+00),
    vec2.Vec2(3.85e+00, -2.86001e+00),
    vec2.Vec2(3.90e+00, -2.90693e+00),
    vec2.Vec2(3.95e+00, -2.95438e+00),
    vec2.Vec2(4.00e+00, -3.00240e+00)
};

/*  Add the coorindate axes with the figure.                                  */
axes.DrawAndLabelCoordinateAxesWithGridLines(
    x_start, x_end, y_start, y_end, x_string = x_string, y_string = y_string
);

/*  Draw the actual retarded time (pre-computed using Newton's method).       */
draw(vec2.PolygonThroughPoints(pts), default.blue_pen);

/*  Draw the initial guess as well.                                           */
draw(start.LineTo(end), default.thin_dash_pen);

/*  Label the two curves.                                                     */
tr_label.AddLabel("Retarded Time", default.blue_pen);
rho_label.AddLabel("Initial Guess");
