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
 *      Creates a visual for a reflexive relation on the integers.            *
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

/*  Pens used for indicating elements of the relation.                        */
pen fillpen = default.blue_pen + opacity(0.5);
pen drawpen = default.blue_thick_pen;

/*  Points for the path around the diagonal of the Cartesian product.         */
vec2.Vec2 diagonal[] = {
    vec2.Vec2(-0.5, 0.0),
    vec2.Vec2(9.0, 9.5),
    vec2.Vec2(9.5, 9.0),
    vec2.Vec2(0.0, -0.5)
};

/*  Distance used to describe the circular arc portion of the diagonal curve. */
real distance = 0.5 * diagonal[1].DistanceTo(diagonal[2]);

/*  Pieces of the diagonal curve.                                             */
path first_line = diagonal[0].LineTo(diagonal[1]);
path first_arc = vec2.Arc(diagonal[1], diagonal[2], distance, flip = true);
path second_line = diagonal[2].LineTo(diagonal[3]);
path second_arc = vec2.Arc(diagonal[3], diagonal[0], distance);

/*  Path for the blob drawn that contains the diagonal.                       */
path g = first_line -- first_arc -- second_line -- second_arc -- cycle;

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
 *  is a subset of this Cartesian product, and a reflexive relation is one    *
 *  that contains the diagonal y = x as a subset.                             */
for (x = start; x <= end; ++x)
{
    for (y = start; y <= end; ++y)
    {
        point = vec2.Vec2(x, y);
        point.DrawDot(default.dot_radius);
    }
}

/*  Reflexive means the diagonal is contains within the relation. Add this.   */
filldraw(g, fillpen, drawpen);