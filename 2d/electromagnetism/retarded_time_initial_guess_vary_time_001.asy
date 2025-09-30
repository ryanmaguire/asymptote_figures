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
real x_start = -0.4;
real x_end = 6.28;
real y_start = -1.4;
real y_end = 5.3;
string x_string = "t";
string y_string = "t_{r}";

/*  Start and end for the curve describing the initial guess for Newton's     *
 *  method. It is given by tr_0 = t - (1 / c) * rho, where c is the speed of  *
 *  light, and rho is the location on the x axis. We use c = 1 for this plot. */
vec2.Vec2 start = vec2.Vec2(0.0, -1.0);
vec2.Vec2 end = vec2.Vec2(2.0 * pi, 2.0 * pi - 1.0);

/*  Locations for the labels for the two curves.                              */
vec2.Vec2 tr_label = vec2.Vec2(2.7, 3.7);
vec2.Vec2 rho_label = vec2.Vec2(2.605, 3.5);

/*  Array with the pre-computed values for tr, the retarded time, as a        *
 *  function of rho.                                                          */
vec2.Vec2 pts[] = {
    vec2.Vec2(0.00e+00, -1.40449e+00),
    vec2.Vec2(1.00e-01, -1.28603e+00),
    vec2.Vec2(2.00e-01, -1.15542e+00),
    vec2.Vec2(3.00e-01, -1.01060e+00),
    vec2.Vec2(4.00e-01, -8.51273e-01),
    vec2.Vec2(5.00e-01, -6.82154e-01),
    vec2.Vec2(6.00e-01, -5.14538e-01),
    vec2.Vec2(7.00e-01, -3.60340e-01),
    vec2.Vec2(8.00e-01, -2.24475e-01),
    vec2.Vec2(9.00e-01, -1.05533e-01),
    vec2.Vec2(1.00e+00, +0.00000e+00),
    vec2.Vec2(1.10e+00, +9.54671e-02),
    vec2.Vec2(1.20e+00, +1.83490e-01),
    vec2.Vec2(1.30e+00, +2.66021e-01),
    vec2.Vec2(1.40e+00, +3.44508e-01),
    vec2.Vec2(1.50e+00, +4.20045e-01),
    vec2.Vec2(1.60e+00, +4.93480e-01),
    vec2.Vec2(1.70e+00, +5.65490e-01),
    vec2.Vec2(1.80e+00, +6.36634e-01),
    vec2.Vec2(1.90e+00, +7.07393e-01),
    vec2.Vec2(2.00e+00, +7.78198e-01),
    vec2.Vec2(2.10e+00, +8.49450e-01),
    vec2.Vec2(2.20e+00, +9.21538e-01),
    vec2.Vec2(2.30e+00, +9.94860e-01),
    vec2.Vec2(2.40e+00, +1.06983e+00),
    vec2.Vec2(2.50e+00, +1.14692e+00),
    vec2.Vec2(2.60e+00, +1.22663e+00),
    vec2.Vec2(2.70e+00, +1.30957e+00),
    vec2.Vec2(2.80e+00, +1.39646e+00),
    vec2.Vec2(2.90e+00, +1.48820e+00),
    vec2.Vec2(3.00e+00, +1.58587e+00),
    vec2.Vec2(3.10e+00, +1.69087e+00),
    vec2.Vec2(3.20e+00, +1.80495e+00),
    vec2.Vec2(3.30e+00, +1.93023e+00),
    vec2.Vec2(3.40e+00, +2.06895e+00),
    vec2.Vec2(3.50e+00, +2.22244e+00),
    vec2.Vec2(3.60e+00, +2.38851e+00),
    vec2.Vec2(3.70e+00, +2.55839e+00),
    vec2.Vec2(3.80e+00, +2.71925e+00),
    vec2.Vec2(3.90e+00, +2.86283e+00),
    vec2.Vec2(4.00e+00, +2.98843e+00),
    vec2.Vec2(4.10e+00, +3.09910e+00),
    vec2.Vec2(4.20e+00, +3.19839e+00),
    vec2.Vec2(4.30e+00, +3.28924e+00),
    vec2.Vec2(4.40e+00, +3.37385e+00),
    vec2.Vec2(4.50e+00, +3.45387e+00),
    vec2.Vec2(4.60e+00, +3.53052e+00),
    vec2.Vec2(4.70e+00, +3.60474e+00),
    vec2.Vec2(4.80e+00, +3.67727e+00),
    vec2.Vec2(4.90e+00, +3.74871e+00),
    vec2.Vec2(5.00e+00, +3.81957e+00),
    vec2.Vec2(5.10e+00, +3.89031e+00),
    vec2.Vec2(5.20e+00, +3.96133e+00),
    vec2.Vec2(5.30e+00, +4.03302e+00),
    vec2.Vec2(5.40e+00, +4.10578e+00),
    vec2.Vec2(5.50e+00, +4.18001e+00),
    vec2.Vec2(5.60e+00, +4.25616e+00),
    vec2.Vec2(5.70e+00, +4.33471e+00),
    vec2.Vec2(5.80e+00, +4.41623e+00),
    vec2.Vec2(5.90e+00, +4.50138e+00),
    vec2.Vec2(6.00e+00, +4.59098e+00),
    vec2.Vec2(6.10e+00, +4.68603e+00),
    vec2.Vec2(6.20e+00, +4.78779e+00),
    vec2.Vec2(6.28e+00, +4.87869e+00)
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
