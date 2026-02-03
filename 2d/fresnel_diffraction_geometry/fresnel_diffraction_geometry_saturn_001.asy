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
 *      Depicts the geometry of a radio occultation even for the rings of     *
 *      Saturn by Cassini. Used in Fresnel inversion with the RSS data.       *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

thin_pen = default.thin_pen + fontsize(14.0pt);

void DrawEye(vec2.Vec2 anchor, real length, real angle)
{
    pen skin_color = RGB(254, 227, 212);
    pen eye_color = RGB(144, 213, 255);
    real angle_degrees = angle * 180.0 / pi;
    vec2.Vec2 bottom = anchor + vec2.FromPolar(length, angle - pi / 4.0);
    vec2.Vec2 top = anchor + vec2.FromPolar(length, angle + pi / 4.0);

    vec2.Vec2[] triangle = {
        anchor, bottom, top
    };

    int n;
    int number_of_lashes = 4;
    real dtheta0 = 16.0 * pi / (180.0 * (number_of_lashes - 1));
    real theta0 = angle - pi / 90.0 + pi / 4.0;

    real dtheta1 = 11.0 * pi / (180.0 * (number_of_lashes - 1));
    real theta1 = angle + pi / 90.0 - pi / 4.0;

    real small = 0.125 * length;
    real mid = 0.25 * length;
    real big = 0.5 * length;

    vec2.Vec2 pupil = anchor + vec2.FromPolar(length - small, angle);
    vec2.Vec2 iris = anchor + vec2.FromPolar(length - mid, angle);

    real start_angle = -45.0 + angle_degrees;
    real end_angle = 45.0 + angle_degrees;

    guide round_edge = vec2.Arc(anchor, length, start_angle, end_angle);
    guide bottom_edge = anchor.LineTo(bottom);
    guide top_edge = anchor.LineTo(top);

    path pupil_path = pupil.Ellipse(small, mid, angle_degrees);
    path iris_path = iris.Ellipse(mid, big, angle_degrees);

    real top_angle = end_angle - 20.0;
    real bottom_angle = start_angle + 15.0;

    guide bottom_lid_edge = vec2.Arc(anchor, length, start_angle, bottom_angle);
    guide bottom_lid = bottom_edge -- bottom_lid_edge -- cycle;

    guide top_lid_edge = vec2.Arc(anchor, length, end_angle, top_angle);
    guide top_lid = top_edge -- top_lid_edge -- cycle;

    filldraw(vec2.ClosedPolygonThroughPoints(triangle), white, invisible);

    filldraw(iris_path, eye_color, black);
    filldraw(pupil_path, black, black);
    filldraw(bottom_lid, skin_color, default.thin_pen);
    filldraw(top_lid, skin_color, default.thin_pen);

    for (n = 0; n < number_of_lashes; ++n)
    {
        real top_lash_angle = theta0 - n * dtheta0;
        vec2.Vec2 top_shift = vec2.FromPolar(length, top_lash_angle);
        vec2.Vec2 top_lash_start = anchor + top_shift;
        vec2.Vec2 top_lash_end = anchor + 1.175 * top_shift;

        draw(top_lash_start.LineTo(top_lash_end), default.thin_pen);
    }

    for (n = 0; n < number_of_lashes; ++n)
    {
        real bottom_lash_angle = theta1 + n * dtheta1;
        vec2.Vec2 bottom_shift = vec2.FromPolar(length, bottom_lash_angle);
        vec2.Vec2 bottom_lash_start = anchor + bottom_shift;
        vec2.Vec2 bottom_lash_end = anchor + 1.125 * bottom_shift;

        draw(bottom_lash_start.LineTo(bottom_lash_end), default.thin_pen);
    }
}

