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
 *      Draw the planes representing the standard contact structure on R^3.   *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Variables for looping over points in the xy plane.                        */
real x, y;

/*  Start and end values for x and y values in the xy plane.                  */
real start = -2.0;
real end = -start;

/*  Size of the displacement in both the x and y axes.                        */
real ds = 1.0 / 6.0;

/*  Size of the displacement in the z-direction. Used for drawing planes.     */
real dz = 0.1;

/*  Function for drawing the plane representing the contact structure at the  *
 *  point (x, y, z). The is the kernel of dz - ydx = 0.                       */
void DrawRectangle(real a, real b, real c = 0.0)
{
    /*  The center of the rectangle is given by the input ordered triple.     */
    vec2.Vec2 center = vec2.ProjectXYZ(a, b, c);

    /*  Two orthogonal vectors in the kernel of the one-form dz - ydx are     *
     *  (1, 0, y) and (0, 1, 0). We'll use these as the basis vectors for our *
     *  plane containing the point (a, b, c).                                 */
    vec2.Vec2 dx1 = vec2.ProjectXYZ(ds, 0.0, y*dz);
    vec2.Vec2 dx2 = vec2.ProjectXYZ(0.0, ds, 0.0);

    /*  Four points defining the plane.                                       */
    vec2.Vec2 A0 = center + dx1 + dx2;
    vec2.Vec2 A1 = center + dx1 - dx2;
    vec2.Vec2 A2 = center - dx1 - dx2;
    vec2.Vec2 A3 = center - dx1 + dx2;

    /*  Array of points for the rectangle. Made from the previous values.     */
    vec2.Vec2 Rectangle[] = {A0, A1, A2, A3};

    /*  Give a gradient based on the y coordinate to give the illusion of a   *
     *  shadow being cast on the hyperplanes.                                 */
    real lambda = (y - start)/(end - start);
    pen grayp = gray(0.8*(1.0 - lambda) + 0.5*lambda);
    guide g = vec2.ClosedPolygonThroughPoints(Rectangle);

    /*  Draw in a parallelogram representing the plane.                       */
    filldraw(g, grayp);
}
/*  End of DrawRectangle.                                                     */

/*  Points for the axes and the origin.                                       */
vec2.Vec2 O = vec2.ProjectXYZ(0.0, 0.0, 0.0);
vec2.Vec2 X0 = vec2.ProjectXYZ(-3.0, 0.0, 0.0);
vec2.Vec2 X1 = vec2.ProjectXYZ(3.0, 0.0, 0.0);
vec2.Vec2 Y0 = vec2.ProjectXYZ(0.0, -3.0, 0.0);
vec2.Vec2 Y1 = vec2.ProjectXYZ(0.0, 3.0, 0.0);
vec2.Vec2 Z0 = vec2.ProjectXYZ(0.0, 0.0, -1.3);
vec2.Vec2 Z1 = vec2.ProjectXYZ(0.0, 0.0, 1.3);

/*  Draw the bottom half of the z axis. This way the planes will be drawn on  *
 *  top of it.                                                                */
draw(O.LineTo(Z0), default.thick_pen, default.sharp_arrow);

/*  Loop through points in the xy plane and draw the planes representing the  *
 *  contact structure at each point.                                          */
for (x = start; x <= end; x += 3.0*ds)
    for (y = start; y <= end; y += 3.0*ds)
        DrawRectangle(x, y);

/*  Draw the other axes and label them.                                       */
draw(X0 .LineTo(X1), default.thick_pen, sharp_arrow);
draw(Y0.LineTo(Y1), default.thick_pen, sharp_arrow);
draw(O.LineTo(Z1), default.thick_pen, sharp_arrow);
X1.AddLabel("$x$", W);
Y1.AddLabel("$y$", S);
Z1.AddLabel("$z$", E);
