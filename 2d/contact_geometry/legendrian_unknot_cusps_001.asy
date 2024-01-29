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
 *      Draws a Legendrian representation of an unknot.                       *
 ******************************************************************************/

/*  Functions for creating paths from vector-valued functions.                */
import graph;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings;

/*  Projection of the Legendrian unknot parametrization onto the xz plane.    */
pair unknot_parametrization(real t)
{
    return (cos(t), sin(t)^3);
}

/*  The number of samples in the path, and the start and end parameters.      */
int samples = 100;
real start = 0.0;
real end = 2.0*pi;

/*  Create a path from the parametrizing function and draw it.                */
path legendrian_unknot = graph(unknot_parametrization, start, end, samples);
draw(legendrian_unknot);
