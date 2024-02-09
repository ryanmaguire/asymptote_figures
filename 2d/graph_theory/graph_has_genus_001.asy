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
 *      Draws an oriented trefoil with unsigned Gauss code.                   *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Radius for the dots in the graph.                                         */
default.dot_radius = 0.02;

/*  Coordinates for the vertices of the graph.                                */
vec2.Vec2 V0 = vec2.Vec2(0.0, 0.0);
vec2.Vec2 V1 = vec2.Vec2(1.0, 0.0);
vec2.Vec2 V2 = vec2.Vec2(0.5, 1.0);
vec2.Vec2 V3 = vec2.Vec2(1.5, 1.0);
vec2.Vec2 V4 = vec2.Vec2(2.5, 1.0);

/*  Dots for the vertices of the graph.                                       */
V0.DrawDot(default.dot_radius);
V1.DrawDot(default.dot_radius);
V2.DrawDot(default.dot_radius);
V3.DrawDot(default.dot_radius);
V4.DrawDot(default.dot_radius);

/*  And draw the edges.                                                       */
draw(V0.LineTo(V2));
draw(V0.LineTo(V3));
draw(V0.LineTo(V4));
draw(V1.LineTo(V2));
draw(V1.LineTo(V3));
draw(V1.LineTo(V4));
