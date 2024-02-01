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

/*  Used for plotting the function.                                           */
import graph;

/*  PDF is easiest to use in LaTeX, so output this.                           */
import settings;
settings.outformat = "pdf";

/*  Size of the drawing.                                                      */
size(256, IgnoreAspect);

/*  Length of the x and y axes.                                               */
real xlen = 10.3;
real xmin = -10.5;
real xmax = 10.5;
real ymin = -0.3;
real ymax = 1.1;

/*  Size of arrow heads.                                                      */
real arsize = 5bp;

/*  Number of samples in the drawing.                                         */
int n_samples = 100;

/*  The function to be plotted, the sinc function.                            */
real sinc(real x)
{
    if (x == 0.0)
        return 1.0;
    else
        return sin(x)/x;
}

/*  Graph the function.                                                       */
draw(graph(sinc, -xlen, xlen, n=n_samples, operator ..), deepblue);

/*  Draw the axes.                                                            */
xaxis(RightTicks(NoZero, Step=3.0), SharpArrows(arsize), xmin=xmin, xmax=xmax);
yaxis(LeftTicks(NoZero, Step=0.5), SharpArrows(arsize), ymin=ymin, ymax=ymax);

/*  Label the function.                                                       */
label("$f(x)=\textrm{sinc}(x)$", (0.5*xlen, 0.5), deepblue);

/*  Label the axes.                                                           */
label("$x$", (xlen, 0.07));
label("$y$", (0.95, 1.0));
