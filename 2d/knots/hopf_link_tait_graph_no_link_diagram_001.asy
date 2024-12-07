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
 *      Draws the Tait graph of the Hopf link.                                *
 ******************************************************************************/

/*  Default parameters for a size(256) drawing provided here.                 */
import size_256_default_settings as default;

pair A = (0.0, 0.0);
pair B = (0.9, 0.0);
real r = 0.49;
real arsize = 5bp;
real rDot = 0.05;

draw(A{NE} .. B{SE}, red);
draw(A{SE} .. B{NE}, red);

filldraw(circle(A, rDot), grey, black);
filldraw(circle(B, rDot), grey, black);
