
/******************************************************************************
 *                                 LICENSE                                    *
 ******************************************************************************
 *  This file is part of Mathematics-and-Physics.                             *
 *                                                                            *
 *  Mathematics-and-Physics is free software: you can redistribute it and/or  *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  Mathematics-and-Physics is distributed in the hope that it will be useful *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with Mathematics-and-Physics.  If not, see                          *
 *  <https://www.gnu.org/licenses/>.                                          *
 ******************************************************************************/

/*  Needed for making the output a PDF file.                                  */
import settings;

/*  Used for drawing parametric equations.                                    */
import graph;

/*  PDF works best in LaTeX, so use this.                                     */
settings.outformat = "pdf";

/*  Size of the figure.                                                       */
size(256);

/*  Projection of the trefoil parameterization onto the xy plane.             */
pair tref(real t)
{
    real scale = 0.25;
    real x = 2.0*sin(2*t) - sin(t);
    real y = 2*cos(2*t)+cos(t);
    return (scale * x, scale * y);
}

/*  Draw in the arcs of the trefoil.                                          */
draw(graph(tref, -0.75, 1.29));
draw(graph(tref, 1.35, 3.38));
draw(graph(tref, 3.45, 5.48));

pair A = (-1.5, -1.5);
pair B = (-0.5, -1.5);
real rDot = 0.03;

pair A2 = (0.5, -1.5 - 0.5 * sqrt(0.75));
pair B2 = (1.5, -1.5 - 0.5 * sqrt(0.75));
pair C2 = (1.0, -1.5 + 0.5 * sqrt(0.75));

draw(A2 -- B2 -- C2 -- cycle, blue);

filldraw(circle(A2, rDot), grey, black);
filldraw(circle(B2, rDot), grey, black);
filldraw(circle(C2, rDot), grey, black);

draw(A -- B, red);
draw(A{N} .. B{S}, red);
draw(A{S} .. B{N}, red);

filldraw(circle(A, rDot), grey, black);
filldraw(circle(B, rDot), grey, black);
