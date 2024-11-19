/******************************************************************************
 *                                  LICENSE                                   *
 ******************************************************************************
 *  This file is part of Mathematics-and-Physics.                             *
 *                                                                            *
 *  Mathematics-and-Physics is free software: you can redistribute it and/or  *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  Mathematics-and-Physics is distributed in the hope that it will be useful *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with Mathematics-and-Physics.  If not, see                          *
 *  <https://www.gnu.org/licenses/>.                                          *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Functions for drawing grid lines.                                     *
 ******************************************************************************/

/*  Points and directions in the plane.                                       */
import vec2;

/*  Default pens used in grid functions.                                      */
pen default_grid_pen = gray(0.8) + linewidth(0.3pt);
pen default_tick_pen = black + linewidth(0.2pt) + fontsize(12pt);

/******************************************************************************
 *  Function:                                                                 *
 *      DrawGridLines                                                         *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing. Useful for plotting real functions.     *
 *  Arguments:                                                                *
 *      line_start (vec2.Vec2):                                               *
 *          The start of the lines in the grid. The left most value will be   *
 *          line_start.x and the bottom most value is line_start.y.           *
 *      line_end (vec2.Vec2):                                                 *
 *          The end of the lines in the grid. The right most value will be    *
 *          line_end.x and the top most value is line_end.y.                  *
 *  Keywords:                                                                 *
 *      grid_pen (pen):                                                       *
 *          The pen used to draw the grid lines.                              *
 *      grid_skip (int):                                                      *
 *          The number of integers skipped between grid lines. Default is 1.  *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawGridLines(vec2.Vec2 line_start,
                   vec2.Vec2 line_end,
                   pen grid_pen = default_grid_pen,
                   int grid_skip = 1)
{
    /*  Variable for indexing over the grid lines.                            */
    int n;

    /*  Integers for the extreme indices of the grid lines.                   */
    int bottom_ind, top_ind, left_ind, right_ind;

    /*  Check for legal inputs.                                               */
    assert(line_start.x < line_end.x);
    assert(line_start.y < line_end.y);
    assert(grid_skip > 0);

    /*  Compute the ending indices for all of the grid lines.                 */
    left_ind = (int)(line_start.x);
    right_ind = (int)(line_end.x);
    bottom_ind = (int)(line_start.y);
    top_ind = (int)(line_end.y);

    /*  Loop through and draw the lines for the grid. Vertical lines first.   */
    for (n = left_ind; n <= right_ind; n += grid_skip)
    {
        /*  Compute the points specifying the ends of the vertical lines.     */
        vec2.Vec2 bottom = vec2.Vec2(n, line_start.y);
        vec2.Vec2 top = vec2.Vec2(n, line_end.y);

        /*  Draw the current set of grid lines.                               */
        draw(bottom.LineTo(top), grid_pen);
    }
    /*  End of for-loop drawing the vertical grid lines.                      */

    /*  Loop through and draw the lines for the grid. Horizontal lines next.  */
    for (n = bottom_ind; n <= top_ind; n += grid_skip)
    {
        /*  Compute the points specifying the ends of the horizontal lines.   */
        vec2.Vec2 left = vec2.Vec2(line_start.x, n);
        vec2.Vec2 right = vec2.Vec2(line_end.x, n);

        /*  Draw the current set of grid lines.                               */
        draw(left.LineTo(right), grid_pen);
    }
    /*  End of for-loop drawing the horizontal grid lines.                    */
}
/*  End of DrawGridLines.                                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularGridLines                                              *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing. Useful for plotting real functions.     *
 *  Arguments:                                                                *
 *      line_start (vec2.Vec2):                                               *
 *          The start of the lines in the grid. The left most value will be   *
 *          line_start.x and the bottom most value is line_start.y.           *
 *      line_end (vec2.Vec2):                                                 *
 *          The end of the lines in the grid. The right most value will be    *
 *          line_end.x and the top most value is line_end.y.                  *
 *  Keywords:                                                                 *
 *      grid_pen (pen):                                                       *
 *          The pen used to draw the grid lines.                              *
 *      grid_skip (int):                                                      *
 *          The number of integers skipped between grid lines. Default is 1.  *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawRectangularGridLines(real x_length,
                              real y_length,
                              pen grid_pen = default_grid_pen,
                              int grid_skip = 1)
{
    /*  Variables for the main DrawGridLines functions.                       */
    vec2.Vec2 line_start, line_end;

    /*  Check for legal values.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(grid_skip > 0.0);

    /*  Create the parameters. The lines are centered about the origin.       */
    line_start = vec2.Vec2(-x_length, -y_length);
    line_end = vec2.Vec2(x_length, y_length);

    /*  Call the main plotting function.                                      */
    DrawGridLines(
        line_start, line_end, grid_pen = grid_pen, grid_skip = grid_skip
    );
}
/*  End of DrawRectangularGridLines.                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareGridLines                                                   *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing. Useful for plotting real functions.     *
 *  Arguments:                                                                *
 *      grid_length (real):                                                   *
 *          The length of the grid lines.                                     *
 *      grid_pen (pen):                                                       *
 *          The pen used to draw the grid lines.                              *
 *  Keywords:                                                                 *
 *      grid_skip (int):                                                      *
 *          The number of integers skipped between grid lines. Default is 1.  *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawSquareGridLines(real grid_length,
                         pen grid_pen = default_grid_pen,
                         int grid_skip = 1)
{
    /*  Check that the inputs are valid.                                      */
    assert(grid_length > 0.0);
    assert(grid_skip > 0);

    /*  Use the main grid line function for drawing.                          */
    DrawRectangularGridLines(
        grid_length, grid_length, grid_pen = grid_pen, grid_skip = grid_skip
    );
}
/*  End of DrawSquareGridLines.                                               */
