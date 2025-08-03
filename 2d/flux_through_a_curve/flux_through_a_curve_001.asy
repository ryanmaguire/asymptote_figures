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
 *      Plots y = x - 2x^3 + 2x^5 on [0, 1] with a vector field in the plane. *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Functions for creating paths from real-valued functions.                  */
import path_functions as pf;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  The curve we a plotting, y = x - 2x^3 + 2x^5.                             */
real func(real t)
{
    /*  Use Horner's method of polynomial evaluation to speed things up.      */
    real tsq = t * t;
    return t - 2.0 * t * tsq * (1.0 - tsq);
}

/*  The tangent vector for the curve.                                         */
vec2.Vec2 tangent(real t)
{
    /*  We compute the derivative and then normalize.                         */
    real tsq = t * t;
    real dx = 1.0;
    real dy = 1 - tsq * (6.0 - 10.0 * tsq);
    vec2.Vec2 velocity = vec2.Vec2(dx, dy);
    return 0.125 * velocity.AsUnitNormal();
}

/*  The normal vector for the curve.                                          */
vec2.Vec2 normal(vec2.Vec2 unit_velocity)
{
    /*  We compute using the input:                                           *
     *                                                                        *
     *             d r                                                        *
     *             ---                                                        *
     *      ^      d t                                                        *
     *      T = ---------                                                     *
     *          || d r ||                                                     *
     *          || --- ||                                                     *
     *          || d t ||                                                     *
     *                                                                        *
     *  The normal vector is then computed by rotating this 90 degrees.       *
     *  We are given the vector (dx / dt, dy / dt), so we simply need to      *
     *  return the orthogonal vector (-dy / dt, dx / dt).                     *
     *                                                                        *
     *  We scale the vector by 1 / 8 to ensure the arrows stay in the drawing.*/
    return 0.125 * unit_velocity.AsUnitOrthogonal();
}

/*  Parameters for the x and y coordinate axes.                               */
real x_start = -0.2;
real x_end = 1.2;
real y_start = x_start;
real y_end = x_end;

/*  Parameters for drawing the curve.                                         */
real start = 0.0;
real end = 1.0;
int samples = 64;

/*  Parameters for the vector field.                                          */
int x_bins = 8;
int y_bins = 8;
real drx = (end - start) / (real)(x_bins - 1);
real dry = (end - start) / (real)(y_bins - 1);
int nx, ny;

/*  The curve gamme to be drawn.                                              */
path gamma = pf.PathFromFunction(func, start, end, samples);

/*  Variables for the normal and tangent vectors along the curve.             */
int n;
int number_of_arrows = 8;
real displacement = (end - start) / (real)(number_of_arrows - 1);

/*  Location of the label for the curve gamma.                                */
vec2.Vec2 gamma_label = vec2.Vec2(0.8, 0.06);

/*  Locations for the labels of the tangent and normal vectors.               */
vec2.Vec2 tangent_label = vec2.Vec2(-0.3, 0.9);
vec2.Vec2 normal_label = vec2.Vec2(-0.3, 0.5);

/*  Location of the label for the vector field.                               */
vec2.Vec2 field_label = vec2.Vec2(0.5, 1.1);

/*  LaTeX strings for the labels.                                             */
string tangent_string =
    "$\displaystyle\color{blue}" +
    "\hat{\mathbf{T}}(t)=" +
    "\frac{\gamma^{\prime}(t)}{\|\gamma^{\prime}(t)\|}$";

string normal_string =
    "$\displaystyle\color{red}" +
    "\hat{\mathbf{N}}(t)=" +
    "\hat{\mathbf{T}}^{\prime}(t)$";

/*  We use the color package to color-code the equations.                     */
texpreamble("\usepackage{xcolor}");

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelCoordinateAxes(
    x_start, x_end, y_start, y_end
);

/*  Draw the curve first. This way the arrows lie on top of the curve.        */
draw(gamma);

/*  Loop through and add normal and tangent vectors along the curve.          */
for (n = 0; n < number_of_arrows; ++n)
{
    /*  Compute the position vector for the current point on the curve.       */
    real x = start + displacement * n;
    real y = func(x);
    vec2.Vec2 tail = vec2.Vec2(x, y);

    /*  The tangent vector depends only on the x component. Compute this.     */
    vec2.Vec2 vel = tangent(x);

    /*  The normal vector can be computed from the tangent vector.            */
    vec2.Vec2 perp = normal(vel);

    /*  The arrows are created from the locations of the heads and tails. We  *
     *  have the directions of the arrows, and the location of the tail, to   *
     *  obtain the heads we just use vector addition.                         */
    vec2.Vec2 tangent_head = tail + vel;
    vec2.Vec2 normal_head = tail + perp;

    /*  Add the arrows to the curve.                                          */
    draw(tail.LineTo(tangent_head), default.blue_pen, default.sharp_arrow);
    draw(tail.LineTo(normal_head), default.red_pen, default.sharp_arrow);
}

/*  Loop through and create the vector field.                                 */
for (nx = 1; nx < x_bins; ++nx)
{
    /*  Compute the x-coordinate for the current point.                       */
    real x = start + drx * nx;

    /*  We use a simple vector field, F(x, y) = (x / 8, 0). Compute this.     */
    vec2.Vec2 dir = 0.125 * vec2.Vec2(x, 0.0);

    /*  Sample over the y coordinates.                                        */
    for (ny = 1; ny < y_bins; ++ny)
    {
        /*  Compute the y-coordinate for the current point.                   */
        real y = start + dry * ny;

        /*  Make the arrow starting at (x, y) and ends at (x, y) + F(x, y).   */
        vec2.Vec2 tail = vec2.Vec2(x, y);
        vec2.Vec2 head = tail + dir;

        /*  Draw the arrow gray to avoid confusion with the normal and        *
         *  tangent arrows that have already been drawn.                      */
        draw(tail.LineTo(head), default.gray_thin_pen, default.sharp_arrow);
    }
}

/*  Finish by labeling and color-coding the arrows and the curve.             */
tangent_label.AddLabel(tangent_string);
normal_label.AddLabel(normal_string);
gamma_label.AddLabel("$\displaystyle\gamma(t)$");
field_label.AddLabel("$\displaystyle\color{gray}\mathbf{F}$");
