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
 *      Draws the trefoil knot as an oriented knot diagram.                   *
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

/*  Draw in the arcs of the trefoil.                                          */
draw(graph(tref, -0.75, 1.29), default.mid_sharp_arrow);
draw(graph(tref, 1.35, 3.38), default.mid_sharp_arrow);
draw(graph(tref, 3.45, 5.48), default.mid_sharp_arrow);

label("$0$", (0.0, 2.7));
label("$1$", (1.2, -0.69));
label("$2$", (-2.3, -1.32));
label("$3$", (0.0, 1.4));
label("$4$", (2.3, -1.32));
label("$5$", (-1.2, -0.69));
