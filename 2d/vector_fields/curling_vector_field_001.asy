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

/*  Tools for drawing vector fields.                                          */
import vector_fields as vf;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The vector field to be drawn. It spins around the origin.                 */
vec2.Vec2 vector_field(vec2.Vec2 point)
{
    real factor = 0.125;
    real x = -factor * point.y;
    real y = factor * point.x;
    return vec2.Vec2(x, y);
}

/*  Length of the grid lines.                                                 */
real length = 2.2;

/*  Draw the vector field inside the box.                                     */
vf.VectorFieldSquareBoxPlotWithGridLines(vector_field, length);
