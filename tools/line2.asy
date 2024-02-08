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
 *                                    line2                                   *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides a 2D line struct. Experiments with the asymptote language.   *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       February 7, 2024                                              *
 ******************************************************************************/

/*  A linear consists of a point and a direction, represented as vectors.     */
import vec2;

/*  Struct for lines in the plane.                                            */
struct Line2 {

    /*  The data for a linear is a point and a direction.                     */
    vec2.Vec2 P, V;

    /*  Constructor from a point and a direction.                             */
    void operator init(vec2.Vec2 P, vec2.Vec2 V)
    {
        this.P = P;
        this.V = V;
    }

    /*  Empty initialization. Defines a single point, not a line.             */
    void operator init()
    {
        this.P = vec2.Vec2(0.0, 0.0);
        this.V = vec2.Vec2(0.0, 0.0);
    }

    vec2.Vec2 Intersect(Line2 L)
    {
        real det = -this.V.x*L.V.y + this.V.y*L.V.x;
        real rcpr_det = 1.0 / det;
        real x_factor = (this.P.x - L.P.x) * rcpr_det;
        real y_factor = (this.P.y - L.P.y) * rcpr_det;
        real t = x_factor*L.V.y - y_factor*L.V.x;
        return this.P + t*this.V;
    }
};

Line2 FromPoints(vec2.Vec2 P, vec2.Vec2 Q)
{
    vec2.Vec2 V = Q - P;
    return Line2(P, V);
}
