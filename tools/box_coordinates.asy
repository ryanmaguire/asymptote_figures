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
 *      Provides tools for making box plots.                                  *
 ******************************************************************************/

/*  Points and directions in the plane.                                       */
import vec2;

/*  Draw grid lines (or guide lines) in the plane.                            */
import grid_lines as grid;

/*  Default axis pen. Adequate for most drawings.                             */
pen default_axis_pen = black + linewidth(1.0pt) + fontsize(12pt);

/*  Default tick pen used to label and draw tick marks on the axes.           */
pen default_tick_pen = black + linewidth(0.4pt) + fontsize(12pt);

/******************************************************************************
 *  Function:                                                                 *
 *      DrawBoxCoordinates                                                    *
 *  Purpose:                                                                  *
 *      Makes a box plot, without grid lines.                                 *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The point on the x-axis of the left-most vertical line.           *
 *      x_end (real):                                                         *
 *          The point on the x-axis of the right-most vertical line.          *
 *      y_start (real):                                                       *
 *          The point on the y-axis of the bottom-most horizontal line.       *
 *      y_end (real):                                                         *
 *          The point on the y-axis of the top-most horizontal line.          *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawBoxCoordinates(real x_start,
                   real x_end,
                   real y_start,
                   real y_end,
                   pen axis_pen = default_axis_pen,
                   pen tick_pen = default_tick_pen,
                   int grid_skip = 1,
                   real tick_length = 0.1)
{
    /*  Variable for index, and variables for casting reals to ints.          */
    int n, x_first, x_last, y_first, y_last;

    /*  Ensure we were given legal inputs.                                    */
    assert(x_start < x_end);
    assert(y_start < y_end);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Cast to integers. We are assuming the rounding mode is truncation,    *
     *  which is also called round-to-zero. To avoid tick marks and labels    *
     *  going outside the bounds of the plot, treat the cases where x_start   *
     *  is positive and x_start is negative carefully. Similarly for the      *
     *  three variables. If x_start is negative, truncation is fine. If       *
     *  x_start is positive, truncating will create a value less than it. We  *
     *  need to increment this value so that x_first >= x_start. We do the    *
     *  same check with x_last, y_first, and y_last. For x_first and y_first  *
     *  this can be achieved with the ceiling function. Similarly, for x_last *
     *  and y_last, we can use the floor function.                            */
    x_first = (int)(ceil(x_start));
    x_last = (int)(floor(x_end));
    y_first = (int)(ceil(y_start));
    y_last = (int)(floor(y_end));

    /*  Create the points for the four vertices of the box plot.              */
    vec2.Vec2 bottom_left = vec2.Vec2(x_start, y_start);
    vec2.Vec2 top_left = vec2.Vec2(x_start, y_end);
    vec2.Vec2 top_right = vec2.Vec2(x_end, y_end);
    vec2.Vec2 bottom_right = vec2.Vec2(x_end, y_start);

    /*  Draw the box. Note, it need not be square or centered at the origin.  */
    draw(bottom_left.LineTo(bottom_right), axis_pen);
    draw(bottom_right.LineTo(top_right), axis_pen);
    draw(top_right.LineTo(top_left), axis_pen);
    draw(top_left.LineTo(bottom_left), axis_pen);

    /*  Loop through the x-coordinates and draw vertical tick marks.          */
    for (n = x_first; n <= x_last; n += grid_skip)
    {
        /*  Compute the endpoints for the tick-marks.                         */
        vec2.Vec2 upper_tick_top = vec2.Vec2(n, y_end + tick_length);
        vec2.Vec2 upper_tick_bottom = vec2.Vec2(n, y_end - tick_length);
        vec2.Vec2 lower_tick_top = vec2.Vec2(n, y_start + tick_length);
        vec2.Vec2 lower_tick_bottom = vec2.Vec2(n, y_start - tick_length);

        /*  Draw the tick marks and add labels.                               */
        Label L = Label("$" + string(n) + "$", position = 1.0);
        draw(L, upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
        draw(L, lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
    }
    /*  End of for-loop drawing the vertical tick-marks.                      */

    /*  Loop through the y-coordinates and draw horizontal tick marks.        */
    for (n = y_first; n <= y_last; n += grid_skip)
    {
        /*  Compute the endpoints for the tick-marks.                         */
        vec2.Vec2 right_tick_right = vec2.Vec2(x_end + tick_length, n);
        vec2.Vec2 right_tick_left = vec2.Vec2(x_end - tick_length, n);
        vec2.Vec2 left_tick_right = vec2.Vec2(x_start + tick_length, n);
        vec2.Vec2 left_tick_left = vec2.Vec2(x_start - tick_length, n);

        /*  Draw the tick marks and add labels.                               */
        Label L = Label("$" + string(n) + "$", position = 1.0);
        draw(L, left_tick_right.LineTo(left_tick_left), tick_pen);
        draw(L, right_tick_left.LineTo(right_tick_right), tick_pen);
    }
    /*  End of for-loop drawing the horizontal tick-marks.                    */
}
/*  End of DrawBoxCoordinates.                                                */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularBoxCoordinates                                         *
 *  Purpose:                                                                  *
 *      Makes a box plot, without grid lines, centered about the origin.      *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          The distance from the origin to the right-most point of the box.  *
 *      y_length (real):                                                      *
 *          The distance from the origin to the top-most point of the box.    *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawRectangularBoxCoordinates(real x_length,
                              real y_length,
                              pen axis_pen = default_axis_pen,
                              pen tick_pen = default_tick_pen,
                              int grid_skip = 1,
                              real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Pass the parameters to the main drawing function. To make it centered *
     *  about the origin, use x_start = -x_length and x_end = x_length. Do    *
     *  the same thing for the y-axis.                                        */
    DrawBoxCoordinates(
        -x_length,                  /*  Left-most border for the box plot.    */
        x_length,                   /*  Right-most border for the box plot.   */
        -y_length,                  /*  Bottom-most border for the box plot.  */
        y_length,                   /*  Top-most border for the box plot.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the ticks drawn in the plot.*/
    );
}
/*  End of DrawRectangularBoxCoordinates.                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareBoxCoordinates                                              *
 *  Purpose:                                                                  *
 *      Makes a square box plot without grid lines centered about the origin. *
 *  Arguments:                                                                *
 *      length (real):                                                        *
 *          Half the width of the square box.                                 *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawSquareBoxCoordinates(real length,
                         pen axis_pen = default_axis_pen,
                         pen tick_pen = default_tick_pen,
                         int grid_skip = 1,
                         real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  A square box is just a rectangular box with width equal to height.    *
     *  Use the rectangular drawing function with x_length = y_length.        */
    DrawRectangularBoxCoordinates(
        length,                     /*  Length in the x direction.            */
        length,                     /*  Length in the y direction.            */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the smaller tick marks.     */
    );
}
/*  End of DrawSquareBoxCoordinates.                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawBoxCoordinatesWithGridLines                                       *
 *  Purpose:                                                                  *
 *      Makes a box plot with grid lines.                                     *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The point on the x-axis of the left-most vertical line.           *
 *      x_end (real):                                                         *
 *          The point on the x-axis of the right-most vertical line.          *
 *      y_start (real):                                                       *
 *          The point on the y-axis of the bottom-most horizontal line.       *
 *      y_end (real):                                                         *
 *          The point on the y-axis of the top-most horizontal line.          *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawBoxCoordinatesWithGridLines(real x_start,
                                real x_end,
                                real y_start,
                                real y_end,
                                pen axis_pen = default_axis_pen,
                                pen tick_pen = default_tick_pen,
                                pen grid_pen = grid.default_grid_pen,
                                int grid_skip = 1,
                                real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_start < x_end);
    assert(y_start < y_end);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Add grid lines to the drawing.                                        */
    grid.DrawGridLines(
        x_start,                    /*  Left-most border for the box plot.    */
        x_end,                      /*  Right-most border for the box plot.   */
        y_start,                    /*  Bottom-most border for the box plot.  */
        y_end,                      /*  Top-most border for the box plot.     */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        grid_skip = grid_skip       /*  Number of tick marks skipped.         */
    );

    /*  Add a box, marking the two axes with tick marks.                      */
    DrawBoxCoordinates(
        x_start,                    /*  Left-most border for the box plot.    */
        x_end,                      /*  Right-most border for the box plot.   */
        y_start,                    /*  Bottom-most border for the box plot.  */
        y_end,                      /*  Top-most border for the box plot.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the ticks drawn in the plot.*/
    );
}
/*  End of DrawBoxCoordinatesWithGridLines.                                   */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularBoxCoordinatesWithGridLines                            *
 *  Purpose:                                                                  *
 *      Makes a box plot with grid lines centered about the origin.           *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the plot.                                       *
 *      x_length (real):                                                      *
 *          Half the height of the plot.                                      *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawRectangularBoxCoordinatesWithGridLines(real x_length,
                                           real y_length,
                                           pen axis_pen = default_axis_pen,
                                           pen tick_pen = default_tick_pen,
                                           pen grid_pen = grid.default_grid_pen,
                                           int grid_skip = 1,
                                           real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Pass the parameters to the main drawing function. To make it centered *
     *  about the origin, use x_start = -x_length and x_end = x_length. Do    *
     *  the same thing for the y-axis.                                        */
    DrawBoxCoordinatesWithGridLines(
        -x_length,                  /*  Left-most border for the box plot.    */
        x_length,                   /*  Right-most border for the box plot.   */
        -y_length,                  /*  Bottom-most border for the box plot.  */
        y_length,                   /*  Top-most border for the box plot.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the ticks drawn in the plot.*/
    );
}
/*  End of DrawRectangularBoxCoordinatesWithGridLines.                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareBoxCoordinatesWithGridLines                                 *
 *  Purpose:                                                                  *
 *      Makes a square box plot with grid lines centered about the origin.    *
 *  Arguments:                                                                *
 *      length (real):                                                        *
 *          Half the width of the plot.                                       *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Output:                                                                   *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawSquareBoxCoordinatesWithGridLines(real length,
                                      pen axis_pen = default_axis_pen,
                                      pen tick_pen = default_tick_pen,
                                      pen grid_pen = grid.default_grid_pen,
                                      int grid_skip = 1,
                                      real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Ensure all of the inputs are legal for the plot                       */
    assert(length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  A square box is just a rectangular box with width equal to height.    *
     *  Use the rectangular drawing function with x_length = y_length.        */
    DrawRectangularBoxCoordinatesWithGridLines(
        length,                     /*  Length in the x direction.            */
        length,                     /*  Length in the y direction.            */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the smaller tick marks.     */
    );
}
/*  End of DrawSquareBoxCoordinatesWithGridLines.                             */
