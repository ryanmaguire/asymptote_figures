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

void DrawSquareBoxCoordinates(int start, int end, real length)
{
    int n;
    vec2.Vec2 bottom_left = vec2.Vec2(-length, -length);
    vec2.Vec2 top_left = vec2.Vec2(-length, length);
    vec2.Vec2 top_right = vec2.Vec2(length, length);
    vec2.Vec2 bottom_right = vec2.Vec2(length, -length);

    draw(bottom_left.LineTo(bottom_right), default_axis_pen);
    draw(bottom_right.LineTo(top_right), default_axis_pen);
    draw(top_right.LineTo(top_left), default_axis_pen);
    draw(top_left.LineTo(bottom_left), default_axis_pen);

    for (n = start; n <= end; ++n)
    {
        vec2.Vec2 upper_tick_top = vec2.Vec2(n, length + 0.1);
        vec2.Vec2 upper_tick_bottom = vec2.Vec2(n, length);
        vec2.Vec2 lower_tick_top = vec2.Vec2(n, -length);
        vec2.Vec2 lower_tick_bottom = vec2.Vec2(n, -length - 0.1);
        vec2.Vec2 right_tick_right = vec2.Vec2(length + 0.1, n);
        vec2.Vec2 right_tick_left = vec2.Vec2(length, n);
        vec2.Vec2 left_tick_right = vec2.Vec2(-length, n);
        vec2.Vec2 left_tick_left = vec2.Vec2(-length - 0.1, n);

        Label L = Label("$" + string(n) + "$", position = 1.0);
        draw(L, upper_tick_bottom.LineTo(upper_tick_top), default_tick_pen);
        draw(L, lower_tick_top.LineTo(lower_tick_bottom), default_tick_pen);
        draw(L, left_tick_right.LineTo(left_tick_left), default_tick_pen);
        draw(L, right_tick_left.LineTo(right_tick_right), default_tick_pen);
    }
}

void DrawSquareBoxCoordinatesWithGridMarks(int start, int end, real length)
{
    /*  Add grid lines to the drawing.                                        */
    grid.DrawSquareGridLines(start, end, length);

    /*  Add a box, marking the two axes with tick marks.                      */
    DrawSquareBoxCoordinates(start, end, length);
}