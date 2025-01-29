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
 *      Draws the area between a parabola and a straight line. Used for       *
 *      discussing Archimedes' quadrature of the parabola.                    *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Functions for drawing polygonal figures found here.                       */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Two points defining the straight line.                                    */
vec2.Vec2 start = vec2.Vec2(-1.0, 0.25);
vec2.Vec2 end = vec2.Vec2(+1.0, 1.25);

/*  Parameters for the parabola.                                              */
real left = -1.0;
real right = +1.0;

/*  Values where the line intersects the parabola.                            */
real sqrt_five = sqrt(5.0);
real line_right = +0.25 * (sqrt_five - 1.0);
real line_left = -0.25 * (1 + sqrt_five);

/*  The number of samples for the parabola.                                   */
int samples = 20;

/*  Function defining the parabola.                                           */
real parabola(real t)
{
    return 1.0 - t*t;
}

/*  Path for the entire parabola.                                             */
path function = pf.PathFromFunction(parabola, left, right, samples);

/*  Path for the parabola between the intersection points with the line.      */
path arc = pf.PathFromFunction(parabola, line_left, line_right, samples);

/*  Close the arc so we can filldraw it.                                      */
arc = arc -- cycle;

/*  Fill in the region between the parabola and the straight line.            */
filldraw(arc, gray(0.75), invisible);

/*  Draw the entire parabola.                                                 */
draw(function);

/*  And lastly, draw the line segment from the start to the end.              */
draw(start.LineTo(end));
