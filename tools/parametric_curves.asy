/******************************************************************************
 *                                  LICENSE                                   *
 ******************************************************************************
 *  This file is part of Mathematics-and-Physics.                             *
 *                                                                            *
 *  Mathematics-and-Physics is free software: you can redistribute it and/or  *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  Mathematics-and-Physics is distributed in the hope that it will be useful *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with Mathematics-and-Physics.  If not, see                          *
 *  <https://www.gnu.org/licenses/>.                                          *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Creates paths from functions.                                         *
 ******************************************************************************/

/*  Two-dimensional vectors found here.                                       */
import vec2;

/*  Creates a path from a parametric equation.                                */
path PathFromParametricFunction(vec2.Vec2 f(real), real a, real b, int samples)
{
    /*  Declare necessary variables.                                          */
    path g;
    real dt, t, start, end;
    vec2.Vec2 P;

    /*  There must be at least two samples to create a path.                  */
    assert(samples >= 2);

    /*  Make sure the input parameters are legal.                             */
    assert(!isnan(a));
    assert(!isnan(b));

    /*  The end points can not be equal.                                      */
    assert(a != b);

    /*  Set the starting point. This is whichever value is smaller.           */
    if (a < b)
    {
        start = a;
        end = b;
    }
    else
    {
        start = b;
        end = a;
    }

    /*  The samples are uniformly spaced throughout the interval (start, end).*/
    dt = (end - start) / (real)samples;
    t = start;

    /*  Initialize the path to the starting point.                            */
    P = f(t);
    g = P.AsPair();
    t += dt;

    /*  Loop over the samples and append them to the path.                    */
    while (t < end)
    {
        P = f(t);
        g = g .. P.AsPair();
        t += dt;
    }

    /*  Add the end point to the path.                                        */
    P = f(end);
    g = g .. P.AsPair();

    /*  If a < b, then start = a and end = b. Return as normal.               */
    if (a < b)
        return g;

    /*  Otherwise, start = b and end = a. Reverse the path and return.        */
    return reverse(g);
}
/*  End of PathFromParametricFunction.                                        */
