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
vec2.Vec2 x = vec2.Vec2(-1.85, -1.85);
vec2.Vec2 y = vec2.Vec2(+3.00, +0.00);
vec2.Vec2 z = vec2.Vec2(+0.00, +3.00);

/*  The northern hemisphere is labeled "U". The label is anchored here.       */
vec2.Vec2 label_point = vec2.Vec2(1.0, 1.0);

/*  We will similarly draw coordinate axes for the xy plane below. Provide    *
 *  points specifying the ends of these coordinate arrows.                    */
vec2.Vec2 y_floor_bottom = vec2.Vec2(-1.0, floor_height - 1.0);
vec2.Vec2 y_floor_top = vec2.Vec2(+1.0, floor_height + 1.0);

vec2.Vec2 x_floor_left = vec2.Vec2(-3.0, floor_height);
vec2.Vec2 x_floor_right = vec2.Vec2(+3.0, floor_height);

/*  The last pair of points we need is used to draw the projection arrow,     *
 *  which goes from the sphere to the plane below.                            */
vec2.Vec2 z_proj_top = vec2.Vec2(0.0, floor_height + 2.0);
vec2.Vec2 z_proj_bottom = vec2.Vec2(0.0, floor_height + 1.0);

/*  These paths describe the northern hemisphere of the sphere, with the      *
 *  equator as the lower boundary, and a circular arc as the top boundary.    */
path equator = scale(1.0, 0.41) * vec2.Arc(vec2.Origin, radius, 180, 360);
path northern_arc = vec2.Arc(vec2.Origin, radius, 0, 180);
path northern_hemisphere = equator -- northern_arc -- cycle;

/*  Create labels for the coordinate axes that describe the sphere.           */
Label x_label = Label("$x$", end_pos, align = vec2.SouthWest.AsPair());
Label y_label = Label("$y$", end_pos, align = vec2.East.AsPair());
Label z_label = Label("$z$", end_pos, align = vec2.North.AsPair());

/*  Create labels for the coordinate axes that describe the lower plane.      */
Label x_floor_label = Label("$x$", end_pos, align = vec2.East.AsPair());
Label y_floor_label = Label("$y$", end_pos, align = vec2.SouthWest.AsPair());

/*  And lastly, create a label describing the projection onto the plane.      */
Label z_proj_label = Label("$\pi_{z}$", mid_pos, align = vec2.East.AsPair());

/*  Draw the coordinate system for the sphere, which is in xyz-space.         */
draw(x_label, vec2.Origin.LineTo(x), default.sharp_arrow);
draw(y_label, vec2.Origin.LineTo(y), default.sharp_arrow);
draw(z_label, vec2.Origin.LineTo(z), default.sharp_arrow);

/*  Fill in the northern hemisphere, this is the part that is projected.      */
filldraw(northern_hemisphere, transparent_pen, nullpen);

/*  We consider the northern hemisphere as an open subset, and hence it does  *
 *  not contain the boundary (which is the equator). Draw this with a dashed  *
 *  curve to indicate it is not part of the set.                              */
draw(equator, default.gray_dash_pen);

/*  The outer boundaries for the southern hemisphere and northern hemisphere  *
 *  can be drawn with a solid curve, which is a pefect circle. Draw this.     */
draw(vec2.Origin.Circle(radius), default.thin_pen);

/*  Label the open set, which is the northern hemisphere.                     */
label_point.AddLabel("$\mathcal{U}_{z}^{+}$");

/*  Next, draw the projection arrow from the sphere to the plane.             */
draw(z_proj_label, z_proj_top.LineTo(z_proj_bottom), default.sharp_arrow);

/*  Draw the coordinate axes for the plane below the sphere.                  */
draw(x_floor_label, x_floor_left.LineTo(x_floor_right), default.sharp_arrow);
draw(y_floor_label, y_floor_top.LineTo(y_floor_bottom), default.sharp_arrow);

/*  Since the camera is tilted, the projection of the equator onto the plane  *
 *  forms an ellipse. Since the equator is not included in the open set (the  *
 *  the northern hemisphere), the boundary of this ellipse is not included in *
 *  the projection. Fill in a gray ellipse with a dashed boundary.            */
filldraw(floor.Ellipse(1.8, 0.72), transparent_pen, default.thin_dash_pen);
