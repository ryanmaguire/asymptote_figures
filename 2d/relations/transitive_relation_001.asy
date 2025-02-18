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
 *      Creates a visual for a transitive relation on the integers.           *
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

/*  Pens used for indicating the lines for the relation.                      */
pen fillpen = default.red_pen + opacity(0.5);
pen drawpen = default.red_thick_pen;

/*  Pens used for indicating the elements of the relation.                    */
pen dotfill = default.blue_pen + opacity(0.5);
pen dotdraw = default.blue_thick_pen;

/*  Points for the path around the vertical line containing (2, 6).           */
vec2.Vec2 vertical[] = {
    vec2.Vec2(1.5, -0.5),
    vec2.Vec2(2.5, -0.5),
    vec2.Vec2(2.5, +9.5),
    vec2.Vec2(1.5, +9.5)
};

/*  Points for the path around the horizontal line containing (2, 6).         */
vec2.Vec2 horizontal[] = {
    vec2.Vec2(-0.5, 5.5),
    vec2.Vec2(+9.5, 5.5),
    vec2.Vec2(+9.5, 6.5),
    vec2.Vec2(-0.5, 6.5)
};

/*  Path for the rectangles drawn that contain the point (2, 6).              */
path v = vec2.PolygonThroughPoints(vertical, closed = true);
path h = vec2.PolygonThroughPoints(horizontal, closed = true);

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
 *  is a subset of this Cartesian product. Transitive means if (x, y) and     *
 *  (y, z) are in the relation, then so is (x, z). That is, we take the       *
 *  horizontal entry from (x, y) and the vertical component from (y, z) and   *
 *  get the new point (x, z).                                                 */
for (x = start; x <= end; ++x)
{
    for (y = start; y <= end; ++y)
    {
        point = vec2.Vec2(x, y);
        point.DrawDot(default.dot_radius);
    }
}

/*  Transitive means the intersection of the two lines is contained in the    *
 *  relation. That is, the intersection of the horizontal and vertical lines. */
filldraw(v, fillpen, drawpen);
filldraw(h, fillpen, drawpen);

/*  The point (x, y) is (2, 4).                                               */
point = vec2.Vec2(2, 4);
point.DrawDot(4.0 * default.dot_radius, fillpen = dotfill, drawpen = dotdraw);

/*  The point (y, z) is (4, 6). Mark this point in the plane.                 */
point = vec2.Vec2(4, 6);
point.DrawDot(4.0 * default.dot_radius, fillpen = dotfill, drawpen = dotdraw);

/*  Since (2, 4) and (4, 6) are in the relation, so must (2, 6) for the       *
 *  relation to be transitive. Mark this point as well.                       */
point = vec2.Vec2(2, 6);
point.DrawDot(4.0 * default.dot_radius, fillpen = dotfill, drawpen = dotdraw);