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
 *      Draws a curling vector field (non-gradient) in the plane.             *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import box_coordinates as bc;

/*  Tools for drawing vector fields.                                          */
import vector_fields as vf;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The vector field to be drawn. It spins around the origin.                 */
vec2.Vec2 VectorField(vec2.Vec2 point)
{
    real factor = 0.125;
    real x = -factor * point.y;
    real y = factor * point.x;
    return vec2.Vec2(x, y);
}

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 2;

/*  Length of the grid lines.                                                 */
real grid_length = 2.1;

/*  Variables for sampling over the x and y coordinates for the vector field. */
real dx = 0.25;
real dy = 0.25;

/*  Add grid lines to the drawing.                                            */
grid.DrawSquareGridLines(grid_start, grid_end, grid_length);

/*  Add a box around the drawing, marking the two axes with tick marks.       */
bc.DrawSquareBoxCoordinates(grid_start, grid_end, grid_length);

/*  Draw the vector field inside the box.                                     */
vf.PlotVectorField(VectorField, grid_start, grid_end, grid_length, dx, dy);
