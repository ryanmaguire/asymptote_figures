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
 *      Draws the uv plane, used for parametrizing surfaces.                  *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Length of the coordinate axes.                                            */
real length = 10.0;

int n;
int start = 0;
int end = 10;

for (n = start; n <= end; ++n)
{
    vec2.Vec2 bottom = vec2.Vec2(n, 0.0);
    vec2.Vec2 top = vec2.Vec2(n, length);
    vec2.Vec2 left = vec2.Vec2(0.0, n);
    vec2.Vec2 right = vec2.Vec2(length, n);

    if ((n == start) || (n == end))
    {
        draw(bottom.LineTo(top), default.thick_pen);
        draw(left.LineTo(right), default.thick_pen);
    }
    else
    {
        draw(bottom.LineTo(top));
        draw(left.LineTo(right));
    }
}
