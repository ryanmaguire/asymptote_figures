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
 *      Tests the functionality of the DrawBoxCoordinates routine.            *
 ******************************************************************************/

/*  Tools for creating box plots.                                             */
import box_coordinates as bc;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Parameters for the box plot.                                              */
real x_start = -3.2;
real x_end = 4.5;
real y_start = 3.4;
real y_end = 7.8;
int grid_skip = 2;

/*  Make the plot.                                                            */
bc.DrawBoxCoordinates(x_start, x_end, y_start, y_end, x_skip = grid_skip);
