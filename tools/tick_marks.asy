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
 *      Functions for adding vertical and horizontal tick marks.              *
 ******************************************************************************/

import vec2;

/*  Default tick pen used to label and draw tick marks on the axes.           */
pen default_tick_pen = black + linewidth(0.3pt) + fontsize(12pt);

void
DrawHorizontalTickMarks(real x_start,
                        real x_end,
                        real x_tick_length = 0.1,
                        real x_tick_minor_length = 0.05,
                        pen tick_pen = default_tick_pen,
                        int x_skip = 1,
                        int x_subdivisions = 1,
                        bool up_ticks = true,
                        bool down_ticks = true,
                        bool skip_zero = true)
{
    /*  Variables for indexing over the tick marks.                           */
    int n, m;

    /*  Indices representing the start and end values for the tick marks.     */
    int x_first, x_last;

    /*  It is possible that x_start > x_end. For example, if the user wants   *
     *  the arrow to point to the left in the coordinate axis. Swap the       *
     *  variables if this is the case.                                        */
    real x_begin, x_finish;

    /*  Variable for displacement between minor tick marks, if requested.     */
    real dx;

    /*  Check for legal inputs.                                               */
    assert(x_tick_length > 0.0);
    assert(x_tick_minor_length > 0.0);
    assert(x_skip > 0);
    assert(x_subdivisions > 0);

    /*  Check if we need to swap the variables.                               */
    if (x_start > x_end)
    {
        x_begin = x_end;
        x_finish = x_start;
    }
    else
    {
        x_begin = x_start;
        x_finish = x_end;
    }

    /*  Cast inputs to ints. We assume rounding mode is truncate, which is    *
     *  equivalent to round-to-zero. To avoid x_first < x_begin, use the      *
     *  ceil function before casting. Similarly, to avoid x_last > x_finish,  *
     *  first take the floor of x_finish and then cast.                       */
    x_first = (int)(ceil(x_begin));
    x_last = (int)(floor(x_finish));

    /*  Displacement between tick marks is the ratio of the steps.            */
    dx = (real)x_skip / (real)x_subdivisions;

    /*  Loop through and draw the tick marks for the x axes.                  */
    for (n = x_first; n <= x_last; n += x_skip)
    {
        if ((n != 0) || (!skip_zero))
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 top = vec2.Vec2(n, x_tick_length);
            vec2.Vec2 center = vec2.Vec2(n, 0.0);
            vec2.Vec2 bottom = vec2.Vec2(n, -x_tick_length);

            if (up_ticks)
                draw(top.LineTo(center), tick_pen);

            if (down_ticks)
                draw(bottom.LineTo(center), tick_pen);
        }

        /*  Do not draw minor tick marks after the final major one.           */
        if (n == x_last)
            break;

        for (m = 1; m < x_subdivisions; ++m)
        {
            real x0 = n + m*dx;
            vec2.Vec2 min_top = vec2.Vec2(x0, x_tick_minor_length);
            vec2.Vec2 min_center = vec2.Vec2(x0, 0.0);
            vec2.Vec2 min_bottom = vec2.Vec2(x0, -x_tick_minor_length);

            if (up_ticks)
                draw(min_top.LineTo(min_center), tick_pen);

            if (down_ticks)
                draw(min_bottom.LineTo(min_center), tick_pen);
        }

    }
    /*  End of for-loop drawing the x-tick-marks.                             */
}
/*  End of DrawHorizontalTickMarks.                                           */

