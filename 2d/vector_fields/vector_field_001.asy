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
 *      Draws a radial vector field from the point (0, 1) in the plane.       *
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

/*  The vector field to be drawn. It is radially outwards from (0, 1).        */
vec2.Vec2 VectorField(vec2.Vec2 point)
{
    real factor = 0.25;
    real xpt = factor * point.x;
    real ypt = factor * (point.y - 1.0);
    return vec2.Vec2(xpt, ypt);
}

/*  The point under consideration.                                            */
vec2.Vec2 point = vec2.Vec2(4.7, 0.0);
vec2.Vec2 point_label = vec2.Vec2(3.3, 2.5);

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 2;

/*  Length of the grid lines.                                                 */
real grid_length = 2.4;

/*  Radius for the dots used to label points.                                 */
real dot_radius = 0.15;

/*  Variables for sampling over the x and y coordinates for the vector field. */
real dx = 0.25;
real dy = 0.25;

/*  Add grid lines to the drawing.                                            */
grid.DrawSquareGridLines(grid_start, grid_end, grid_length);

/*  Add a box around the drawing, marking the two axes with tick marks.       */
bc.DrawSquareBoxCoordinates(grid_start, grid_end, grid_length);

/*  Draw the vector field inside the box.                                     */
vf.PlotVectorField(VectorField, grid_start, grid_end, grid_length, dx, dy);

/*  Draw a circle around the origin. This is the constraint in the problem.   */
vec2.Origin.DrawCircle(2.0);
