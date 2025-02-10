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
 *      Visual aid for the idea of a subset using blobs in the plane.         *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

vec2.Vec2 point = vec2.Vec2(0.2, 0.3);
vec2.Vec2 b_label = vec2.Vec2(-0.5, 0.6);
real r0 = 1.0;
real r1 = 0.4;

filldraw(vec2.Origin.Circle(r0), default.blue_pen, defaultpen);
filldraw(point.Circle(r1), default.red_pen, defaultpen);

point.AddLabel("$A$");
b_label.AddLabel("$B$");
