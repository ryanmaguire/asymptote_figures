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
import vec3;
import size_256_default_settings as default;

currentprojection = perspective(
    camera = (100, 50, 20),
    up = (0, 0, 1),
    target = (0,  0,  0),
    zoom = 0.85
);

vec3.Vec3 A = vec3.FromSpherical(1.0, 0.0, 0.5 * pi);
vec3.Vec3 B = vec3.FromSpherical(1.0, 0.75 * pi, 8.5 * pi);

vec3.Vec3 c1(real t){return SphericalCircle(t, 1.0, A, B);}
vec3.Vec3 c2(real t){return SphericalCircle(t, 1.0, B, A);}

real dot_radius = 0.08;

material blob = material(
    diffusepen = gray(0.7) + opacity(0.5),
    emissivepen = gray(0.2),
    specularpen = gray(0.2)
);

material orb = material(
    diffusepen = blue+lightgreen,
    emissivepen = gray(0.5),
    specularpen = gray(0.5)
);

surface s = scale(dot_radius, dot_radius, dot_radius) * unitsphere;

draw(unitsphere, surfacepen = blob, render(merge = true));

draw(shift(A.AsTriple())*s, surfacepen = orb, render(merge = true));
draw(shift(B.AsTriple())*s, surfacepen = orb, render(merge = true));

draw(vec3.ParametricCurve(c1, -pi, pi, 128, closed = true), default.blue_pen);
draw(vec3.ParametricCurve(c2, -pi, pi, 128, closed = true), default.blue_pen);