void DrawSaturn(vec2.Vec2 core, real scale)
{
    pen planet_color = RGB(197, 171, 110);

    real planet_radius = 1.0 * scale;
    real ring_inner_radius = 1.5 * scale;
    real ring_outer_radius = 3.0 * scale;

    transform tilt = scale(1.0, 0.30);

    path equator1 = tilt * vec2.Arc(core, planet_radius, 180.0, 360.0);
    path equator2 = tilt * vec2.Arc(core, planet_radius, 0.0, 180.0);

    path inner_ring = tilt * vec2.Arc(core, ring_inner_radius, 51.25, -231.25);
    path left_arc = vec2.Arc(core, planet_radius, 159.25, 117.25);
    path outer_ring = tilt * vec2.Arc(core, ring_outer_radius, 98.75, 441.25);
    path right_arc = vec2.Arc(core, planet_radius, 62.75, 20.75);

    path ring = inner_ring -- left_arc -- outer_ring -- right_arc -- cycle;

    core.FillDrawCircle(planet_radius, planet_color);

    draw(equator1);
    draw(equator2, default.dash_pen);

    filldraw(ring, default.light_gray_pen);
}

guide ArcForAngle(vec2.Vec2 O, vec2.Vec2 P, vec2.Vec2 Q, real radius)
{
    real degrees_per_radian = 180.0 / pi;
    vec2.Vec2 OP = P - O;
    vec2.Vec2 OQ = Q - O;

    real OP_angle = OP.PolarAngle() * degrees_per_radian;
    real OQ_angle = OQ.PolarAngle() * degrees_per_radian;

    if (OP_angle - OQ_angle > 180.0)
        OQ_angle += 360.0;
    else if (OQ_angle - OP_angle > 180.0)
        OP_angle += 360.0;

    return vec2.Arc(O, radius, OP_angle, OQ_angle);
}

vec2.Vec2 core = vec2.Origin;
vec2.Vec2 z_max = vec2.Vec2(0.0, 1.5);
vec2.Vec2 x_max = vec2.Vec2(-2.25, -0.75);
vec2.Vec2 y_max = x_max.Rotate(pi - 2.0 * x_max.PolarAngle());

vec2.Vec2 earth_dir = x_max.AsUnitNormal();

vec2.Vec2 rho = vec2.Vec2(-0.65, -0.65);

vec2.Vec2 rho0 = vec2.Vec2(1.0, -0.75);
vec2.Vec2 rho0_perturb = rho0 + 0.35 * earth_dir;

real eye_scale = 0.5;
vec2.Vec2 eye = rho0 + 5.0 * earth_dir + 2.0 * vec2.North;
real eye_angle = (rho0 - eye).PolarAngle();
vec2.Vec2 eye_edge = eye + vec2.FromPolar(eye_scale, eye_angle);

DrawSaturn(core, 1.0);

draw(Label("$x$", position = 1.0), core.LineTo(x_max), default.sharp_arrow);
draw(Label("$y$", position = 1.0), core.LineTo(y_max), default.sharp_arrow);
draw(Label("$z$", position = 1.0), core.LineTo(z_max), default.sharp_arrow);

DrawEye(eye, eye_scale, eye_angle);

draw("$D$", eye_edge.LineTo(rho0), default.thin_pen);
draw(rho0_perturb.LineTo(rho0), default.thin_pen);

draw("$B$", ArcForAngle(rho0, eye, rho0_perturb , 0.27), thin_pen);
draw(Label("$\rho_{0}$", position = 0.22), rho0.LineTo(core), thin_pen);
draw("$\phi_{0}$", ArcForAngle(core, x_max, rho0, 0.07), thin_pen);

draw(Label("$\rho$", position = 0.92), core.LineTo(rho), thin_pen);
draw("$\phi$", ArcForAngle(core, x_max, rho, 0.22), thin_pen);

rho0.DrawDot(default.dot_radius);
rho.DrawDot(default.dot_radius);

rho0.AddLabel("$(\rho_{0},\,\phi_{0})$", vec2.NorthEast, thin_pen);
rho.AddLabel("$(\rho,\,\phi)$", vec2.SouthEast, thin_pen);

draw("$\mathbf{R}_{c}$", core.LineTo(eye_edge), thin_pen);
