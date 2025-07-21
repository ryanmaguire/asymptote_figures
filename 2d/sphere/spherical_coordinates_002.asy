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
 *      Depicts the orthographic projection of the northern hemisphere of the *
 *      unit sphere onto the xy plane.                                        *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Three dimensional vector struct provided here.                            */
import vec3;

import parametric_curves as pc;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

texpreamble("\usepackage{mathtools}");

vec3.Vec3 observer = vec3.Vec3(10.0, 4.0, 3.0);

vec3.Vec3 point3 = vec3.Vec3(2.0, 2.0, 2.0);

vec3.Vec3 point3_x = vec3.Vec3(point3.x, 0.0, 0.0);
vec3.Vec3 point3_y = vec3.Vec3(0.0, point3.y, 0.0);

vec3.Vec3 point3_xy = vec3.Vec3(point3.x, point3.y, 0.0);

vec3.Vec3 vtheta3 = point3 + point3.UnitZenith();
vec3.Vec3 vphi3 = point3 + point3.UnitAzimuth();
vec3.Vec3 vr3 = point3 + point3.AsUnitNormal();

vec2.Vec2 vtheta2 = vec3.OrthographicProjection(vtheta3, observer);
vec2.Vec2 vphi2 = vec3.OrthographicProjection(vphi3, observer);
vec2.Vec2 vr2 = vec3.OrthographicProjection(vr3, observer);

vec2.Vec2 point2 = vec3.OrthographicProjection(point3, observer);
vec2.Vec2 point2_xy = vec3.OrthographicProjection(point3_xy, observer);
vec2.Vec2 point2_x = vec3.OrthographicProjection(point3_x, observer);
vec2.Vec2 point2_y = vec3.OrthographicProjection(point3_y, observer);

real radius = point3.Norm();
real height = point3.z;
real azimuth_angle = point3.PolarAngle();

position end_pos = 1.0;

vec3.Vec3 x3_axis = vec3.Vec3(1.25 * radius, 0.0, 0.0);
vec3.Vec3 y3_axis = vec3.Vec3(0.0, 1.25 * radius, 0.0);
vec3.Vec3 z3_axis = vec3.Vec3(0.0, 0.0, 1.25 * radius);

vec2.Vec2 xpt = vec3.OrthographicProjection(x3_axis, observer);
vec2.Vec2 ypt = vec3.OrthographicProjection(y3_axis, observer);
vec2.Vec2 zpt = vec3.OrthographicProjection(z3_axis, observer);

/*  Create labels for the coordinate axes that describe the sphere.           */
Label x_label = Label("$x$", end_pos, align = vec2.SouthWest.AsPair());
Label y_label = Label("$y$", end_pos, align = vec2.East.AsPair());
Label z_label = Label("$z$", end_pos, align = vec2.North.AsPair());

Label vphi_label = Label("$\hat{\boldsymbol{\phi}}$", end_pos);
Label vtheta_label = Label("$\hat{\boldsymbol{\theta}}$", end_pos);
Label vr_label = Label("$\hat{\boldsymbol{r}}$", end_pos);

Label theta_label = Label("$\theta$", align = vec2.NorthEast.AsPair());
Label phi_label = Label("$\phi$", align = vec2.SouthEast.AsPair());

real angle = pi / 2 - zpt.PolarAngle();

point2 = point2.Rotate(angle);
point2_xy = point2_xy.Rotate(angle);
point2_x = point2_x.Rotate(angle);
point2_y = point2_y.Rotate(angle);

xpt = xpt.Rotate(angle);
ypt = ypt.Rotate(angle);
zpt = zpt.Rotate(angle);

vtheta2 = vtheta2.Rotate(angle);
vphi2 = vphi2.Rotate(angle);
vr2 = vr2.Rotate(angle);

real azimuth_start_param(real r, real z, vec3.Vec3 u)
{
    real r_xy = sqrt(r*r - z*z);
    real factor_squared = r_xy*r_xy * (u.x*u.x + u.y*u.y) - u.z*u.z * z*z;

    if (factor_squared < 0.0)
        return 0.0;

    real factor = sqrt(factor_squared);
    real numer = r_xy * u.y - factor;
    real denom = r_xy * u.x - u.z * z;
    return 2.0 * atan2(numer, denom);
}

real azimuth_end_param(real r, real z, vec3.Vec3 u)
{
    real r_xy = sqrt(r*r - z*z);
    real factor_squared = r_xy*r_xy * (u.x*u.x + u.y*u.y) - u.z*u.z * z*z;

    if (factor_squared < 0.0)
        return 0.0;

    real factor = sqrt(factor_squared);
    real numer = r_xy * u.y + factor;
    real denom = r_xy * u.x - u.z * z;
    return 2.0 * atan2(numer, denom);
}

vec2.Vec2 azimuth(real t)
{
    real rho = sqrt(radius * radius - height * height);
    real x = rho * cos(t);
    real y = rho * sin(t);
    vec3.Vec3 point = vec3.Vec3(x, y, height);
    vec2.Vec2 plane = vec3.OrthographicProjection(point, observer);
    return plane.Rotate(angle);
}

