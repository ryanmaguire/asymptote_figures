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

/*  Functions for adding grid lines to a drawing.                             */
import grid_lines as grid;

/*  Functions for plotting the x and y axes.                                  */
import coordinate_axes as axes;

/*  Functions for creating paths from sequences of points.                    */
import path_functions as pf;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Function for drawing a house with a door and window.                      */
void DrawHouse(vec2.Vec2 center, real size)
{
    /*  The four corners of the house lie on a circle.                        */
    vec2.Vec2 V0 = center + size*vec2.UnitVectorFromAngle(0.25*pi);
    vec2.Vec2 V1 = center + size*vec2.UnitVectorFromAngle(0.75*pi);
    vec2.Vec2 V2 = center + size*vec2.UnitVectorFromAngle(1.25*pi);
    vec2.Vec2 V3 = center + size*vec2.UnitVectorFromAngle(1.75*pi);

    /*  The point of the roof is centered.                                    */
    vec2.Vec2 roof = center + vec2.Vec2(0.0, 1.2*size);

    /*  Four points for a rectangular door off to the left side of the house. */
    vec2.Vec2 door0 = 0.2*(V3 - V2) + V2;
    vec2.Vec2 door1 = 0.45*(V3 - V2) + V2;
    vec2.Vec2 door2 = door1 + vec2.Vec2(0.0, 0.6*size);
    vec2.Vec2 door3 = door0 + vec2.Vec2(0.0, 0.6*size);

    /*  Four points for a window on the right side of the house.              */
    vec2.Vec2 window0 = 0.6*(V3 - V2) + V2 + Vec2.Vec2(0.0, 0.4*size);
    vec2.Vec2 window1 = window0 + vec2.Vec2(0.0, 0.4*size);
    vec2.Vec2 window2 = window1 + vec2.Vec2(0.4*size, 0.0);
    vec2.Vec2 window3 = window0 + vec2.Vec2(0.4*size, 0.0);

    /*  Four points for the cross-thing that windows have.                    */
    vec2.Vec2 pane0 = window0 + vec2.Vec2(0.0, 0.2*size);
    vec2.Vec2 pane1 = window3 + vec2.Vec2(0.0, 0.2*size);
    vec2.Vec2 pane2 = window0 + vec2.Vec2(0.2*size, 0.0);
    vec2.Vec2 pane3 = window1 + vec2.Vec2(0.2*size, 0.0);

    /*  The polygons defining the house.                                      */
    vec2.Vec2[] house = {V0, V1, V2, V3};
    vec2.Vec2[] roof = {V0, roof, V1};
    vec2.Vec2[] door = {door0, door1, door2, door3};
    vec2.Vec2[] window = {window0, window1, window2, window3};

    /*  Create paths from these polygons so we can draw the house.            */
    path house_path = pf.PolyFromPoints(house, true);
    path roof_path = pf.PolyFromPoints(roof, true);
    path door_path = pf.PolyFromPoints(door, true);
    path window_path = pf.PolyFromPoints(window, true);

    /*  Draw the house.                                                       */
    filldraw(house_path, gray, black);

    /*  Draw and color the roof.                                              */
    filldraw(roof_path, brown, black);

    /*  Next, do the door.                                                    */
    filldraw(door_path, deepgreen, black);

    /*  Finally, draw the window.                                             */
    filldraw(window_path, yellow, black);
    draw(pane0.LineTo(pane1));
    draw(pane2.LineTo(pane3));
}
/*  End of DrawHouse.                                                         */

