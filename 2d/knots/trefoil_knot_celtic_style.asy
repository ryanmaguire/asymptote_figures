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
 *      Draws the trefoil knot in a Celtic-like form.                         *
 ******************************************************************************/

/*  Vec2 struct provided here.                                                */
import vec2;

/*  Default parameters for a size(512) drawing provided here.                 */
import size_512_default_settings as default;

/*  Colors for the flag of Ireland. Used for the knots outline and interior.  */
pen green_pen = rgb(0.08, 0.61, 0.38) + linewidth(7pt);
pen gold_pen = rgb(1.0, 0.51, 0.0);

/*  The arcs of the trefoil are produced from arcs of circles. These are the  *
 *  radii of the inner and outer circles.                                     */
real inner_radius = sqrt(3.0);
real outer_radius = 1.1 * inner_radius;

/*  Centers of the circles used to construct the arcs.                        */
vec2.Vec2 A = vec2.UnitVectorFromAngle(1.0 * pi / 6.0);
vec2.Vec2 B = vec2.UnitVectorFromAngle(5.0 * pi / 6.0);
vec2.Vec2 C = vec2.UnitVectorFromAngle(3.0 * pi / 2.0);

/*  The arcs for the first strand of the trefoil. Concatenates circle arcs.   */
guide gA0 = vec2.Arc(A, inner_radius, 237.0, 120.0);
guide gA1 = vec2.Arc(B, inner_radius, 60.0, 10.0);
guide gA2 = vec2.Arc(B, outer_radius, 6.0, 63.0);
guide gA3 = vec2.Arc(A, outer_radius, 128.0, 233.9);

/*  Concatenate the arcs.                                                     */
guide gA = gA0 -- gA1 -- gA2 -- gA3 -- cycle;

/*  The other strands are obtained by rotating the first one.                 */
guide gB = rotate(120.0) * gA;
guide gC = rotate(120.0) * gB;

/*  Draw the knot.                                                            */
filldraw(gA, gold_pen, green_pen);
filldraw(gB, gold_pen, green_pen);
filldraw(gC, gold_pen, green_pen);
