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
 *      Provides tools for plotting vector fields.                            *
 ******************************************************************************/
import custom_arrows as arrows;
import vec2;
import box_coordinates as bc;

pen default_arrow_pen = blue + linewidth(0.4pt) + fontsize(12pt);
arrowbar default_arrow = arrows.SharpArrow(8bp);

void
PlotVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                vec2.Vec2 box_start,
                vec2.Vec2 box_end,
                real dx = 0.25,
                real dy = 0.25)
{
    real x, y;
    real x_start, x_end, y_start, y_end, x_center, y_center;

    assert(dx > 0.0);
    assert(dy > 0.0);
    assert(box_start.x < box_end.x);
    assert(box_start.y < box_end.y);

    x_center = 0.5 * (box_start.x + box_end.x);
    y_center = 0.5 * (box_start.x + box_end.x);

    x_start = dx * ceil((box_start.x - x_center) / dx) + x_center;
    y_start = dy * ceil((box_start.y - y_center) / dy) + y_center;

    x_end = dx * floor((box_end.x - x_center) / dx) + x_center;
    y_end = dy * floor((box_end.y - y_center) / dy) + y_center;

    for (x = x_start; x <= x_end; x += dx)
    {
        for (y = y_start; y <= y_end; y += dy)
        {
            vec2.Vec2 start = vec2.Vec2(x, y);
            vec2.Vec2 end = start + vector_field(start);
            if (end.x > box_start.x &&
                end.x < box_end.x   &&
                end.y > box_start.y &&
                end.y < box_end.y)
                draw(start.LineTo(end), default_arrow_pen, default_arrow);
        }
    }
}

void
PlotRectangularVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                           real x_length,
                           real y_length,
                           real dx = 0.25,
                           real dy = 0.25)
{
    vec2.Vec2 box_start, box_end;
    assert(dx > 0.0);
    assert(dy > 0.0);
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    box_start = vec2.Vec2(-x_length, -y_length);
    box_end = vec2.Vec2(x_length, y_length);
    PlotVectorField(vector_field, box_start, box_end, dx, dy);
}

void
PlotSquareVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                      real box_length,
                      real ds = 0.25)
{
    assert(ds > 0.0);
    assert(box_length > 0.0);
    PlotRectangularVectorField(vector_field, box_length, box_length, ds, ds);
}

void VectorFieldSquareBoxPlotWithGridLines(vec2.Vec2 vector_field(vec2.Vec2),
                                           real box_length,
                                           real ds = 0.25)
{
    /*  Add a box around the drawing, marking the two axes with tick marks.   */
    bc.DrawSquareBoxCoordinatesWithGridLines(box_length);

    PlotSquareVectorField(vector_field, box_length, ds);
}
