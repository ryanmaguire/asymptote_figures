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

/*  Size of the figure.                                                       */
size(128);

/*  Coordinates for the vertices of the graph.                                */
pair V0 = (0.0, 0.0);
pair V1 = (1.0, 0.0);
pair V2 = (0.5, 1.0);
pair V3 = (1.5, 1.0);
pair V4 = (2.5, 1.0);

/*  Radius of dots.                                                           */
real rDot = 0.03;

/*  Dots for the vertices of the graph.                                       */
filldraw(circle(V0, rDot));
filldraw(circle(V1, rDot));
filldraw(circle(V2, rDot));
filldraw(circle(V3, rDot));
filldraw(circle(V4, rDot));

/*  And draw the edges.                                                       */
draw(V0 -- V2);
draw(V0 -- V3);
draw(V0 -- V4);
draw(V1 -- V2);
draw(V1 -- V3);
draw(V1 -- V4);
