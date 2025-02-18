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
 *      Creates a visual for a symmetric relation on the integers.            *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Variables for indexing over the two coordinate axes.                      */
int x, y, n;

/*  Parameters for both the x and y axes.                                     */
int start = 0;
int end = 9;

/*  Variable for the point (x, y) in the plane.                               */
vec2.Vec2 point;

/*  Parameters for the diagonal line indicating the reflection property.      */
vec2.Vec2 bottom_left = vec2.Vec2(0, 0);
vec2.Vec2 top_right = vec2.Vec2(end, end);

/*  Pens used for indicating elements of the relation.                        */
pen fillpen = default.blue_pen + opacity(0.5);
pen drawpen = default.blue_thick_pen;

/*  Draw the line of reflection.                                              */
draw(bottom_left.LineTo(top_right), default.red_pen);

/*  Create labels for the two axes.                                           */
for (n = start; n <= end; ++n)
{
    /*  Create a label using LaTeX math-mode syntax.                          */
    string nth_label = "$" + string(n) + "$";

    /*  Label the point on the x axis.                                        */
    point = vec2.Vec2(n, -1);
    point.AddLabel(nth_label);

    /*  Label the point on the y axis.                                        */
    point = vec2.Vec2(-1, n);
    point.AddLabel(nth_label);
}

/*  Loop over all points in the grid and add a dot. This is the Cartesian     *
 *  product of the set {0, 1, ..., 8, 9} with itself. A relation on this set  *
 *  is a subset of this Cartesian product, and a symmetric relation is one    *
 *  that has a symmetry across the line of reflection y = x.                  */
for (x = start; x <= end; ++x)
{
    for (y = start; y <= end; ++y)
    {
        point = vec2.Vec2(x, y);
        point.DrawDot(default.dot_radius);
    }
}

/*  Add a point to the relation.                                              */
point = vec2.Vec2(4, 7);
point.DrawDot(4.0 * default.dot_radius, fillpen = fillpen, drawpen = drawpen);

/*  The relation is symmetric so we must add the mirror of the previous point.*/
point = vec2.Vec2(7, 4);
point.DrawDot(4.0 * default.dot_radius, fillpen = fillpen, drawpen = drawpen);
