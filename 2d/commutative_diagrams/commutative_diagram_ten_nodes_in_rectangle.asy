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
 *      This draws a large commutative diagram featuring 10 vertices arranged *
 *      in two rows. This could be used, for example, to demonstrate the      *
 *      the Five-Lemma that occurs in homological algebra.                    *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Variable used for indexing.                                               */
int n;

/*  The number of nodes to draw.                                              */
int number_of_nodes = 5;

/*  Shift factor for drawing the squares in the diagram.                      */
vec2.Vec2 xshift = vec2.Vec2(2.0, 0.0);

/*  Points for the final nodes in the drawing. Not drawn in the for-loop.     */
vec2.Vec2 AF = vec2.Vec2(2.0 * number_of_nodes, 2.0);
vec2.Vec2 BF = vec2.Vec2(2.0 * number_of_nodes, 0.0);

/*  The final node as a string.                                               */
string Ns = string(number_of_nodes);
string fN = "$f_{" + Ns + "}$";

/*  Loop over all of the points and label various functions and nodes.        */
for (n = 1; n < number_of_nodes; ++n)
{
    /*  Compute the new points for this part of the for-loop.                 */
    vec2.Vec2 A = vec2.Vec2(2.0*n, 2.0);
    vec2.Vec2 B = vec2.Vec2(2.0*n, 0.0);
    vec2.Vec2 C = A + xshift;
    vec2.Vec2 D = B + xshift;

    /*  Convert the current index to a string for the labels.                 */
    string ns = string(n);

    /*  The three labels for the functions.                                   */
    string fn = "$f_{" + ns + "}$";
    string gn = "$g_{" + ns + "}$";
    string hn = "$h_{" + ns + "}$";

    /*  Draw arrows and label the functions between these nodes.              */
    draw(fn, A.LineTo(B), E, default.sharp_arrow, default.small_margins);
    draw(gn, A.LineTo(C), S, default.sharp_arrow, default.small_margins);
    draw(hn, B.LineTo(D), N, default.sharp_arrow, default.small_margins);

    /*  Label the actual nodes.                                               */
    A.AddLabel("$A_{" + ns + "}$");
    B.AddLabel("$B_{" + ns + "}$");
}
/*  End of for-loop drawing all but the last two nodes.                       */

/*  Label and draw the final nodes.                                           */
draw(fN, AF.LineTo(BF), E, default.sharp_arrow, default.small_margins);
AF.AddLabel("$A_{" + Ns + "}$");
BF.AddLabel("$B_{" + Ns + "}$");
