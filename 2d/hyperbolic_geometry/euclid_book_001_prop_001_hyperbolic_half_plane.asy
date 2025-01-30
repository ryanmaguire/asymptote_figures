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
import vec2;
import coordinate_axes as axes;
import circle;
import hyperbolic;
import size_512_default_settings as default;

real dot_radius = 0.025;

real xmin = -0.8;
real ymin = -0.8;
real xmax = 6.0;
real ymax = 6.0;

vec2.Vec2 A = vec2.Vec2(1.5, 1.0);
vec2.Vec2 B = vec2.Vec2(2.5, 2.0);

circle.Circle circleA = hyperbolic.HalfPlaneModelCircle(A, B);
circle.Circle circleB = hyperbolic.HalfPlaneModelCircle(B, A);

vec2.Vec2[] Intersections = circleA.Intersect(circleB);
vec2.Vec2 C = Intersections[1];

path g = hyperbolic.HalfPlaneTriangle(A, B, C);

circleA.Draw();
circleB.Draw();

filldraw(g, green, default.thin_pen);

axes.DrawCoordinateAxes(xmin, xmax, ymin, ymax);

A.DrawDot(dot_radius);
B.DrawDot(dot_radius);
C.DrawDot(dot_radius);

A.AddLabel("$A$", vec2.South);
B.AddLabel("$B$", vec2.East);
C.AddLabel("$C$", vec2.West);
