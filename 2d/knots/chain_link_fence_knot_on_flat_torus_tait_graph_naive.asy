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

/*  PDF works best in LaTeX, so use this.                                     */
import settings;
settings.outformat = "pdf";

/*  Size of the figure.                                                       */
size(128);

/*  Value for the edge of the square.                                         */
real edge = 1.5;

/*  Coordinates for the link.                                                 */
real r = 0.04;

pair P0 = (-edge, 0.0);
pair P1 = (0.0, edge);
pair P2 = (edge, 0.0);
pair P3 = (0.0, -edge);

pair A = (0.3*edge, -0.3*edge);
pair B = scale(-1.0)*A;

pair C = (-0.4*edge, -0.4*edge);
pair D = scale(-1.0)*C;

/*  Pairs for the square representing the torus.                              */
pair V0 = (-edge, -edge);
pair V1 = (edge, -edge);
pair V2 = (-edge, edge);
pair V3 = (edge, edge);

/*  Draw in lines to indicate the square.                                     */
draw(V0 -- V1, black + linewidth(1.2));
draw(V2 -- V3, black + linewidth(1.2));
draw(V0 -- V2, black + linewidth(1.2));
draw(V1 -- V3, black + linewidth(1.2));


/*  Draw in the link.                                                         */
draw(P0{SE} .. A{NE});
filldraw(circle(C, r), white, white);
draw(P2{NW} .. B .. P3{SE});
filldraw(circle(D, r), white, white);
draw(A{NE} .. P1{NW});

draw(V0 -- V3, red);
draw(V1 .. C .. V2, blue);
draw(V1 .. D .. V2, blue);
filldraw(circle((0.0, 0.0), 0.05), black, black);


filldraw(circle(V0, 0.1), black, black);
filldraw(circle(V1, 0.1), black, black);
filldraw(circle(V2, 0.1), black, black);
filldraw(circle(V3, 0.1), black, black);
clip(V0 -- V1 -- V3 -- V2 -- cycle);
