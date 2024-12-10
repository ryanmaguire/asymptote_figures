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

/*  Array for vertices.                                                       */
pair[] T, U, V, W;

/*  Variables for indexing.                                                   */
int n;

/*  Variable for the angle a point has on the circle.                         */
real theta;

/*  Value for the edge of the square.                                         */
real edge = 1.5;

/*  Variables for computing where certain lines hit the edge of the square.   */
real x0, x1, y0, dx, dy;

/*  Pairs for the square representing the torus.                              */
pair A = (-edge, -edge);
pair B = (edge, -edge);
pair C = (-edge, edge);
pair D = (edge, edge);

pair midpoint(pair A, pair B)
{
    return (0.5*(A.x + B.x), 0.5*(A.y + B.y));
}

/*  Create the vertices on the circle.                                        */
for (n = 0; n < 4; ++n)
{
    /*  Compute the angle of the current point.                               */
    theta = 0.5*pi*n;

    /*  And compute the position of the point.                                */
    V[n] = expi(theta);
    U[n] = scale(0.5) * V[n];
    W[n] = scale(1.0 / sqrt(2.0)) * expi(theta + 0.25 * pi);
    T[n] = scale(edge) * V[n];
}
/*  End of for loop computing the vertices.                                   */

V[4] = (0.0, 0.0);
dot(V[4]);

/*  Draw the edges.                                                           */
draw(V[0] -- V[4]);
draw(V[1] -- V[4]);
draw(V[2] -- V[4]);
draw(V[3] -- V[4]);
draw(V[0] -- V[1] -- V[2] -- V[3] -- cycle);

draw(V[0] -- (edge, 0.0));
draw((-edge, 0.0) -- V[2]);
draw(V[1] -- (0.0, edge));
draw((0.0, -edge) -- V[3]);

draw(U[0] -- U[1], blue);
draw(U[1] -- U[2], blue);
draw(U[2] -- U[3], blue);
draw(U[3] -- U[0], blue);

draw(U[0] -- W[0], blue);
draw(U[1] -- W[1], blue);
draw(U[2] -- W[2], blue);
draw(U[3] -- W[3], blue);

draw(U[1] -- W[0], blue);
draw(U[2] -- W[1], blue);
draw(U[3] -- W[2], blue);
draw(U[0] -- W[3], blue);

draw(T[0] -- W[0], blue);
draw(T[1] -- W[1], blue);
draw(T[2] -- W[2], blue);
draw(T[3] -- W[3], blue);

draw(T[1] -- W[0], blue);
draw(T[2] -- W[1], blue);
draw(T[3] -- W[2], blue);
draw(T[0] -- W[3], blue);

for (n = 0; n < 4; ++n)
{
    /*  Draw a dot indicating the vertex.                                     */
    filldraw(circle(V[n], 0.05), black, black);
    filldraw(circle(U[n], 0.05), white, black);
    filldraw(circle(W[n], 0.05), white, black);
    filldraw(circle(T[n], 0.05), white, black);
}

draw(A -- B, blue + linewidth(1.0));
draw(C -- D, blue + linewidth(1.0));
draw(A -- C, red + linewidth(1.0));
draw(B -- D, red + linewidth(1.0));

clip(A -- B -- D -- C -- cycle);


