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

/*  Make sure custom_arrows.asy is in your path. This file is found in the    *
 *  asymptote/ folder of this project. You'll need to edit the                *
 *  ASYMPTOTE_DIR environment variable to include this.                       */
import custom_arrows;

/*  Size of the output figure.                                                */
size(256);

/*  Pens used throughout the drawing.                                         */
pen graypen = gray(0.7) + linewidth(0.4pt);
pen outlinepen = deepblue + linewidth(0.6pt);
pen Afill = green + opacity(0.8);
pen Bfill = red + opacity(0.8);
pen Cfill = cyan + opacity(0.8);
pen Dfill = yellow + opacity(0.8);
pen fpen = black + fontsize(5pt);

/*  Variables used for making the grid.                                       */
int n;
int nx = 13;
int ny = 5;
int shift = 16;

/*  The bigger triangle.                                                      */
pair A1 = (0.0, 0.0);
pair A2 = (8.0, 0.0);
pair A3 = (8.0, 3.0);

/*  Smaller triangle.                                                         */
pair B1 = A3;
pair B2 = (13.0, 3.0);
pair B3 = (13.0, 5.0);

/*  Top tetris piece below smaller triangle.                                  */
pair C1 = A3;
pair C2 = B2;
pair C3 = (13.0, 2.0);
pair C4 = (10.0, 2.0);
pair C5 = (10.0, 1.0);
pair C6 = (8.0, 1.0);

/*  Bottom tetris piece below smaller triangle.                               */
pair D1 = A2;
pair D2 = (13.0, 0.0);
pair D3 = C3;
pair D4 = C4;
pair D5 = C5;
pair D6 = C6;

/*  Create the background grid.                                               */
for (n = 0; n <= nx + shift; ++n)
    draw((n, -0.5) -- (n, ny+0.5), graypen);

/*  Label the horizontal axes for both triangles.                             */
for (n = 0; n <= nx; ++n)
{
    label("$"+string(n)+"$", (n, -0.7), fpen);
    label("$"+string(n)+"$", (n + shift, -0.7), fpen);
}

/*  Label the vertical axis.                                                  */
for (n = 0; n <= ny; ++n)
{
    draw((-0.5, n) -- (nx + shift + 0.5, n), graypen);
    label("$"+string(n)+"$", (-0.7, n), fpen);
}

/*  Fill in the shapes with color.                                            */
filldraw(A1 -- A2 -- A3 -- cycle, Afill, outlinepen);
filldraw(B1 -- B2 -- B3 -- cycle, Bfill, outlinepen);
filldraw(C1 -- C2 -- C3 -- C4 -- C5 -- C6 -- cycle, Cfill, outlinepen);
filldraw(D1 -- D2 -- D3 -- D4 -- D5 -- D6 -- cycle, Dfill, outlinepen);

/*  The bigger triangle.                                                      */
A1 = (shift + 5.0, 2.0);
A2 = (shift + 13.0, 2.0);
A3 = (shift + 13.0, 5.0);

/*  Smaller triangle.                                                         */
B1 = (shift + 0.0, 0.0);
B2 = (shift + 5.0, 0.0);
B3 = A1;

/*  Tetris piece to the right of the smaller triangle.                        */
C1 = B2;
C2 = B3;
C3 = (shift + 10.0, 2.0);
C4 = (shift + 10.0, 1.0);
C5 = (shift + 7.0, 1.0);
C6 = (shift + 7.0, 0.0);

/*  Tetris piece below bigger triangle.                                       */
D1 = (shift + 8.0, 0.0);
D2 = (shift + 13.0, 0.0);
D3 = (shift + 13.0, 2.0);
D4 = (shift + 10.0, 2.0);
D5 = (shift + 10.0, 1.0);
D6 = (shift + 8.0, 1.0);

/*  Fill in the shapes with color.                                            */
filldraw(A1 -- A2 -- A3 -- cycle, Afill, outlinepen);
filldraw(B1 -- B2 -- B3 -- cycle, Bfill, outlinepen);
filldraw(C1 -- C2 -- C3 -- C4 -- C5 -- C6 -- cycle, Cfill, outlinepen);
filldraw(D1 -- D2 -- D3 -- D4 -- D5 -- D6 -- cycle, Dfill, outlinepen);
