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
 *      Draws a zig-zag Legendrian representation of an unknot.               *
 ******************************************************************************/

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings;

draw((-1.0, 0.0){E} .. (1.0, 1.0){E} .. (2.0, 0.5){E});
draw((2.0, 0.5){W} .. (1.0, 0.0){W});
draw((1.0, 0.0){E} .. (2.0, -0.5){E});
draw((2.0, -0.5){W} .. (1.0, -1.0){W} .. (-1.0, 0.0){W});
