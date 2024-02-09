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
 *      Draws an oriented trefoil (mirror) with unsigned Gauss code.          *
 ******************************************************************************/

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

/*  Used for drawing parametric equations.                                    */
import graph;

/*  Projection of the trefoil parameterization onto the xy plane.             */
pair tref(real t)
{
    return (2*sin(2*t)-sin(t), 2*cos(2*t)+cos(t));
}

/*  Size of arrow heads.                                                      */
real arsize = 5bp;

/*  Parameters for the labels.                                                */
real r = 1.4;
real a = pi/4.0;
real b = a + 2.0*pi/3.0;
real c = b + 2.0*pi/3.0;
real rDot = 0.05;

/*  Draw in the arcs of the trefoil.                                          */
draw(graph(tref, -1.29, 0.75), default.mid_sharp_arrow);
draw(graph(tref, 0.8, 2.85), default.mid_sharp_arrow);
draw(graph(tref, 2.9, 4.94), default.mid_sharp_arrow);
filldraw(circle(tref(pi), rDot), black, black);

/*  Label the crossings.                                                      */
label("$0$", scale(r)*tref(a));
label("$2$", scale(r)*tref(b));
label("$1$", scale(r)*tref(c));
label("start", scale(1.3)*tref(pi));
label("O0 U1 O2 U0 O1 U2", (0.0, -2.8));

