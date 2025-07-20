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
 *      Draws Euclid's construction of an equilateral triangle using          *
 *      spherical geometry.                                                   *
 ******************************************************************************/
import vec2;
import vec3;
import parametric_curves as pc;
import size_256_default_settings as default;

vec3.Vec3 U = vec3.Vec3(1.0, 1.0, 1.0);
real height;
real radius = 1.0;
real dtheta = pi / 24.0;
real theta_start = 5.0 * dtheta - 0.5 * pi;
real theta_end = 0.5 * pi - dtheta;
real theta = theta_start;
real theta_factor = 0.5 * pi / (theta_end - theta_start);

real dphi = pi / 12.0;
real phi_start = atan2(U.y, U.x) - 0.5 * pi;
real phi_end = atan2(U.y, U.x) + 0.5 * pi;
real phi_factor = 0.5 * pi / (phi_end - phi_start);
real azimuth_angle = phi_start;

int n;

real azimuth_start_param(real R, real z)
{
    real r = sqrt(R*R - z*z);
    real factor_squared = r*r*(U.x*U.x + U.y*U.y) - z*z*U.z*U.z;

    if (factor_squared < 0.0)
        return 0.0;

    real factor = sqrt(factor_squared);
    real numer = r*U.y - factor;
    real denom = r*U.x - U.z*z;
    return 2.0 * atan2(numer, denom);
}

real azimuth_end_param(real R, real z)
{
    real r = sqrt(R*R - z*z);
    real factor_squared = r*r*(U.x*U.x + U.y*U.y) - z*z*U.z*U.z;

    if (factor_squared < 0.0)
        return 2.0 * pi;

    real factor = sqrt(factor_squared);
    real numer = r*U.y + factor;
    real denom = r*U.x - U.z*z;
    return 2.0 * atan2(numer, denom);
}

vec2.Vec2 azimuth(real t)
{
    real r = sqrt(radius*radius - height*height);
    real x = r * cos(t);
    real y = r * sin(t);
    vec3.Vec3 P = vec3.Vec3(x, y, height);
    vec2.Vec2 plane = vec3.OrthographicProjection(P, U);
    return plane.Rotate(-pi / 4);
}

path azimuth_curve(real R, real z)
{
    real a = azimuth_start_param(R, z);
    real b = azimuth_end_param(R, z);
    real t0 = a;
    real t1 = (a < b ? b : b + 2.0 * pi);
    int samples = 128;
    return pc.PathFromParametricFunction(azimuth, t0, t1, samples);
}

n = 0;

while (theta < theta_end)
{
    real color_angle = (theta - theta_start) * theta_factor;
    pen azimuth_pen = cos(color_angle) * blue + sin(color_angle) * red;
    height = radius * cos(0.5 * pi - theta);
    if (n == 15)
        draw(azimuth_curve(radius, height), default.blue_thick_pen);
    else
        draw(azimuth_curve(radius, height));
    theta += dtheta;
    n += 1;
}

real zenith_start_param(real R, real phi)
{
    real cos_phi = cos(phi);
    real sin_phi = sin(phi);
    real A = U.x * cos_phi + U.y * sin_phi;
    real B = U.z;

    return 2.0 * atan2(B - sqrt(A*A + B*B), A);
}

real zenith_end_param(real R, real phi)
{
    real cos_phi = cos(phi);
    real sin_phi = sin(phi);
    real A = U.x * cos_phi + U.y * sin_phi;
    real B = U.z;

    return 2.0 * atan2(B + sqrt(A*A + B*B), A);
}

vec2.Vec2 zenith(real t)
{
    real cos_t = cos(t);
    real x = radius * cos(azimuth_angle) * cos_t;
    real y = radius * sin(azimuth_angle) * cos_t;
    real z = radius * sin(t);
    vec3.Vec3 P = vec3.Vec3(x, y, z);
    vec2.Vec2 plane = vec3.OrthographicProjection(P, U);
    return plane.Rotate(-pi / 4);
}

path zenith_curve(real R, real phi)
{
    real a = zenith_start_param(R, phi);
    real b = zenith_end_param(R, phi);
    real t0 = a;
    real t1 = (a < b ? b : b + 2.0 * pi);
    int samples = 128;
    return pc.PathFromParametricFunction(zenith, t0, t1, samples);
}

while (azimuth_angle < phi_end)
{
    real color_angle = (azimuth_angle - phi_start) * phi_factor;
    pen azimuth_pen = cos(color_angle) * green + sin(color_angle) * yellow;
    draw(zenith_curve(radius, azimuth_angle));
    azimuth_angle += dphi;
}

draw(vec2.Origin.Circle(radius), default.thick_pen);
