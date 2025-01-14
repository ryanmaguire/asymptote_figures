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
 *      x_skip (int):                                                         *
 *          The number of integers skipped between major tick marks.          *
 *      x_subdivisions (int):                                                 *
 *          The number of intervals that are marked by semi-major tick marks. *
 *          There will be x_subdivisions - 1 semi-major tick marks drawn      *
 *          in the x axis between each major tick mark.                       *
 *      x_minor_subdivisions (int):                                           *
 *          The number of subdivisions between semi-major tick marks. There   *
 *          will be x_minor_subdivisions - 1 minor tick marks drawn in the x  *
 *          axis between each consecutive pair of semi-major tick marks.      *
 *      y_skip (int):                                                         *
 *          The number of integers skipped between major tick marks.          *
 *      y_subdivisions (int):                                                 *
 *          The number of intervals that are marked by semi-major tick marks. *
 *          There will be y_subdivisions - 1 semi-major tick marks drawn      *
 *          in the y axis between each major tick mark.                       *
 *      y_minor_subdivisions (int):                                           *
 *          The number of subdivisions between semi-major tick marks. There   *
 *          will be y_minor_subdivisions - 1 minor tick marks drawn in the y  *
 *          axis between each consecutive pair of semi-major tick marks.      *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *      semi_major_tick_length (real):                                        *
 *          The length of the semi-major ticks, if present at all.            *
 *      minor_tick_length (real):                                             *
 *          The length of the minor tick marks, if present at all.            *
 *      draw_labels (bool):                                                   *
 *          Boolean for determining if tick marks recieve labels.             *
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
                   int x_skip = 1,
                   int x_subdivisions = 1,
                   int x_minor_subdivisions = 1,
                   int y_skip = 1,
                   int y_subdivisions = 1,
                   int y_minor_subdivisions = 1,
                   real tick_length = 0.1,
                   real semi_major_tick_length = 0.05,
                   real minor_tick_length = 0.025,
                   bool draw_labels = true)
{
    /*  Variable for indexing, and variables for casting reals to ints.       */
    int n, ns, nm, x_first, x_last, y_first, y_last;

    /*  Distance between two consecutive semi-major tick marks.               */
    real x_semi_major_displacement, x_minor_displacement;

    /*  Distance between two consecutive minor tick marks.                    */
    real y_semi_major_displacement, y_minor_displacement;

    /*  Points for the four corners of the box.                               */
    vec2.Vec2 bottom_left, bottom_right, top_left, top_right;

    /*  Points marking the endpoints of the tickmarks drawn in the x axis.    */
    vec2.Vec2 upper_tick_top, upper_tick_bottom;
    vec2.Vec2 lower_tick_top, lower_tick_bottom;

    /*  Points marking the endpoints of the tickmarks drawn in the y axis.    */
    vec2.Vec2 left_tick_left, left_tick_right;
    vec2.Vec2 right_tick_left, right_tick_right;

    /*  The centers in the x axis for the semi-major and minor tick marks.    */
    real xs, xm;

    /*  The centers in the y axis for the semi-major and minor tick marks.    */
    real ys, ym;

    /*  Label for major tick marks, if requested.                             */
    Label tlabel;

    /*  Ensure we were given legal inputs.                                    */
    assert(x_start < x_end);
    assert(y_start < y_end);
    assert(x_minor_subdivisions > 0);
    assert(x_subdivisions > 0);
    assert(x_skip > 0);
    assert(y_minor_subdivisions > 0);
    assert(y_subdivisions > 0);
    assert(y_skip > 0);
    assert(tick_length > 0.0);
    assert(semi_major_tick_length > 0.0);
    assert(minor_tick_length > 0.0);

    /*  The displacement between semi-major and minor tick marks.             */
    x_semi_major_displacement = (real)(x_skip) / (real)(x_subdivisions);
    x_minor_displacement = x_semi_major_displacement / x_minor_subdivisions;
    y_semi_major_displacement = (real)(y_skip) / (real)(y_subdivisions);
    y_minor_displacement = y_semi_major_displacement / y_minor_subdivisions;

    /*  No tick marks should go beyond the bounds provided by the user. The   *
     *  major tick marks are drawn at integer points. To ensure the smallest  *
     *  x value is greater than the bounds provided, compute the ceiling of   *
     *  the lower bound and use this (casting to int).                        *
     *                                                                        *
     *  Note, we allow semi-major and minor tick marks to go to the left of   *
     *  the first major tick mark if the center of the semi-major or minor    *
     *  tick marks are greater than x_start. The first indexing value is      *
     *  hence ceil(x_start) - x_skip. No major tick mark will be drawn at     *
     *  with center ceil(x_start) - x_skip, however, and no semi-major or     *
     *  minor tick marks will be drawn to the left of x_start.                */
    x_first = (int)(ceil(x_start)) - x_skip;

    /*  Similarly for the right end point, to avoid going beyond the bounds   *
     *  provided, compute the floor of the user allowed input. Since we are   *
     *  drawing left-to-right in the for-loop below, we can draw semi-major   *
     *  and minor tick marks between the last major tick mark and the right   *
     *  most end point simply by considering the index n = x_last. That is,   *
     *  we do not need to mimic the previous trick where we computed          *
     *  ceil(x_start) - x_skip, and can just compute floor(x_end) without     *
     *  incrementing this result by x_skip.                                   */
    x_last = (int)(floor(x_end));

    /*  The above arguments apply to the y axis as well.                      */
    y_first = (int)(ceil(y_start)) - y_skip;
    y_last = (int)(floor(y_end));

    /*  Create the points for the four vertices of the box plot.              */
    bottom_left = vec2.Vec2(x_start, y_start);
    top_left = vec2.Vec2(x_start, y_end);
    top_right = vec2.Vec2(x_end, y_end);
    bottom_right = vec2.Vec2(x_end, y_start);

    /*  Draw the box. Note, it need not be square or centered at the origin.  */
    draw(bottom_left.LineTo(bottom_right), axis_pen);
    draw(bottom_right.LineTo(top_right), axis_pen);
    draw(top_right.LineTo(top_left), axis_pen);
    draw(top_left.LineTo(bottom_left), axis_pen);

    /*  Loop through the x-coordinates and draw vertical tick marks.          */
    for (n = x_first; n <= x_last; n += x_skip)
    {
        /*  Draw the semi-major tick marks.                                   */
        for (ns = 1; ns <= x_subdivisions; ++ns)
        {
            /*  The current center of the semi-major tick mark in the x axis. */
            xs = n + ns * x_semi_major_displacement;

            /*  Draw the minor ticks between the semi-major tick marks.       */
            for (nm = 1; nm < x_minor_subdivisions; ++nm)
            {
                /*  The center of the minor tick mark being drawn.            */
                xm = xs + nm * x_minor_displacement - x_semi_major_displacement;

                /*  If we are to the left of the left-most endpoint, do not   *
                 *  draw anything. Simply skip this point.                    */
                if (xm <= x_start)
                    continue;

                /*  We are drawing left-to-right, so if we are to the right   *
                 *  of the right-most endpoint, we are done drawing. Break.   */
                if (xm >= x_end)
                    break;

                /*  Compute the endpoints for the tick marks.                 */
                upper_tick_top = vec2.Vec2(xm, y_end + minor_tick_length);
                upper_tick_bottom = vec2.Vec2(xm, y_end - minor_tick_length);
                lower_tick_top = vec2.Vec2(xm, y_start + minor_tick_length);
                lower_tick_bottom = vec2.Vec2(xm, y_start - minor_tick_length);

                /*  Draw the given minor tick mark.                           */
                draw(upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
                draw(lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
            }
            /*  End of for-loop drawing minor tick marks in the x-axis.       */

            /*  Same check as before, if the semi-major tick mark has an x    *
             *  value less than the left-most endpoint, skip it.              */
            if (xs <= x_start)
                continue;

            /*  If we are past the bounds on the right, end the for-loop.     */
            if (xs >= x_end)
                break;

            /*  The last semi-major tick mark does not need to be drawn since *
             *  the subsequent major tick mark will cover this point.         */
            if (ns == x_subdivisions)
                break;

            /*  Compute the endpoints for the semi-major tick marks.          */
            upper_tick_top = vec2.Vec2(xs, y_end + semi_major_tick_length);
            upper_tick_bottom = vec2.Vec2(xs, y_end - semi_major_tick_length);
            lower_tick_top = vec2.Vec2(xs, y_start + semi_major_tick_length);
            lower_tick_bottom = vec2.Vec2(xs, y_start - semi_major_tick_length);

            /*  Draw the semi-major tick mark.                                */
            draw(upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
            draw(lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
        }
        /*  End of for-loop drawing semi-major tick marks in the x-axis.      */

        /*  We decremented x_first backwards in order to draw semi-major and  *
         *  minor tick marks between the bounds of the box and the first      *
         *  major tick mark. If n = x_first, do not draw a major tick mark.   *
         *  This would lie outside of the box plot.                           */
        if (n == x_first)
            continue;

        /*  Compute the endpoints for the tick-marks.                         */
        upper_tick_top = vec2.Vec2(n, y_end + tick_length);
        upper_tick_bottom = vec2.Vec2(n, y_end - tick_length);
        lower_tick_top = vec2.Vec2(n, y_start + tick_length);
        lower_tick_bottom = vec2.Vec2(n, y_start - tick_length);

        /*  Draw the tick marks and add labels.                               */
        if (draw_labels)
        {
            tlabel = Label("$" + string(n) + "$", position = 1.0);
            draw(tlabel, upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
            draw(tlabel, lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
        }

        /*  Otherwise, draw the major tick mark without labels.               */
        else
        {
            draw(upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
            draw(lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
        }
    }
    /*  End of for-loop drawing tick-marks along the x-axis.                  */

    /*  Loop through the y-coordinates and draw horizontal tick marks.        */
    for (n = y_first; n <= y_last; n += y_skip)
    {
        /*  Compute the endpoints for the tick-marks.                         */
        right_tick_right = vec2.Vec2(x_end + tick_length, n);
        right_tick_left = vec2.Vec2(x_end - tick_length, n);
        left_tick_right = vec2.Vec2(x_start + tick_length, n);
        left_tick_left = vec2.Vec2(x_start - tick_length, n);

        /*  Draw the tick marks and add labels.                               */
        if (draw_labels)
        {
            tlabel = Label("$" + string(n) + "$", position = 1.0);
            draw(tlabel, left_tick_right.LineTo(left_tick_left), tick_pen);
            draw(tlabel, right_tick_left.LineTo(right_tick_right), tick_pen);
        }

        /*  Otherwise, draw the major tick mark without labels.               */
        else
        {
            draw(left_tick_right.LineTo(left_tick_left), tick_pen);
            draw(right_tick_left.LineTo(right_tick_right), tick_pen);
        }

        /*  Draw the semi-major tick marks.                                   */
        for (ns = 1; ns < y_subdivisions; ++ns)
        {
            ys = n + ns * y_semi_major_displacement;
            right_tick_right = vec2.Vec2(x_end + semi_major_tick_length, ys);
            right_tick_left = vec2.Vec2(x_end - semi_major_tick_length, ys);
            left_tick_right = vec2.Vec2(x_start + semi_major_tick_length, ys);
            left_tick_left = vec2.Vec2(x_start - semi_major_tick_length, ys);

            draw(left_tick_right.LineTo(left_tick_left), tick_pen);
            draw(right_tick_left.LineTo(right_tick_right), tick_pen);

            /*  Finally, draw the minor tick marks.                           */
            for (nm = 1; nm < x_minor_subdivisions; ++nm)
            {
                ym = ys + nm * y_minor_displacement;
                right_tick_right = vec2.Vec2(x_end + minor_tick_length, ym);
                right_tick_left = vec2.Vec2(x_end - minor_tick_length, ym);
                left_tick_right = vec2.Vec2(x_start + minor_tick_length, ym);
                left_tick_left = vec2.Vec2(x_start - minor_tick_length, ym);

                draw(left_tick_right.LineTo(left_tick_left), tick_pen);
                draw(right_tick_left.LineTo(right_tick_right), tick_pen);
            }
        }
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
 *      x_skip (int):                                                         *
 *          The number of tick marks to skip over in the x axis when drawing. *
 *      y_skip (int):                                                         *
 *          The number of tick marks to skip over in the y axis when drawing. *
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
                              int x_skip = 1,
                              int y_skip = 1,
                              real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);
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
        x_skip = x_skip,            /*  Number of tick marks skipped, x axis. */
        y_skip = y_skip,            /*  Number of tick marks skipped, y axis. */
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
        x_skip = grid_skip,         /*  Number of tick marks skipped, x axis. */
        y_skip = grid_skip,         /*  Number of tick marks skipped, y axis. */
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
 *      x_skip (int):                                                         *
 *          The number of tick marks to skip over in the x axis when drawing. *
 *      y_skip (int):                                                         *
 *          The number of tick marks to skip over in the y axis when drawing. *
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
                                int x_skip = 1,
                                int y_skip = 1,
                                real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_start < x_end);
    assert(y_start < y_end);
    assert(x_skip > 0);
    assert(y_skip > 0);
    assert(tick_length > 0.0);

    /*  Add grid lines to the drawing.                                        */
    grid.DrawGridLines(
        x_start,                    /*  Left-most border for the box plot.    */
        x_end,                      /*  Right-most border for the box plot.   */
        y_start,                    /*  Bottom-most border for the box plot.  */
        y_end,                      /*  Top-most border for the box plot.     */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        x_skip = x_skip,            /*  Number of tick marks skipped, x axis. */
        y_skip = y_skip             /*  Number of tick marks skipped, y axis. */
    );

    /*  Add a box, marking the two axes with tick marks.                      */
    DrawBoxCoordinates(
        x_start,                    /*  Left-most border for the box plot.    */
        x_end,                      /*  Right-most border for the box plot.   */
        y_start,                    /*  Bottom-most border for the box plot.  */
        y_end,                      /*  Top-most border for the box plot.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        x_skip = x_skip,            /*  Number of tick marks skipped, x axis. */
        y_skip = y_skip,            /*  Number of tick marks skipped, y axis. */
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
 *      y_length (real):                                                      *
 *          Half the height of the plot.                                      *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
 *      x_skip (int):                                                         *
 *          The number of tick marks to skip over in the x axis when drawing. *
 *      y_skip (int):                                                         *
 *          The number of tick marks to skip over in the y axis when drawing. *
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
                                           int x_skip = 1,
                                           int y_skip = 1,
                                           real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);
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
        x_skip = x_skip,            /*  Number of tick marks skipped, x axis. */
        y_skip = y_skip,            /*  Number of tick marks skipped, y axis. */
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

    /*  A square box is just a rectangular box with width equal to height.    *
     *  Use the rectangular drawing function with x_length = y_length.        */
    DrawRectangularBoxCoordinatesWithGridLines(
        length,                     /*  Length in the x direction.            */
        length,                     /*  Length in the y direction.            */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        x_skip = grid_skip,         /*  Number of tick marks skipped, x axis. */
        y_skip = grid_skip,         /*  Number of tick marks skipped, y axis. */
        tick_length = tick_length   /*  Length of the smaller tick marks.     */
    );
}
/*  End of DrawSquareBoxCoordinatesWithGridLines.                             */
