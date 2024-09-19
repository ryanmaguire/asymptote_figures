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
 *      Plots the parametric curve (1+3t^2, 2+2t^3).                          *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for creating paths from vector-valued functions.                */
import parametric_curves as pc;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The point under consideration.                                            */

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -50;
int grid_end = 50;

/*  Length of the grid lines.                                                 */
real grid_length = 55.0;

/*  Radius for the dots used to label points.                                 */
real dot_radius = 1.0;

int n_x, n_y;
int start = -30;
int end = 30;
int step = 6;

/*  Add grid lines to the drawing.                                            */
grid.DrawSquareGridLinesWithTickMarks(
    grid_start, grid_end, grid_length, grid_skip = 10
);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelSquareCoordinateAxes(grid_length);

vec2.Vec2 linear_transform(vec2.Vec2 P)
{
    real a = 12.0;
    real b = -3.0;
    real c = -2.0;
    real d = 13.0;

    real x = a*P.x + b*P.y;
    real y = c*P.x + d*P.y;
    return vec2.Vec2(x, y);
}

for (n_x = start; n_x <= end; n_x += step)
{
    for (n_y = start; n_y <= end; n_y += step)
    {
        real x_real = (real)(n_x);
        real y_real = (real)(n_y);
        vec2.Vec2 P = vec2.Vec2(x_real, y_real);
        vec2.Vec2 TP = linear_transform(P);
        vec2.Vec2 Q = P + 0.05*(TP - P);
        draw(P.LineTo(Q), default.blue_pen, default.sharp_arrow);
    }
}

vec2.Vec2 eigen = vec2.Vec2(6, 4);

draw(vec2.Origin.LineTo(eigen), default.red_thick_pen, default.sharp_arrow);