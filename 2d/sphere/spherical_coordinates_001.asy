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

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Pen for the sphere and the projection onto the plane.                     */
pen transparent_pen = default.gray_dash_pen + opacity(0.5);

/*  The radius for the sphere, which hovers slightly above the plane below.   */
real radius = 2.0;

/*  Most arrows have labels positioned at the end, one has a label halfway.   */
real end_pos = 1.0;
real mid_pos = 0.5;

/*  The sphere hovers above the plane to make the projection easier to see.   */
real floor_height = -4.2;

/*  This point acts as the center, or origin, of the xy plane.                */
vec2.Vec2 floor = vec2.Vec2(0.0, floor_height);

/*  The xyz-coordinate system is centered in the sphere, not the plane.       *
 *  Create three vectors so we may draw the coordinate axes.                  */
vec2.Vec2 x = vec2.ProjectXYZ(1.25 * radius, 0.0, 0.0);
vec2.Vec2 y = vec2.ProjectXYZ(0.0, 1.25 * radius, 0.0);
vec2.Vec2 z = vec2.ProjectXYZ(0.0, 0.0, 1.25 * radius);

vec2.Vec2 p = vec2.ProjectXYZ(0.5 * radius, 0.5 * radius, sqrt(0.5) * radius);
vec2.Vec2 zenith_p = vec2.ProjectXYZ(0.0, 0.0, sqrt(0.5) * radius);
vec2.Vec2 azimuth_p = vec2.ProjectXYZ(0.5 * radius, 0.5 * radius, 0.0);
vec2.Vec2 azimuth_p_x = vec2.ProjectXYZ(0.5 * radius, 0.0, 0.0);
vec2.Vec2 azimuth_p_y = vec2.ProjectXYZ(0.0, 0.5 * radius, 0.0);

real theta = p.PolarAngle() * 180.0 / pi;
real phi = azimuth_p.PolarAngle() * 180.0 / pi;
path equator = scale(1.0, 0.41) * vec2.Arc(vec2.Origin, radius, 180, 360);

/*  Create labels for the coordinate axes that describe the sphere.           */
Label x_label = Label("$x$", end_pos, align = vec2.SouthWest.AsPair());
Label y_label = Label("$y$", end_pos, align = vec2.East.AsPair());
Label z_label = Label("$z$", end_pos, align = vec2.North.AsPair());

/*  Draw the coordinate system for the sphere, which is in xyz-space.         */
filldraw(vec2.Origin.Circle(radius), default.light_gray_pen, default.thin_pen);
draw(equator, default.thin_pen);

draw(x_label, vec2.Origin.LineTo(x), default.sharp_arrow);
draw(y_label, vec2.Origin.LineTo(y), default.sharp_arrow);
draw(z_label, vec2.Origin.LineTo(z), default.sharp_arrow);
draw(vec2.Origin.LineTo(p), default.sharp_arrow);
draw(p.LineTo(azimuth_p), default.thin_dash_pen);
draw(p.LineTo(zenith_p), default.thin_dash_pen);
draw(azimuth_p.LineTo(azimuth_p_x), default.thin_dash_pen);
draw(azimuth_p.LineTo(azimuth_p_y), default.thin_dash_pen);
draw(vec2.Origin.LineTo(azimuth_p), default.thin_dash_pen);

draw("$\theta$", vec2.Arc(vec2.Origin, 0.25, theta, 90.0), default.thin_pen);
draw("$\phi$", vec2.Arc(vec2.Origin, 0.125, -135, phi), default.thin_pen);

p.AddLabel("$\mathbf{p}$", vec2.NorthEast);
