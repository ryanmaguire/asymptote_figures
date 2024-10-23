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
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

import path_functions as pf;

int gcd(int n, int m)
{
    /*  Special case. The while loop can be infinite if one of the entries is *
     *  zero. GCD(n, 0) = n, so use this.                                     */
    if (m == 0)
        return n;

    /*  Same check for n. If it is zero, GCD(m, 0) = m.                       */
    if (n == 0)
        return m;

    /*  The "by-hand" algorithm repeatedly subtracts the smaller value from   *
     *  the larger value until the two are equal.                             */
    while (m != n)
    {
        /*  If m > n, we have GCD(m, n) = GCD(n, m - n), reducing the maximum *
         *  of the two values.                                                */
        if (m > n)
            m -= n;

        /*  If n > m, we have GCD(m, n) = GCD(m, n - m), similarly reducing   *
         *  the maximum of the two values.                                    */
        else
            n -= m;
    }

    return m;
}

pen default_grid_pen = gray(0.8) + linewidth(0.3pt);

void
DrawPolarAxes(int number_of_primary_circles,
              real radial_skip = 1.0,
              int radial_subdivisions = 5,
              int number_of_primary_spokes = 8,
              int azimuthal_subdivisions = 4)
{
    real drad, dtheta, r_max, azimuth_skip, r_primary, r, theta_primary, twopi;
    int nr, ntheta, nr_sub, ntheta_sub, gcd_val, a, b;
    vec2.Vec2 endpoint, label_point;
    vec2.Vec2[] clip_path;
    string label_string;
    real clip_val = (real)number_of_primary_circles * sqrt(0.5);

    assert(number_of_primary_circles > 0);
    assert(radial_skip > 0.0);
    assert(radial_subdivisions > 0);
    assert(number_of_primary_spokes > 0);
    assert(azimuthal_subdivisions > 0);

    twopi = 2.0 * pi;
    r_max = radial_skip * (real)number_of_primary_circles;
    drad = radial_skip / (real)(radial_subdivisions);
    dtheta = twopi / (real)(azimuthal_subdivisions * number_of_primary_spokes);
    azimuth_skip = twopi / (real)(number_of_primary_spokes);

    clip_path = new vec2.Vec2[4];
    clip_path[0] = vec2.Vec2(clip_val, clip_val);
    clip_path[1] = vec2.Vec2(-clip_val, clip_val);
    clip_path[2] = vec2.Vec2(-clip_val, -clip_val);
    clip_path[3] = vec2.Vec2(clip_val, -clip_val);

    for (nr = 0; nr < number_of_primary_circles; ++nr)
    {
        r_primary = (real)nr * radial_skip;

        for (nr_sub = 1; nr_sub < radial_subdivisions; ++nr_sub)
        {
            r = r_primary + nr_sub * drad;
            draw(vec2.Origin.Circle(r), default_grid_pen);
        }

        draw(vec2.Origin.Circle(r_primary + radial_skip));
    }

    for (ntheta = 0; ntheta < number_of_primary_spokes; ++ntheta)
    {
        theta_primary = azimuth_skip * (real)ntheta;
        endpoint = vec2.FromPolar(r_max, theta_primary);
        label_point = 0.5 * endpoint + 0.25*endpoint.AsUnitOrthogonal();
        draw(vec2.Origin.LineTo(endpoint));

        if (ntheta == 0)
            label_string = "$0$";
        else
        {
            gcd_val = gcd(2 * ntheta, number_of_primary_spokes);
            a = quotient(2 * ntheta, gcd_val);
            b = quotient(number_of_primary_spokes, gcd_val);
            if (b == 1)
                label_string = "$\pi$";
            else if (a == 1)
                label_string = "$\frac{\pi}{"+string(b)+"}$";
            else
                label_string = "$\frac{"+string(a)+"\pi}{"+string(b)+"}$";
        }

        label_point.AddLabel(label_string);

        for (ntheta_sub = 1; ntheta_sub < azimuthal_subdivisions; ++ntheta_sub)
        {
            real theta = theta_primary + dtheta * (real)ntheta_sub;
            endpoint = vec2.FromPolar(r_max, theta);
            draw(vec2.Origin.LineTo(endpoint), default_grid_pen);
        }
    }

    clip(pf.PolyFromPoints(clip_path, true));
}
