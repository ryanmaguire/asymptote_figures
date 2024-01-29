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
 *      Linking of the skies of points in 2+1 dimensional Minkowski space.    *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings;

/*  Variable for indexing over the for loops.                                 */
int n;

/*  Number of samples used to draw the two circles.                           */
int number_of_samples = 200;

/*  Scaling factor for the inner circle. This represents the sky of the point *
 *  that is further in the future.                                            */
real scale_factor = 0.5;

/*  The result is a link, the Hopf link. To draw under-over information we'll *
 *  use this threshold to stop drawing the under strand.                      */
real threshold = 0.04;

/*  Allocate memory for the two links, embedded into the thickened torus.     */
triple p0[] = new triple[number_of_samples];
triple p1[] = new triple[number_of_samples];

/******************************************************************************
 *  Function:                                                                 *
 *      PlaneAndCircleToThickenedTorus                                        *
 *  Purpose:                                                                  *
 *      Homeomorphism from R^2 times S^1 to the thickened torus.              *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the plane.                                             *
 *      phi (real):                                                           *
 *          An angle on the unit circle.                                      *
 *  Output:                                                                   *
 *      T (triple):                                                           *
 *          A point on the thickened torus.                                   *
 *  Method:                                                                   *
 *      The thickened torus is the unit disk cross the unit circle. The unit  *
 *      disk is homeomorphic to the Euclidean plane by P -> P / (1 + ||P||).  *
 *      Hence the thickened torus is homeomorphic to the plane cross the      *
 *      circle. This function gives an explicit homeomorphism using this.     *
 ******************************************************************************/
triple PlaneAndCircleToThickenedTorus(vec2.Vec2 P, real phi)
{
    /*  The outer radius of the thickened torus.                              */
    real r0 = 1.5;

    /*  The inner radius is given by the plane-to-disk homeomorphism.         */
    real norm = P.Norm();
    real r1 = norm / (1.0 + norm);

    /*  The "zenith" angle for the point comes from the input polar angle.    */
    real theta = P.PolarAngle();

    /*  Standard parametrization for the torus.                               */
    real x = (r0 + r1*cos(theta))*cos(phi);
    real y = (r0 + r1*cos(theta))*sin(phi);
    real z = r1*sin(theta);
    return (x, y, z);
}
/*  End of PlaneAndCircleToThickenedTorus.                                    */

/*  Create the points for the two components of the link in the torus.        */
for (n = 0; n < number_of_samples; ++n)
{
    /*  Current angle for the points in the torus. Azimuthal angle.           */
    real angle = n * 2.0 * pi / number_of_samples;

    /*  Compute the planar points corresponding to this angle.                */
    vec2.Vec2 P = vec2.FromPolar(1.0, angle);
    vec2.Vec2 Q = scale_factor * P;

    /*  The normal direction is also parametrized by the polar angle.         */
    p0[n] = PlaneAndCircleToThickenedTorus(P, angle);
    p1[n] = PlaneAndCircleToThickenedTorus(Q, angle);
}

/*  Loop through and draw the components of the link.                         */
for (n = 0; n < number_of_samples; ++n)
{
    /*  Avoiding out-of-bound error. Compute modded by the number of samples. */
    int current = n;
    int next = (current + 1) % number_of_samples;

    /*  Project the current points down the z axis for the drawing.           */
    vec2.Vec2 P0 = vec2.Vec2(p0[current].x, p0[current].y);
    vec2.Vec2 Q0 = vec2.Vec2(p1[current].x, p1[current].y);
    vec2.Vec2 P1 = vec2.Vec2(p0[next].x, p0[next].y);
    vec2.Vec2 Q1 = vec2.Vec2(p1[next].x, p1[next].y);

    /*  We'll use the distance between points to determine what to draw.      */
    real dist = P0.DistanceTo(Q0);

    /*  Most likely case: the two points do not overlap. Safe to draw both.   */
    if (dist > threshold)
    {
        draw(P0.LineTo(P1));
        draw(Q0.LineTo(Q1));
    }

    /*  Case two: p0 is above p1. Draw p0, do not draw p1. This gives the     *
     *  illusion of an "under-strand" in the drawing for the link.            */
    else if (p0[n].z > p1[n].z)
        draw(P0.LineTo(P1));

    /*  Case three: p1 is above p0. Similar to before, draw p1 and not p0.    */
    else
        draw(Q0.LineTo(Q1));
}
