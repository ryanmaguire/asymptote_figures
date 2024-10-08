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
 *      Draws the Cartesian plane with a non-standard basis.                  *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -3;
int grid_end = 3;

/*  Length of the grid lines.                                                 */
real grid_length = 3.7;

/*  Variable for indexing over the grid lines and tick marks.                 */
int n;

/*  Two pens for the grid lines and the tick marks.                           */
pen default_grid_pen = gray(0.8) + linewidth(0.3pt);
pen default_tick_pen = black + linewidth(0.2pt) + fontsize(12pt);

/*  Variables for the two axes, the standard x axis, and the slanted u axis.  */
vec2.Vec2 x_axis_start = vec2.Vec2(-grid_length, 0.0);
vec2.Vec2 x_axis_end = -x_axis_start;
vec2.Vec2 u_axis_start = vec2.Vec2(-grid_length, -grid_length);
vec2.Vec2 u_axis_end = -u_axis_start;

/*  Loop through and draw the horizontal grid lines, the first half of the    *
 *  diagonal grid lines, and the tick marks in both axes.                     */
for (n = grid_start; n <= grid_end; ++n)
{
    /*  Defining points for the horizontal and diagonal grid lines.           */
    vec2.Vec2 left = vec2.Vec2(-grid_length, n);
    vec2.Vec2 right = vec2.Vec2(grid_length, n);
    vec2.Vec2 bottom = vec2.Vec2(-grid_length, n - 0.7);
    vec2.Vec2 top = vec2.Vec2(0.7 - n, grid_length);

    /*  Create the grid lines.                                                */
    draw(left.LineTo(right), default_grid_pen);
    draw(bottom.LineTo(top), default_grid_pen);

    /*  Do not add tick marks to the origin. It looks a bit too messy.        */
    if (n != 0)
    {
        /*  Points for the tick marks.                                        */
        vec2.Vec2 tick_left = vec2.Vec2(-0.1 + n, n);
        vec2.Vec2 tick_right = vec2.Vec2(0.1 + n, n);
        vec2.Vec2 tick_bottom = vec2.Vec2(n - 0.1, -0.1);
        vec2.Vec2 tick_top = vec2.Vec2(n + 0.1, 0.1);

        /*  Draw the tick marks and label them as well.                       */
        draw(tick_bottom.LineTo(tick_top), default_tick_pen);
        draw(tick_left.LineTo(tick_right), default_tick_pen);
        tick_right.AddLabel("$" + string(n) + "$", vec2.East);
        tick_bottom.AddLabel("$" + string(n) + "$", vec2.South);
    }
}

/*  Draw the second half of the diagonal grid lines.                          */
for (n = grid_start; n < grid_end; ++n)
{
    vec2.Vec2 bottom = vec2.Vec2(n - 0.7, -grid_length);
    vec2.Vec2 top = vec2.Vec2(grid_length, 0.7 - n);
    draw(bottom.LineTo(top), default_grid_pen);
}

/*  Draw the coordinate axes and plot them with arrows.                       */
draw(x_axis_start.LineTo(x_axis_end), default.thick_pen, default.sharp_arrow);
draw(u_axis_start.LineTo(u_axis_end), default.thick_pen, default.sharp_arrow);

/*  Finally, label the axes as well.                                          */
x_axis_end.AddLabel("$x$", 2.0*vec2.SouthWest);
u_axis_end.AddLabel("$u$", 2.0*vec2.West);
