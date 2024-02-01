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
 *      Draw a genus 2 surface by drawing two torii and blending.             *
 ******************************************************************************/

/*  Used for rendering parameterized 3D objects.                              */
import graph3;

/*  PDF works best with LaTeX, output this. Also set the render factor high.  */
import settings;
settings.outformat = "pdf";
settings.render = 8;

/*  Size of the image. For 3D objects it seems best to have this set to a     *
 *  power of 2, otherwise weird vertical or horizontal black lines may appear.*/
size(256);

/*  How the image is being drawn on a 2D picture.                             */
currentprojection = perspective(5.0, 4.0, 4.0);

/*  Two radii defining the torus.                                             */
real R = 3.0;
real a = 1.0;

/*  Number of samples in the merge region between the two torii.              */
int xsamples = 20;
int ysamples = 40;

/*  Start and end parameters for the merge region.                            */
pair start = (-R - a, -2.0);
pair end = (-R, 2.0);

/*  Material the 2-genus surface is made out of.                              */
material blob = material(
    diffusepen = gray(0.7),
    emissivepen = gray(0.2),
    specularpen = gray(0.2)
);

/*  Function for drawing the torus.                                           */
triple torus_parameterization(pair t)
{
    /*  The parameterization is in terms of sine and cosine of 2 pi t.x and   *
     *  2 pi t.y. Precompute these to avoid repetitive calculations.          */
    real u = 2.0*pi*t.x;
    real v = 2.0*pi*t.y;
    real cosu = cos(u);
    real cosv = cos(v);
    real sinu = sin(u);
    real sinv = sin(v);

    /*  Given the two angles u and v, the x, y, and z coordinates are:        */
    real x = (R + a*cosv)*cosu;
    real y = (R + a*cosv)*sinu;
    real z = a*sinv;

    /*  Return the point (x, y, z), which is a point on the surface.          */
    triple out = (x, y, z);
    return out;
}
/*  End of torus_parameterization.                                            */

/*  First function for merging the two torii.                                 */
triple f(pair P)
{
    triple out;
    real x_plus_R = P.x + R;
    real a_plus_R = a + R;

    /*  The x and y values are the same for all cases.                        */
    real x = P.x + 0.5*x_plus_R*x_plus_R/a;
    real y = sin(0.5*pi*P.y) * sqrt(a_plus_R*a_plus_R - x*x);

    /*  This factor is used for the z part.                                   */
    real factor = R - sqrt(x*x + y*y);

    /*  The z part only differs in sign, depending on the value of P.y        */
    real z = sqrt(a*a - factor*factor);

    if (fabs(P.y) >= 1.0)
        out = (-P.x, y, -z);
    else
        out = (-P.x, y, z);

    return out;
}
/*  End of f.                                                                 */

/*  Second function for merging the two torii.                                */
triple g(pair P)
{
    triple out;
    real x_plus_R = P.x + R;
    real a_plus_R = a + R;

    /*  The x and y values are the same for all cases.                        */
    real x = P.x + 0.5*x_plus_R*x_plus_R/a;
    real y = sin(0.5*pi*P.y) * sqrt(a_plus_R*a_plus_R - x*x);

    /*  This factor is used for the z part.                                   */
    real factor = R - sqrt(x*x + y*y);

    /*  The z part only differes in sign, depending on the value of P.y       */
    real z = sqrt(a*a - factor*factor);

    if (fabs(P.y) >= 1.0)
        out = (P.x, y, -z);
    else
        out = (P.x, y, z);

    return shift((2.0*(R + a), 0.0, 0.0))*out;
}
/*  End of g.                                                                 */

/*  Create the first torus.                                                   */
surface t0 = surface(torus_parameterization, (0.0, 0.0), (1.0, 1.0), Spline);

/*  The second torus is obtained by shifting the first in the x direction.    */
surface t1 = shift((2.0*(R + a), 0.0, 0.0))*t0;

/*  The two surfaces for blending the two torii together.                     */
surface merge0 = surface(f, start, end, xsamples, ysamples, Spline);
surface merge1 = surface(g, start, end, xsamples, ysamples, Spline);

/*  Draw all of the surfaces.                                                 */
draw(t0, surfacepen = blob, render(merge=true));
draw(t1, surfacepen = blob, render(merge=true));
draw(merge0, surfacepen = blob, render(merge=true));
draw(merge1, surfacepen = blob, render(merge=true));
