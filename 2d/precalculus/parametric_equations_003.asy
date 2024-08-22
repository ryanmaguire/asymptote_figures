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
 *      Plots the parametric curve (cos^3(t), sin^3(t)).                      *
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

/*  The parametric curve to be drawn.                                         */
vec2.Vec2 curve(real t)
{
    real cos_t = cos(t);
    real sin_t = sin(t);
    real x = cos_t * cos_t * cos_t;
    real y = sin_t * sin_t * sin_t;
    return (x, y);
}

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -1;
int grid_end = 2;
vec2.Vec2 start = vec2.Vec2(-1.2, -1.2);
vec2.Vec2 end = vec2.Vec2(2.2, 2.2);

/*  Number of samples used in drawing the parabola.                           */
int samples = 20;

/*  Create a path from the function.                                          */
path plot = pc.PathFromParametricFunction(curve, 0.0, 0.5*pi, samples);

/*  Create the plot with tick-marks, axes, and directed arrows.               */
grid.DrawGridLinesWithTickMarks(grid_start, grid_end, start, end);
axes.DrawAndLabelCoordinateAxes(start, end);
draw(plot);

/*  Add a label for the curve above the graph.                                */
label("$\gamma(t)=\left(\cos^{3}(t),\,\sin^{3}(t)\right)$", (1.2, 1.3));
