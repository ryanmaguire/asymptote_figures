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
 *      Plots the "cusp" curve y^3 = x^2.                                     *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for creating paths from real-valued functions.                  */
import path_functions as pf;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  The parabola function to be drawn.                                        */
real cusp_func(real x)
{
    return cbrt(x*x);
}

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -3;
int grid_end = 3;

/*  Length of the grid lines.                                                 */
real grid_length = 3.2;

/*  Number of samples for the square root and parabola functions.             */
int samples = 10;

/*  The PathFromFunction function uses cubic splining. The function is not    *
 *  differentiable at the origin, causing a bizarre picture. Split the path   *
 *  into left and right portions, where the derivative is defined, so that    *
 *  the cubic splining technique renders an accurate image.                   */
path gLeft = pf.PathFromFunction(cusp_func, -3.0, 0.0, samples);
path gRight = reflect((0.0, 0.0), (0.0, 1.0))*gLeft;

/*  Add grid lines to the drawing.                                            */
grid.DrawGridLinesWithTickMarks(grid_start, grid_end, grid_length);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxes(grid_length);

/*  Draw the curve in the plane.                                              */
draw(gLeft);
draw(gRight);

/*  And lastly add a label.                                                   */
label("$y^{3}=x^{2}$", (1.5, 1.7));