void
DrawVerticalTickMarks(real y_start,
                      real y_end,
                      real y_tick_length = 0.1,
                      real y_tick_minor_length = 0.05,
                      pen tick_pen = default_tick_pen,
                      int y_skip = 1,
                      int y_subdivisions = 1,
                      bool left_ticks = true,
                      bool right_ticks = true,
                      bool skip_zero = true)
{
    /*  Variables for indexing over the tick marks.                           */
    int n, m;

    /*  Indices representing the start and end values for the tick marks.     */
    int y_first, y_last;

    /*  It is possible that y_start > y_end. For example, if the user wants   *
     *  the arrow to point to the bottom in the coordinate axis. Swap the     *
     *  variables if this is the case.                                        */
    real y_begin, y_finish;

    /*  Variable for displacement between minor tick marks, if requested.     */
    real dy;

    /*  Check for legal inputs.                                               */
    assert(y_tick_length > 0.0);
    assert(y_tick_minor_length > 0.0);
    assert(y_skip > 0);
    assert(y_subdivisions > 0);

    /*  Check if we need to swap the variables.                               */
    if (y_start > y_end)
    {
        y_begin = y_end;
        y_finish = y_start;
    }
    else
    {
        y_begin = y_start;
        y_finish = y_end;
    }

    /*  Cast inputs to ints. We assume rounding mode is truncate, which is    *
     *  equivalent to round-to-zero. To avoid y_first < y_begin, use the      *
     *  ceil function before casting. Similarly, to avoid y_last > y_finish,  *
     *  first take the floor of y_finish and then cast.                       */
    y_first = (int)(ceil(y_begin));
    y_last = (int)(floor(y_finish));

    /*  Displacement between tick marks is the ratio of the steps.            */
    dy = (real)y_skip / (real)y_subdivisions;

    /*  Loop through and draw the tick marks for the y axes.              */
    for (n = y_first; n <= y_last; n += y_skip)
    {
        if ((n != 0) || (!skip_zero))
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 right = vec2.Vec2(y_tick_length, n);
            vec2.Vec2 center = vec2.Vec2(0.0, n);
            vec2.Vec2 left = vec2.Vec2(-y_tick_length, n);

            if (left_ticks)
                draw(left.LineTo(center), tick_pen);

            if (right_ticks)
                draw(right.LineTo(center), tick_pen);
        }

        /*  Do not draw minor tick marks after the final major one.           */
        if (n == y_last)
            break;

        for (m = 1; m < y_subdivisions; ++m)
        {
            real y0 = n + m*dy;
            vec2.Vec2 min_right = vec2.Vec2(y_tick_minor_length, y0);
            vec2.Vec2 min_center = vec2.Vec2(0.0, y0);
            vec2.Vec2 min_left = vec2.Vec2(-y_tick_minor_length, y0);

            if (left_ticks)
                draw(min_left.LineTo(min_center), tick_pen);

            if (right_ticks)
                draw(min_right.LineTo(min_center), tick_pen);
        }
    }
    /*  End of for-loop drawing the y-tick-marks.                             */
}
/*  End of DrawVerticalTickMarks.                                             */

void
DrawAndLabelHorizontalTickMarks(real x_start,
                                real x_end,
                                pen tick_pen = default_tick_pen,
                                real x_tick_length = 0.1,
                                real x_tick_minor_length = 0.05,
                                int x_skip = 1,
                                int x_subdivisions = 1,
                                string x_prefix = "",
                                string x_suffix = "",
                                string x_string = "x",
                                bool up_ticks = true,
                                bool down_ticks = true,
                                bool skip_zero = true)
{
    /*  Variables for indexing over the tick marks.                           */
    int n, m;

    /*  Indices representing the start and end values for the tick marks.     */
    int x_first, x_last;

    /*  It is possible that x_start > x_end. For example, if the user wants   *
     *  the arrow to point to the left in the coordinate axis. Swap the       *
     *  variables if this is the case.                                        */
    real x_begin, x_finish;

    /*  Variable for displacement between minor tick marks, if requested.     */
    real dx;

    /*  Check for legal inputs.                                               */
    assert(x_tick_length > 0.0);
    assert(x_tick_minor_length > 0.0);
    assert(x_skip > 0);
    assert(x_subdivisions > 0);

    /*  Check if we need to swap the variables.                               */
    if (x_start > x_end)
    {
        x_begin = x_end;
        x_finish = x_start;
    }
    else
    {
        x_begin = x_start;
        x_finish = x_end;
    }

    /*  Cast inputs to ints. We assume rounding mode is truncate, which is    *
     *  equivalent to round-to-zero. To avoid x_first < x_begin, use the      *
     *  ceil function before casting. Similarly, to avoid x_last > x_finish,  *
     *  first take the floor of x_finish and then cast.                       */
    x_first = (int)(ceil(x_begin));
    x_last = (int)(floor(x_finish));

    /*  Displacement between tick marks is the ratio of the steps.            */
    dx = (real)x_skip / (real)x_subdivisions;

    /*  Loop through and draw the tick marks for the x axes.                  */
    for (n = x_first; n <= x_last; n += x_skip)
    {
        if ((n != 0) || (!skip_zero))
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 top = vec2.Vec2(n, x_tick_length);
            vec2.Vec2 center = vec2.Vec2(n, 0.0);
            vec2.Vec2 bottom = vec2.Vec2(n, -x_tick_length);

            /*  A label for the tick mark.                                    */
            string tick_str = x_prefix + string(n) + x_suffix;
            Label tick_label = Label("$" + tick_str + "$", position = 1.0);

            /*  Draw and label the tick marks.                                */
            if (up_ticks && !down_ticks)
                draw(tick_label, center.LineTo(top), tick_pen);

            else if (up_ticks && down_ticks)
                draw(tick_label, top.LineTo(bottom), tick_pen);

            else if (down_ticks)
                draw(tick_label, center.LineTo(bottom), tick_pen);
        }

        /*  Do not draw minor tick marks after the final major one.           */
        if (n == x_last)
            break;

        for (m = 1; m < x_subdivisions; ++m)
        {
            real x0 = n + m*dx;
            vec2.Vec2 min_top = vec2.Vec2(x0, x_tick_minor_length);
            vec2.Vec2 min_bottom = vec2.Vec2(x0, x_tick_minor_length);
            vec2.Vec2 min_center = vec2.Vec2(x0, x_tick_minor_length);

            if (up_ticks)
                draw(min_top.LineTo(min_center), tick_pen);

            if (down_ticks)
                draw(min_bottom.LineTo(min_center), tick_pen);
        }
    }
    /*  End of for-loop drawing the x-tick-marks, skipping the origin.    */
}
/*  End of DrawAndLabelHorizontalTickMarks.                                   */

