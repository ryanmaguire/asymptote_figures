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
 *      Draws a house and a store in the Cartesian plane.                     *
 ******************************************************************************/

import vec2;
import vec3;

import size_256_default_settings as default;

pen small_pen = default.thin_pen + fontsize(7pt);

vec2.Vec2 x = vec2.ProjectXYZ(2.0, 0.0, 0.0);
vec2.Vec2 y = vec2.ProjectXYZ(0.0, 2.0, 0.0);
vec2.Vec2 z = vec2.ProjectXYZ(0.0, 0.0, 1.0);

Label x_label = Label("$x$", position = 1.0, align = vec2.SouthWest.AsPair());
Label y_label = Label("$y$", position = 1.0, align = vec2.East.AsPair());
Label z_label = Label("$z$", position = 1.0, align = vec2.North.AsPair());

Label u_label = Label("$\mathbf{u}$", align = vec2.SouthWest.AsPair());
Label v_label = Label("$\mathbf{v}$", align = vec2.NorthWest.AsPair());
Label c_label = Label("$\mathbf{u}\times\mathbf{v}$", align = vec2.West.AsPair());


vec3.Vec3 u3 = vec3.Vec3(1.0, 1.0, 0.0);
vec3.Vec3 v3 = vec3.Vec3(0.0, 1.0, 0.1);

vec3.Vec3 sum = u3 + v3;
vec3.Vec3 cross = u3.Cross(v3);

vec3.Vec3 mid = vec3.Midpoint(u3, v3);

vec2.Vec2 u2 = vec2.ProjectXYZ(u3.x, u3.y, u3.z);
vec2.Vec2 v2 = vec2.ProjectXYZ(v3.x, v3.y, v3.z);

vec2.Vec2 sum2 = vec2.ProjectXYZ(sum.x, sum.y, sum.z);
vec2.Vec2 cross2 = vec2.ProjectXYZ(cross.x, cross.y, cross.z);
vec2.Vec2 mid2 = vec2.ProjectXYZ(mid.x, mid.y, mid.z);

vec2.Vec2[] parallelogram_points = {
    vec2.Origin, u2, sum2, v2
};

real start = u2.PolarAngle() * 180.0 / pi;
real end = v2.PolarAngle() * 180.0 / pi;

guide parallelogram = vec2.PolygonThroughPoints(parallelogram_points, true);

path uvec = vec2.Origin.LineTo(u2);
path vvec = vec2.Origin.LineTo(v2);
path cvec = vec2.Origin.LineTo(cross2);

path theta = vec2.Arc(vec2.Origin, 0.125, start, end);

draw(x_label, vec2.Origin.LineTo(x), default.sharp_arrow);
draw(y_label, vec2.Origin.LineTo(y), default.sharp_arrow);
draw(z_label, vec2.Origin.LineTo(z), default.sharp_arrow);

filldraw(parallelogram, default.light_gray_transparent_pen, default.thin_pen);

draw(u_label, uvec, default.thin_pen, default.sharp_arrow);
draw(v_label, vvec, default.thin_pen, default.sharp_arrow);
draw(c_label, cvec, default.thin_pen, default.sharp_arrow);

draw("$\theta$", theta, small_pen);

mid2.AddLabel("$\textrm{Area}=\|\mathbf{u}\times\mathbf{v}\|$", small_pen);
