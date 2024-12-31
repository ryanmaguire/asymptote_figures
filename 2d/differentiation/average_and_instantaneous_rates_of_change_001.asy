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
 *  Author:     Ryan Maguire                                                  *
 *  Date:       December 31, 2024                                             *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Draws a curve with several points on it. Used to represent the        *
 *      differences between instantaneous and average rates of change.        *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Function for plotting the x and y axes.                                   */
import coordinate_axes as axes;

/*  Functions for creating smooth splines through points provided here.       */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_256_default_settings as default;

/*  Start and end for the x and y axes.                                       */
real xstart = -0.2;
real xend = 1.2;
real ystart = -0.2;
real yend = 1.2;

/*  Variable for indexing over the points.                                    */
int n;

/*  The points defining the curve.                                            */
vec2.Vec2[] pts = {
    vec2.Vec2(0.2, 0.2),
    vec2.Vec2(0.4, 0.6),
    vec2.Vec2(0.6, 0.85),
    vec2.Vec2(0.8, 0.95),
    vec2.Vec2(1.0, 1.0)
};

/*  Construct a smooth curve passing through all of the points.               */
path curve = pf.PathFromPoints(pts);

/*  Draw the axes and the path for the curve.                                 */
axes.DrawAndLabelCoordinateAxes(
    xstart,         /*  Left-most end-point for the x axis.     */
    xend,           /*  Right-most end-point for the x axis.    */
    ystart,         /*  Bottom-most end-point for the y axis.   */
    yend,           /*  Top-most end-point for the y axis.      */
    x_string = "t", /*  Label for the x-axis, which is time.    */
    y_string = "x"  /*  Label for the y-axis, which is position.*/
);

draw(curve);
draw(pts[0].LineTo(pts[pts.length - 1]), default.blue_pen);

/*  Loop through the points and draw projections and mark them with dots.     */
for (n = 0; n < pts.length; ++n)
{
    Label label;
    vec2.Vec2 x_proj = pts[n].ProjectX();
    pts[n].DrawDot(0.25 * default.dot_radius);

    /*  The left-most point is the boundary of the interval, which is "a".    */
    if (n == 0)
        label = Label("$a$", position = 1.0);

    /*  Similarly, the right-most point is the boundary "b".                  */
    else if (n == pts.length - 1)
        label = Label("$b$", position = 1.0);

    /*  All other points are given generic labels.                            */
    else
        label = Label("$t_{" + string(n) + "}$", position = 1.0);

    /*  Draw a dashed line down to the x axis and label the point.            */
    draw(label, pts[n].LineTo(x_proj), default.dash_pen);
}
