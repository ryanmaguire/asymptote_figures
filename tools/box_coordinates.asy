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
import vec2;
import grid_lines as grid;

/*  Default axis pen. Adequate for most drawings.                             */
pen default_axis_pen = black + linewidth(1.0pt) + fontsize(12pt);

/*  Default tick pen used to label and draw tick marks on the axes.           */
pen default_tick_pen = black + linewidth(0.4pt) + fontsize(12pt);

pen default_grid_pen = gray(0.8) + linewidth(0.3pt);

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
    int n, x_first, x_last, y_first, y_last;

    assert(x_start < x_end);
    assert(y_start < y_end);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    x_first = (int)(x_start);
    x_last = (int)(x_end);
    y_first = (int)(y_start);
    y_last = (int)(y_end);

    vec2.Vec2 bottom_left = vec2.Vec2(x_start, y_start);
    vec2.Vec2 top_left = vec2.Vec2(x_start, y_end);
    vec2.Vec2 top_right = vec2.Vec2(x_end, y_end);
    vec2.Vec2 bottom_right = vec2.Vec2(x_end, y_start);

    draw(bottom_left.LineTo(bottom_right), axis_pen);
    draw(bottom_right.LineTo(top_right), axis_pen);
    draw(top_right.LineTo(top_left), axis_pen);
    draw(top_left.LineTo(bottom_left), axis_pen);

    for (n = x_first; n <= x_last; n += grid_skip)
    {
        vec2.Vec2 upper_tick_top = vec2.Vec2(n, y_end + tick_length);
        vec2.Vec2 upper_tick_bottom = vec2.Vec2(n, y_end - tick_length);
        vec2.Vec2 lower_tick_top = vec2.Vec2(n, y_start + tick_length);
        vec2.Vec2 lower_tick_bottom = vec2.Vec2(n, y_start - tick_length);

        Label L = Label("$" + string(n) + "$", position = 1.0);
        draw(L, upper_tick_bottom.LineTo(upper_tick_top), tick_pen);
        draw(L, lower_tick_top.LineTo(lower_tick_bottom), tick_pen);
    }

    for (n = y_first; n <= y_last; n += grid_skip)
    {
        vec2.Vec2 right_tick_right = vec2.Vec2(x_end + tick_length, n);
        vec2.Vec2 right_tick_left = vec2.Vec2(x_end - tick_length, n);
        vec2.Vec2 left_tick_right = vec2.Vec2(x_start + tick_length, n);
        vec2.Vec2 left_tick_left = vec2.Vec2(x_start - tick_length, n);

        Label L = Label("$" + string(n) + "$", position = 1.0);
        draw(L, left_tick_right.LineTo(left_tick_left), tick_pen);
        draw(L, right_tick_left.LineTo(right_tick_right), tick_pen);
    }
}

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

    DrawRectangularBoxCoordinates(
        length,                     /*  Length in the x direction.            */
        length,                     /*  Length in the y direction.            */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the smaller tick marks.     */
    );
}

void
DrawSquareBoxCoordinatesWithGridLines(real length,
                                      pen axis_pen = default_axis_pen,
                                      pen tick_pen = default_tick_pen,
                                      pen grid_pen = default_grid_pen,
                                      int grid_skip = 1,
                                      real tick_length = 0.1)
{
    /*  Ensure all of the inputs are legal for the plot                       */
    assert(length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Add grid lines to the drawing.                                        */
    grid.DrawSquareGridLines(
        length, grid_pen = grid_pen, grid_skip = grid_skip
    );

    /*  Add a box, marking the two axes with tick marks.                      */
    DrawSquareBoxCoordinates(
        length,                     /*  Length in the x and y directions.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the box.         */
        tick_pen = tick_pen,        /*  Pen used for the smaller tick marks.  */
        grid_skip = grid_skip,      /*  Number of tick marks skipped.         */
        tick_length = tick_length   /*  Length of the smaller tick marks.     */
    );
}
