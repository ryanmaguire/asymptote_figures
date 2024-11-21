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
 *      Visual representing complex conjugate and modulus.                    *
 ******************************************************************************/

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Basic complex number struct provided here.                                */
import complex;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Needed to use the "mathbb" font in LaTeX.                                 */
texpreamble("\usepackage{amssymb}");

/*  A point for the origin and where the label for the plane will be.         */
complex.Complex O = complex.Complex(0.0, 0.0);
complex.Complex C = complex.Complex(2.0, 2.0);

/*  The complex number under consideration, and it's conjugate.               */
complex.Complex Z = complex.Complex(3.6, 1.6);
complex.Complex ZBar = Z.Conjugate();

/*  The label for the modulus is placed half-way up the line to Z.            */
complex.Complex HalfZ = 0.5 * Z;

/*  Points specifying the coordinate axes and grid lines.                     */
real x_start = -1.4;
real x_end = 4.9;
real y_start = -2.9;
real y_end = 2.9;

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelCoordinateAxesWithGridLines(
    x_start,
    x_end,
    y_start,
    y_end,
    y_suffix = "i",
    x_string = "\textrm{Re}(z)",
    y_string = "\textrm{Im}(z)"
);

/*  Draw lines representing the point Z and it's conjugate.                   */
draw(O.LineTo(Z));
draw(O.LineTo(ZBar));

/*  Draw dashed lines representing the projections of Z and Z bar.            */
draw(Z.LineTo(Z.RealProjection()), default.thin_dash_pen);
draw(ZBar.LineTo(ZBar.RealProjection()), default.thin_dash_pen);
draw(Z.LineTo(Z.ImagProjection()), default.thin_dash_pen);
draw(ZBar.LineTo(ZBar.ImagProjection()), default.thin_dash_pen);

/*  Add filled in circles to mark the two points, Z and Z bar.                */
Z.DrawDot(default.dot_radius);
ZBar.DrawDot(default.dot_radius);

/*  Label Z, Z bar, the modulus |z|, and the complex plane C.                 */
Z.AddLabel("$z=(x,\,y)$", vec2.North);
ZBar.AddLabel("$\bar{z}=(x,\,-y)$", vec2.South);
HalfZ.AddLabel("$|z|$", vec2.North);
C.AddLabel("$\mathbb{C}$");