/*  Function for drawing a store in the plane.                                */
void DrawStore(vec2.Vec2 center, real size)
{
    /*  Four vertices for the corners of the store.                           */
    vec2.Vec2 V0 = center + vec2.Vec2(size, 0.5*size);
    vec2.Vec2 V1 = center + vec2.Vec2(-size, 0.5*size);
    vec2.Vec2 V2 = center + vec2.Vec2(-size, -0.5*size);
    vec2.Vec2 V3 = center + vec2.Vec2(size, -0.5*size);

    /*  Two more vertices for the sign on the store. It reads "store."        */
    vec2.Vec2 V4 = center + vec2.Vec2(size, size);
    vec2.Vec2 V5 = center + vec2.Vec2(-size, size);

    /*  Vertices for the door.                                                */
    vec2.Vec2 door0 = 0.9*(V3 - V2) + V2;
    vec2.Vec2 door1 = 0.6*(V3 - V2) + V2;
    vec2.Vec2 door2 = door1 + vec2.Vec2(0.0, 0.6*size);
    vec2.Vec2 door3 = door0 + vec2.Vec2(0.0, 0.6*size);

    /*  Top and bottom of the door. Used to split door into two parts.        */
    vec2.Vec2 door_top_center = vec2.Midpoint(door2, door3);
    vec2.Vec2 door_bottom_center = vec2.Midpoint(door0, door1);

    /*  Four points for a window on the left side of the store.               */
    vec2.Vec2 window0 = 0.1*(V3 - V2) + V2 + Vec2.Vec2(0.0, 0.4*size);
    vec2.Vec2 window1 = window0 + vec2.Vec2(0.0, 0.4*size);
    vec2.Vec2 window2 = window1 + vec2.Vec2(0.6*size, 0.0);
    vec2.Vec2 window3 = window0 + vec2.Vec2(0.6*size, 0.0);

    /*  Point for a reflection in the window.                                 */
    vec2.Vec2 reflection = window1 + vec2.Vec2(0.12*size, -0.13*size);

    /*  Location of the store label. It is in the center of the sign.         */
    vec2.Vec2 store_label = center + vec2.Vec2(0.0, 0.75*size);

    /*  Polygons for the parts of the store.                                  */
    vec2.Vec2[] store = {V0, V1, V2, V3};
    vec2.Vec2[] sign = {V0, V1, V5, V4};
    vec2.Vec2[] door = {door0, door1, door2, door3};
    vec2.Vec2[] window = {window0, window1, window2, window3};

    /*  Paths through all of the polygons.                                    */
    path store_path = pf.PolyFromPoints(store, true);
    path sign_path = pf.PolyFromPoints(sign, true);
    path door_path = pf.PolyFromPoints(door, true);
    path window_path = pf.PolyFromPoints(window, true);

    /*  Path for the reflection in the window.                                */
    path reflection_path = reflection.Ellipse(0.07*size, 0.04*size, 50.0);

    /*  Draw the store.                                                       */
    filldraw(store_path, lightgray, black);
    filldraw(sign_path, lightred, black);
    filldraw(door_path, cyan, black);
    draw(door_top_center.LineTo(door_bottom_center));
    filldraw(window_path, cyan, black);
    filldraw(reflection_path, white, white);

    /*  Add the magnificent label.                                            */
    store_label.AddLabel("\sffamily{\textbf{Store}}");
}
/*  End of DrawStore.                                                         */

/*  Start and end values for the square guide-grid to be drawn.               */
int grid_start = -2;
int grid_end = 4;

/*  Parameters for the coordinate axes which are also used for the guide grid.*/
vec2.Vec2 axis_start = vec2.Vec2(-2.2, -2.2);
vec2.Vec2 axis_end = vec2.Vec2(4.4, 4.4);

/*  The location and size of the house to be drawn.                           */
vec2.Vec2 house_center = vec2.Vec2(-1.0, 1.0);
real house_size = 0.7;

/*  The location and size of the store to be drawn.                           */
vec2.Vec2 store_center = vec2.Vec2(2.0, 3.0);
real store_size = 0.8;

/*  Add grid lines to the drawing.                                            */
grid.DrawGridLines(grid_start, grid_end, axis_start, axis_end);

/*  Draw the coordinate axes.                                                 */
axes.DrawAndLabelCoordinateAxesWithTickMarks(axis_start, axis_end);

/*  Create the house and the store.                                           */
DrawHouse(house_center, house_size);
DrawStore(store_center, store_size);
