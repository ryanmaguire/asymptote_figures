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
import smoothcontour3;
import graph3;
import three;
import vec2;
import parametric_curves as pc;
import vec3;
import circle;
import size_256_default_settings as default;

vec3.Vec3 A = vec3.FromSpherical(1.0, +pi/4, pi/2);
vec3.Vec3 B = vec3.FromSpherical(1.0, -pi/4, pi/2);
vec3.Vec3 U = vec3.Vec3(2.0, 0.0, 1.0);

real theta = -1.175;

vec2.Vec2 c1(real t)
{
    vec3.Vec3 P = vec3.SphericalCircle(t, 1.0, A, B);
    return vec3.OrthographicProjection(P, U).Rotate(theta);
}

vec2.Vec2 c2(real t)
{
    vec3.Vec3 P = vec3.SphericalCircle(t, 1.0, B, A);
    return vec3.OrthographicProjection(P, U).Rotate(theta);
}

guide q1 = pc.PathFromParametricFunction(c1, -2.2, 1, 100);
guide q2 = pc.PathFromParametricFunction(c2, -1, 2.2, 100);

vec2.Vec2 C1 = vec3.StereographicProjection(vec3.SphericalCircle(0.0, 1, A, B));
vec2.Vec2 C2 = vec3.StereographicProjection(vec3.SphericalCircle(0.5, 1, A, B));
vec2.Vec2 C3 = vec3.StereographicProjection(vec3.SphericalCircle(1.0, 1, A, B));

vec2.Vec2 D1 = vec3.StereographicProjection(vec3.SphericalCircle(0.0, 1, B, A));
vec2.Vec2 D2 = vec3.StereographicProjection(vec3.SphericalCircle(0.5, 1, B, A));
vec2.Vec2 D3 = vec3.StereographicProjection(vec3.SphericalCircle(1.0, 1, B, A));

vec2.Vec2 center_a = vec2.FindCenter(C1, C2, C3);
vec2.Vec2 center_b = vec2.FindCenter(D1, D2, D3);

real radius_a = center_a.DistanceTo(C1);
real radius_b = center_b.DistanceTo(D1);

circle.Circle circle_a = circle.Circle(center_a, radius_a);
circle.Circle circle_b = circle.Circle(center_b, radius_b);

vec2.Vec2[] intersections = circle_a.Intersect(circle_b);

vec3.Vec3 C = vec3.InverseStereographicProjection(intersections[1]);

vec2.Vec2 c3(real t)
{
    vec3.Vec3 P = GreatCircle(t, 1.0, A, B);
    return vec3.OrthographicProjection(P, U).Rotate(theta);
}

vec2.Vec2 c4(real t)
{
    vec3.Vec3 P =  GreatCircle(t, 1.0, B, C);
    return vec3.OrthographicProjection(P, U).Rotate(theta);
}

vec2.Vec2 c5(real t)
{
    vec3.Vec3 P =  GreatCircle(t, 1.0, C, A);
    return vec3.OrthographicProjection(P, U).Rotate(theta);
}

guide q3 = pc.PathFromParametricFunction(c3, 0, 1, 100);
guide q4 = pc.PathFromParametricFunction(c4, 0, 1, 100);
guide q5 = pc.PathFromParametricFunction(c5, 0, 1, 100);
guide g = q3 -- q4 -- q5 -- cycle;

vec2.Vec2 Aproj = c3(0.0);
vec2.Vec2 Bproj = c4(0.0);
vec2.Vec2 Cproj = c5(0.0);

radialshade(
    vec2.Origin.Circle(1.0),
    gray(0.6),
    vec2.Origin.AsPair(),
    1.0,
    gray(0.9),
    vec2.Origin.AsPair(),
    0.6
);

q1 = q1;
q2 = q2;
g = g;

draw(q1, default.blue_pen);
draw(q2, default.red_pen);
filldraw(g, green, black);

Aproj.DrawDot(0.015);
Bproj.DrawDot(0.015);
Cproj.DrawDot(0.015);

Aproj.AddLabel("$A$", vec2.SouthWest);
Bproj.AddLabel("$B$", vec2.SouthEast);
Cproj.AddLabel("$C$", vec2.North);
