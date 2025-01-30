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
 *      Draws a house and a store in the Cartesian plane.                     *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Tools for drawing graphics, like a house or a store.                      */
import icons;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Parameters for the coordinate axes which are also used for the guide grid.*/
real start = -2.2;
real end = 4.4;

/*  The location and size of the house to be drawn.                           */
vec2.Vec2 house_center = vec2.Vec2(-1.0, 1.0);
real house_size = 0.7;

/*  The location and size of the store to be drawn.                           */
vec2.Vec2 store_center = vec2.Vec2(2.0, 3.0);
real store_size = 0.8;

/*  Draw the coordinate axes, labeling them and adding grid lines.            */
axes.DrawAndLabelCoordinateAxesWithGridLines(start, end, start, end);

/*  Create the house and the store.                                           */
icons.DrawHouse(house_center, house_size);
icons.DrawStore(store_center, store_size);
