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
 *                                   circle                                   *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides a 2D circle struct. Experiments with the asymptote language. *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       January 30, 2025                                              *
 ******************************************************************************/

/*  Vec2 struct provided here. A circle is a point and a radius.              */
import vec2;

/*  The struct defining a circle.                                             */
struct Circle {

    /*  The center of the circle, a point in the plane.                       */
    vec2.Vec2 center;

    /*  The radius of the circle, a positive real number.                     */
    real radius;

    /*  Create a circle from a given center and radius.                       */
    void operator init(vec2.Vec2 c, real r)
    {
        /*  The radius should be a positive real number.                      */
        assert(r > 0.0);

        /*  Set the data for the circle to the given parameters.              */
        this.center = c;
        this.radius = r;
    }

    /*  Empty initializer, creates the unit circle centered at the origin.    */
    void operator init()
    {
        /*  Create the unit circle.                                           */
        this.center = vec2.Origin;
        this.radius = 1.0;
    }

    /**************************************************************************
     *  Method:                                                               *
     *      Intersect                                                         *
     *  Purpose:                                                              *
     *      Computes the point of intersection between "this" and a circle.   *
     *  Arguments:                                                            *
     *      other (Circle):                                                   *
     *          Another circle in the plane.                                  *
     *  Output:                                                               *
     *      points (vec2.Vec2[]):                                             *
     *          An array of two points, the points of intersection.           *
     *  Method:                                                               *
     **************************************************************************/
    vec2.Vec2[] Intersect(Circle other)
    {
        /*  Declare necessary variables.                                      */
        real dist, a, h, x0, y0, x1, y1, numer, denom;
        real P2x, P2y, factorx, factory, rcpr_dist, radius_squared;
        vec2.Vec2[] intersections;
        vec2.Vec2 difference;

        /*  r0 and r1 must be positive to define valid circles.               */
        assert(this.radius > 0.0);
        assert(other.radius > 0.0);

        /*  Compute the distance from P0 to P1.                               */
        dist = this.center.DistanceTo(other.center);

        /*  If dist > r0 + r1, there is no solution.                          */
        assert(dist <= (other.radius + this.radius));

        /*  Similarly if dist < |r1-r0| there is no solution.                 */
        assert(dist >= fabs(other.radius - this.radius));

        /*  If dist = 0 then the two circles have the same center. There are  *
         *  either no solutions or infinitely many.                           */
        assert(dist != 0.0);

        /*  We'll need to following for the computation. The above assertions *
         *  ensure these values are well defined.                             */
        rcpr_dist = 1.0 / dist;
        radius_squared = this.radius * this.radius;
        numer = radius_squared - other.radius*other.radius + dist*dist;
        denom = 2.0 * dist;
        a = numer / denom;
        h = sqrt(radius_squared - a*a);

        difference = other.center - this.center;

        /*  Compute the factor which determines the number of solutions.      */
        P2x = this.center.x + (a * rcpr_dist) * difference.x;
        P2y = this.center.y + (a * rcpr_dist) * difference.y;

        factorx = h * difference.y * rcpr_dist;
        factory = h * difference.x * rcpr_dist;

        /*  Compute the intersections and return.                             */
        x0 = P2x + factorx;
        y0 = P2y - factory;
        x1 = P2x - factorx;
        y1 = P2y + factory;
        intersections[0] = vec2.Vec2(x0, y0);
        intersections[1] = vec2.Vec2(x1, y1);
        return intersections;
    }
    /*  End of Intersect.                                                     */

    void Draw(pen drawpen = currentpen)
    {
        draw(circle(this.center.AsPair(), this.radius), drawpen);
    }

    void FillDraw(pen fillpen = currentpen, pen drawpen = currentpen)
    {
        filldraw(circle(this.center.AsPair(), this.radius), fillpen, drawpen);
    }

    void DrawArc(real start, real end, pen drawpen = currentpen)
    {
        draw(vec2.Arc(this.center, this.radius, start, end), drawpen);
    }
}