void
DrawAndLabelVerticalTickMarks(real y_start,
                              real y_end,
                              pen tick_pen = default_tick_pen,
                              real y_tick_length = 0.1,
                              real y_tick_minor_length = 0.05,
                              int y_skip = 1,
                              int y_subdivisions = 1,
                              string y_prefix = "",
                              string y_suffix = "",
                              string y_string = "x",
                              bool left_ticks = true,
                              bool right_ticks = true,
                              bool skip_zero = true)
{
    /*  Variables for indexing over the tick marks.                           */
    int n, m;

    /*  Indices representing the start and end values for the tick marks.     */
    int y_first, y_last;

    /*  It is possible that y_start > y_end. For example, if the user wants   *
     *  the arrow to point to the bottom in the coordinate axis. Swap the     *
     *  variables if this is the case.                                        */
    real y_begin, y_finish;

    /*  Variable for displacement between minor tick marks, if requested.     */
    real dy;

    /*  Check for legal inputs.                                               */
    assert(y_tick_length > 0.0);
    assert(y_tick_minor_length > 0.0);
    assert(y_skip > 0);
    assert(y_subdivisions > 0);

    /*  Check if we need to swap the variables.                               */
    if (y_start > y_end)
    {
        y_begin = y_end;
        y_finish = y_start;
    }
    else
    {
        y_begin = y_start;
        y_finish = y_end;
    }

    /*  Cast inputs to ints. We assume rounding mode is truncate, which is    *
     *  equivalent to round-to-zero. To avoid y_first < y_begin, use the      *
     *  ceil function before casting. Similarly, to avoid y_last > y_finish,  *
     *  first take the floor of y_finish and then cast.                       */
    y_first = (int)(ceil(y_begin));
    y_last = (int)(floor(y_finish));

    /*  Displacement between tick marks is the ratio of the steps.            */
    dy = (real)y_skip / (real)y_subdivisions;

    /*  Loop through and draw the tick marks for the y axes.                  */
    for (n = y_first; n <= y_last; n += y_skip)
    {
        if ((n != 0) || (!skip_zero))
        {
            /*  End points for the tick marks.                            */
            vec2.Vec2 right = vec2.Vec2(y_tick_length, n);
            vec2.Vec2 center = vec2.Vec2(0.0, n);
            vec2.Vec2 left = vec2.Vec2(-y_tick_length, n);

            /*  A label for the tick mark.                                */
            string tick_str = y_prefix + string(n) + y_suffix;
            Label tick_label = Label("$" + tick_str + "$", position = 1.0);

            /*  Draw and label the tick marks.                            */
            if (right_ticks && !left_ticks)
                draw(tick_label, center.LineTo(right), tick_pen);

            else if (right_ticks && left_ticks)
                draw(tick_label, right.LineTo(left), tick_pen);

            else if (left_ticks)
                draw(tick_label, center.LineTo(left), tick_pen);
        }

        /*  Do not draw minor tick marks after the final major one.           */
        if (n == y_last)
            break;

        for (m = 1; m < y_subdivisions; ++m)
        {
            real y0 = n + m*dy;
            vec2.Vec2 min_right = vec2.Vec2(y_tick_minor_length, y0);
            vec2.Vec2 min_center = vec2.Vec2(0.0, y0);
            vec2.Vec2 min_left = vec2.Vec2(-y_tick_minor_length, y0);

            if (left_ticks)
                draw(min_left.LineTo(min_center), tick_pen);

            if (right_ticks)
                draw(min_right.LineTo(min_center), tick_pen);
        }
    }
    /*  End of for-loop drawing the y-tick-marks, skipping the origin.    */
}
/*  End of DrawAndLabelVerticalTickMarks.                                     */
