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

pen default_arrow_pen = blue + linewidth(0.4pt) + fontsize(12pt);
arrowbar default_arrow = arrows.SharpArrow(8bp);

void
PlotVectorField(vec2.Vec2 VectorField(vec2.Vec2),
                int grid_start,
                int grid_end,
                real arrow_threshold,
                real dx,
                real dy)
{
    assert(dx > 0.0);
    assert(dy > 0.0);
    assert(arrow_threshold > 0.0);
    assert(grid_start < grid_end);
    real x, y;

    for (x = grid_start; x <= grid_end; x += dx)
    {
        for (y = grid_start; y <= grid_end; y += dy)
        {
            vec2.Vec2 start = vec2.Vec2(x, y);
            vec2.Vec2 end = start + VectorField(start);
            if (abs(end.x) < arrow_threshold && abs(end.y) < arrow_threshold)
                draw(start.LineTo(end), default_arrow_pen, default_arrow);
        }
    }
}
