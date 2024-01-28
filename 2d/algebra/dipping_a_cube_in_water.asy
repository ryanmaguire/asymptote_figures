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
 *      Draws the intersection of a plane with a cube, revealing a hexagon.   *
 *      This is what you'd get if you dipped a cube into water with one of    *
 *      vertices of the cube facing down.                                     *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Coordinates for all of the points in the cube.                            */
vec2.Vec2 O = vec2.ProjectXYZ(0, 0, 0);
vec2.Vec2 x = vec2.ProjectXYZ(6, 0, 0);
vec2.Vec2 y = vec2.ProjectXYZ(0, 6, 0);
vec2.Vec2 z = vec2.ProjectXYZ(0, 0, 6);

/*  Halfway points for the three coordinate vectors.                          */
vec2.Vec2 half_x = 0.5*x;
vec2.Vec2 half_y = 0.5*y;
vec2.Vec2 half_z = 0.5*z;

/*  Projections are linear, so sums in R^3 map to sums in R^2.                */
vec2.Vec2 xy = x + y;
vec2.Vec2 xz = x + z;
vec2.Vec2 yz = y + z;
vec2.Vec2 xyz = xy + z;

/*  Similarly scalar multiplications carry over too.                          */
vec2.Vec2 half_xy = 0.5*xy;
vec2.Vec2 half_xz = 0.5*xz;
vec2.Vec2 half_yz = 0.5*yz;
vec2.Vec2 mid = 0.5*xyz;

/*  Half-way points, which can be computed with addition and multiplication.  */
vec2.Vec2 a1 = half_x + z;
vec2.Vec2 a2 = half_x + yz;
vec2.Vec2 a3 = half_y + z;
vec2.Vec2 a4 = half_y + xz;

vec2.Vec2 b1 = half_z;
vec2.Vec2 b2 = half_z + x;
vec2.Vec2 b3 = a1;
vec2.Vec2 b4 = half_x;

vec2.Vec2 c1 = b2;
vec2.Vec2 c2 = half_z + xy;
vec2.Vec2 c3 = a4;
vec2.Vec2 c4 = half_y + x;

vec2.Vec2 d1 = half_z + y;
vec2.Vec2 d2 = c2;
vec2.Vec2 d3 = a2;
vec2.Vec2 d4 = half_x + y;

vec2.Vec2 e1 = a3;
vec2.Vec2 e2 = half_y;
vec2.Vec2 e3 = b1;
vec2.Vec2 e4 = d1;

vec2.Vec2 f1 = e2;
vec2.Vec2 f2 = c4;
vec2.Vec2 f3 = b4;
vec2.Vec2 f4 = d4;

vec2.Vec2 A = half_xy + z;
vec2.Vec2 B = half_xz;
vec2.Vec2 C = half_yz + x;
vec2.Vec2 D = half_xz + y;
vec2.Vec2 E = half_yz;
vec2.Vec2 F = half_xy;

/*  Draw the back of the cube.                                                */
draw(O.LineTo(x), default.dash_pen);
draw(O.LineTo(y), default.dash_pen);
draw(O.LineTo(z), default.dash_pen);

/*  Lines that make crosses on each of the outer faces.                       */
draw(a1.LineTo(a2));
draw(a3.LineTo(a4));
draw(c1.LineTo(c2));
draw(c3.LineTo(c4));
draw(d1.LineTo(d2));
draw(d3.LineTo(d4));

/*  Dashed lines that make crosses on each of the inner faces.                */
draw(b1.LineTo(b2), default.dash_pen);
draw(b3.LineTo(b4), default.dash_pen);
draw(e1.LineTo(e2), default.dash_pen);
draw(e3.LineTo(e4), default.dash_pen);
draw(f1.LineTo(f2), default.dash_pen);
draw(f3.LineTo(f4), default.dash_pen);

/*  Dashed lines on the inside of the cube connecting the centers of the      *
 *  faces to the center of the cube.                                          */
draw(A.LineTo(mid), default.dash_pen);
draw(B.LineTo(mid), default.dash_pen);
draw(C.LineTo(mid), default.dash_pen);
draw(D.LineTo(mid), default.dash_pen);
draw(E.LineTo(mid), default.dash_pen);
draw(F.LineTo(mid), default.dash_pen);

/*  Draw the hexagon.                                                         */
draw(a1.LineTo(a3), default.blue_pen);
draw(a3.LineTo(d1), default.blue_dash_pen);
draw(d1.LineTo(d4), default.blue_pen);
draw(d4.LineTo(c4), default.blue_dash_pen);
draw(c4.LineTo(b2), default.blue_pen);
draw(b2.LineTo(a1), default.blue_dash_pen);

/*  Draw the spokes of the hexagon.                                           */
draw(a1.LineTo(mid), default.green_dash_pen);
draw(a3.LineTo(mid), default.green_dash_pen);
draw(d1.LineTo(mid), default.green_dash_pen);
draw(c4.LineTo(mid), default.green_dash_pen);
draw(d4.LineTo(mid), default.green_dash_pen);
draw(b2.LineTo(mid), default.green_dash_pen);

/*  Draw the front of the cube.                                               */
draw(x.LineTo(xy));
draw(y.LineTo(xy));
draw(x.LineTo(xz));
draw(z.LineTo(xz));
draw(y.LineTo(yz));
draw(z.LineTo(yz));
draw(xy.LineTo(xyz));
draw(yz.LineTo(xyz));
draw(xz.LineTo(xyz));