path azimuth_curve(real r, real z, vec3.Vec3 u)
{
    real a = azimuth_start_param(r, z, u);
    real b = azimuth_end_param(r, z, u);
    real t0 = a;
    real t1 = (a < b ? b : b + 2.0 * pi);
    int samples = 128;
    return pc.PathFromParametricFunction(azimuth, t0, t1, samples);
}

real zenith_start_param(real r, real phi, vec3.Vec3 u)
{
    real cos_phi = cos(phi);
    real sin_phi = sin(phi);
    real A = u.x * cos_phi + u.y * sin_phi;
    real B = u.z;

    return 2.0 * atan2(B - sqrt(A*A + B*B), A);
}

real zenith_end_param(real r, real phi, vec3.Vec3 u)
{
    real cos_phi = cos(phi);
    real sin_phi = sin(phi);
    real A = u.x * cos_phi + u.y * sin_phi;
    real B = u.z;

    return 2.0 * atan2(B + sqrt(A*A + B*B), A);
}

vec2.Vec2 zenith(real t)
{
    real cos_t = cos(t);
    real x = radius * cos(azimuth_angle) * cos_t;
    real y = radius * sin(azimuth_angle) * cos_t;
    real z = radius * sin(t);
    vec3.Vec3 point = vec3.Vec3(x, y, z);
    vec2.Vec2 plane = vec3.OrthographicProjection(point, observer);
    return plane.Rotate(angle);
}

path zenith_curve(real r, real phi, vec3.Vec3 u)
{
    real a = zenith_start_param(r, phi, u);
    real b = zenith_end_param(r, phi, u);
    real t0 = a;
    real t1 = (a < b ? b : b + 2.0 * pi);
    int samples = 128;
    return pc.PathFromParametricFunction(zenith, t0, t1, samples);
}

vec2.Vec2 small_zenith(real t)
{
    real cos_t = cos(t);
    real x = 0.25 * radius * cos(azimuth_angle) * cos_t;
    real y = 0.25 * radius * sin(azimuth_angle) * cos_t;
    real z = 0.25 * radius * sin(t);
    vec3.Vec3 point = vec3.Vec3(x, y, z);
    vec2.Vec2 plane = vec3.OrthographicProjection(point, observer);
    return plane.Rotate(angle);
}

path theta_curve(vec3.Vec3 u)
{
    real a = point3.ZenithAngle();
    real b = pi / 2;
    int samples = 128;
    return pc.PathFromParametricFunction(small_zenith, a, b, samples);
}

vec2.Vec2 small_azimuth(real t)
{
    real rho = sqrt(radius * radius - height * height);
    real x = 0.25 * rho * cos(t);
    real y = 0.25 * rho * sin(t);
    vec3.Vec3 point = vec3.Vec3(x, y, 0.0);
    vec2.Vec2 plane = vec3.OrthographicProjection(point, observer);
    return plane.Rotate(angle);
}

path phi_curve(vec3.Vec3 u)
{
    real a = 0;
    real b = azimuth_angle;
    int samples = 128;
    return pc.PathFromParametricFunction(small_azimuth, a, b, samples);
}

path theta = theta_curve(observer);
path phi = phi_curve(observer);

path az_curve = azimuth_curve(radius, height, observer);
path zen_curve = zenith_curve(radius, azimuth_angle, observer);

height = 0;
path equator = azimuth_curve(radius, height, observer);

azimuth_angle = pi / 2;
path left_bound = zenith_curve(radius, azimuth_angle, observer);
path arc1 = pc.PathFromParametricFunction(zenith, pi / 2, 0, 128);
path arc2 = pc.PathFromParametricFunction(azimuth, pi / 2, 0, 128);
azimuth_angle = 0;
path right_bound = zenith_curve(radius, azimuth_angle, observer);
path arc3 = pc.PathFromParametricFunction(zenith, 0, pi / 2, 128);

path arc = arc1 -- arc2 -- arc3 --  cycle;

filldraw(vec2.Origin.Circle(radius), default.light_gray_pen, default.thin_pen);
filldraw(arc, white, invisible);

draw(vec2.Origin.LineTo(point2), default.thin_dash_pen);
draw(point2.LineTo(point2_xy), default.thin_dash_pen);
draw(vec2.Origin.LineTo(point2_xy), default.thin_dash_pen);
draw(point2_xy.LineTo(point2_x), default.thin_dash_pen);
draw(point2_xy.LineTo(point2_y), default.thin_dash_pen);

draw(x_label, vec2.Origin.LineTo(xpt), default.sharp_arrow);
draw(y_label, vec2.Origin.LineTo(ypt), default.sharp_arrow);
draw(z_label, vec2.Origin.LineTo(zpt), default.sharp_arrow);
draw(az_curve, default.red_pen);
draw(equator, default.red_pen);

draw(zen_curve, default.blue_pen);
draw(left_bound, default.blue_pen);
draw(right_bound, default.blue_pen);

draw(theta_label, theta, default.thin_pen);
draw(phi_label, phi, default.thin_pen);

draw(vphi_label, point2.LineTo(vphi2), default.sharp_arrow);
draw(vtheta_label, point2.LineTo(vtheta2), default.sharp_arrow);
draw(vr_label, point2.LineTo(vr2), default.sharp_arrow);
