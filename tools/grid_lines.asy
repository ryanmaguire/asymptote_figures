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
 *      grid_start (int):                                                     *
 *          The left-most and bottom-most integer that receives a grid line.  *
 *      grid_end (int):                                                       *
 *          The right-most and top-most integer that receives a grid line.    *
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
void DrawGridLines(int grid_start,
                   int grid_end,
                   vec2.Vec2 line_start,
                   vec2.Vec2 line_end,
                   pen grid_pen = default_grid_pen,
                   int grid_skip = 1)
{
    /*  Variable for indexing over the grid lines.                            */
    int n;

    /*  Loop through and draw the lines for the grid.                         */
    for (n = grid_start; n <= grid_end; n += grid_skip)
    {
        /*  The grid consists of straight lines left-to-right and             *
         *  top-to-bottom. Compute the current set of lines to be drawn.      */
        vec2.Vec2 bottom = vec2.Vec2(n, line_start.y);
        vec2.Vec2 top = vec2.Vec2(n, line_end.y);
        vec2.Vec2 left = vec2.Vec2(line_start.x, n);
        vec2.Vec2 right = vec2.Vec2(line_end.x, n);

        /*  Draw the current set of grid lines.                               */
        draw(bottom.LineTo(top), grid_pen);
        draw(left.LineTo(right), grid_pen);
    }
    /*  End of for-loop drawing the guide-grid.                               */
}
/*  End of DrawGridLines.                                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareGridLines                                                   *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing. Useful for plotting real functions.     *
 *  Arguments:                                                                *
 *      grid_start (int):                                                     *
 *          The left-most and bottom-most integer that receives a grid line.  *
 *      grid_end (int):                                                       *
 *          The right-most and top-most integer that receives a grid line.    *
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
void DrawSquareGridLines(int grid_start,
                         int grid_end,
                         real grid_length,
                         pen grid_pen = default_grid_pen,
                         int grid_skip = 1)
{
    /*  Create the parameters for the line, equal length and centered at the  *
     *  origin.                                                               */
    vec2.Vec2 line_start = vec2.Vec2(-grid_length, -grid_length);
    vec2.Vec2 line_end = vec2.Vec2(grid_length, grid_length);

    /*  Use the main grid line function for drawing.                          */
    DrawGridLines(
        grid_start,
        grid_end,
        line_start,
        line_end,
        grid_pen = grid_pen,
        grid_skip = grid_skip
    );
}
/*  End of DrawSquareGridLines.                                               */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawGridLinesWithTickMarks                                            *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing with tick mark labels.                   *
 *  Arguments:                                                                *
 *      grid_start (int):                                                     *
 *          The left-most and bottom-most integer that receives a grid line.  *
 *      grid_end (int):                                                       *
 *          The right-most and top-most integer that receives a grid line.    *
 *      line_start (vec2.Vec2):                                               *
 *          The start of the lines in the grid. The left most value will be   *
 *          line_start.x and the bottom most value is line_start.y.           *
 *      line_end (vec2.Vec2):                                                 *
 *          The end of the lines in the grid. The right most value will be    *
 *          line_end.x and the top most value is line_end.y.                  *
 *  Keywords:                                                                 *
 *      tick_length (real):                                                   *
 *          The length of the tick marks. Default is 0.2.                     *
 *      grid_pen (pen):                                                       *
 *          The pen used to draw the grid lines.                              *
 *      tick_pen (pen):                                                       *
 *          The pen used to draw tick marks.                                  *
 *      label_ticks (bool):                                                   *
 *          Boolean for adding labels to tick marks. Default is true.         *
 *      grid_skip (int):                                                      *
 *          The number of integers skipped between grid lines. Default is 1.  *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawGridLinesWithTickMarks(int grid_start,
                                int grid_end,
                                vec2.Vec2 line_start,
                                vec2.Vec2 line_end,
                                real tick_length = 0.1,
                                pen grid_pen = default_grid_pen,
                                pen tick_pen = default_tick_pen,
                                bool label_ticks = true,
                                int grid_skip = 1)
{
    /*  Variable for indexing over the grid lines.                            */
    int n;

    /*  Loop through and draw the lines for the grid.                         */
    for (n = grid_start; n <= grid_end; n += grid_skip)
    {
        /*  The grid consists of straight lines left-to-right and             *
         *  top-to-bottom. Compute the current set of lines to be drawn.      */
        vec2.Vec2 bottom = vec2.Vec2(n, line_start.y);
        vec2.Vec2 top = vec2.Vec2(n, line_end.y);
        vec2.Vec2 left = vec2.Vec2(line_start.x, n);
        vec2.Vec2 right = vec2.Vec2(line_end.x, n);

        /*  Draw the current set of grid lines.                               */
        draw(bottom.LineTo(top), grid_pen);
        draw(left.LineTo(right), grid_pen);

        /*  If n is zero, do not draw tick marks. The labels overlap with the *
         *  axes lines and it isn't pretty.                                   */
        if (n == 0)
            continue;

        /*  Otherwise, draw in tick marks and labels.                         */
        else
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 left = vec2.Vec2(-tick_length, n);
            vec2.Vec2 right = vec2.Vec2(tick_length, n);
            vec2.Vec2 top = vec2.Vec2(n, tick_length);
            vec2.Vec2 bottom = vec2.Vec2(n, -tick_length);

            /*  Tick labels are optional. Check if the user requested them.   */
            if (label_ticks)
            {
                /*  A label for the tick mark.                                */
                Label tick_label = Label("$"+string(n)+"$", position=1.0);

                /*  Draw and label the tick marks.                            */
                draw(tick_label, top.LineTo(bottom), tick_pen);
                draw(tick_label, right.LineTo(left), tick_pen);
            }

            /*  Otherwise draw the tick marks without labels.                 */
            else
            {
                draw(top.LineTo(bottom), tick_pen);
                draw(right.LineTo(left), tick_pen);
            }
        }
    }
    /*  End of for-loop drawing the guide-grid.                               */
}
/*  End of DrawGridLinesWithTickMarks.                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareGridLinesWithTickMarks                                      *
 *  Purpose:                                                                  *
 *      Adds grid lines to a drawing with tick mark labels.                   *
 *  Arguments:                                                                *
 *      grid_start (int):                                                     *
 *          The left-most and bottom-most integer that receives a grid line.  *
 *      grid_end (int):                                                       *
 *          The right-most and top-most integer that receives a grid line.    *
 *      grid_length (real):                                                   *
 *          The length of the grid lines.                                     *
 *  Keywords:                                                                 *
 *      tick_length (real):                                                   *
 *          The length of the tick marks. Default is 0.2.                     *
 *      grid_pen (pen):                                                       *
 *          The pen used to draw the grid lines.                              *
 *      tick_pen (pen):                                                       *
 *          The pen used to draw tick marks.                                  *
 *      label_ticks (bool):                                                   *
 *          Boolean for adding labels to tick marks. Default is true.         *
 *      grid_skip (int):                                                      *
 *          The number of integers skipped between grid lines. Default is 1.  *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawSquareGridLinesWithTickMarks(int grid_start,
                                      int grid_end,
                                      real grid_length,
                                      real tick_length = 0.1,
                                      pen grid_pen = default_grid_pen,
                                      pen tick_pen = default_tick_pen,
                                      bool label_ticks = true,
                                      int grid_skip = 1)
{
    /*  Create the parameters for the grid lines.                             */
    vec2.Vec2 line_start = vec2.Vec2(-grid_length, -grid_length);
    vec2.Vec2 line_end = vec2.Vec2(grid_length, grid_length);

    /*  Use the main drawing function with tick marks.                        */
    DrawGridLinesWithTickMarks(
        grid_start,
        grid_end,
        line_start,
        line_end,
        tick_length = tick_length,
        grid_pen = grid_pen,
        tick_pen = tick_pen,
        label_ticks = label_ticks,
        grid_skip = grid_skip
    );
}
/*  End of DrawSquareGridLinesWithTickMarks.                                  */
