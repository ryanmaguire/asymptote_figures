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

/*  PDF is easiest to use in LaTeX, so use that.                              */
import settings;
settings.outformat = "pdf";

/*  Size of the figure.                                                       */
size(128);

/*  Size of the arrowhead.                                                    */
real arsize = 5bp;

/*  Points for the square.                                                    */
pair A = (0.0, 0.0);
pair B = (1.0, 0.0);
pair C = (1.0, 1.0);
pair D = (0.0, 1.0);

/*  Positions for the arrows.                                                 */
position pos1 = 0.47;
position pos2 = 0.57;

/*  Draw the square.                                                          */
draw("$a$", A -- B, S, MidArrow(arsize));
draw("$a$", D -- C, N, MidArrow(arsize));
draw("$b$", B -- C, E, Arrow(arsize, pos1), Arrow(arsize, pos2));
draw("$b$", A -- D, W, Arrow(arsize, pos1), Arrow(arsize, pos2));
