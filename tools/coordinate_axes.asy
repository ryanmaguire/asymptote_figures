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
 *      Functions for drawing coordinate axes (x and y axes).                 *
 ******************************************************************************/

/*  Sharp tikz-style arrows found here.                                       */
import custom_arrows as arrows;

/*  Points and directions in the plane.                                       */
import vec2;

/*  Default arrow head.                                                       */
arrowbar default_arrow = arrows.SharpArrow(8bp);

/*  Default axis pen. Adequate for most drawings.                             */
pen default_axis_pen = black + linewidth(1.0pt) + fontsize(12pt);

/*  Default tick pen used to label and draw tick marks on the axes.           */
pen default_tick_pen = black + linewidth(0.4pt) + fontsize(12pt);

/******************************************************************************
 *  Function:                                                                 *
 *      DrawCoordinateAxes                                                    *
 *  Purpose:                                                                  *
 *      Draw the x and y axes without labels.                                 *
 *  Arguments:                                                                *
 *      start (vec2.Vec2):                                                    *
 *          The smallest values for the x and y axes. The x axis will begin   *
 *          at start.x and the y axis at start.y.                             *
 *      end (vec2.Vec2):                                                      *
 *          The largest values for the x and y axes. The x axis will end at   *
 *          end.x and the y axis ends at end.y.                               *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawCoordinateAxes(vec2.Vec2 start,
                        vec2.Vec2 end,
                        pen axis_pen = default_axis_pen,
                        arrowbar arrow = default_arrow)
{
    /*  Start and end of the x axis, given by the start and end parameters.   */
    vec2.Vec2 left = vec2.Vec2(start.x, 0.0);
    vec2.Vec2 right = vec2.Vec2(end.x, 0.0);

    /*  Similarly provide the start and end of the y axis.                    */
    vec2.Vec2 bottom = vec2.Vec2(0.0, start.y);
    vec2.Vec2 top = vec2.Vec2(0.0, end.y);

    /*  Draw the coordinate axes with labels.                                 */
    draw(left.LineTo(right), axis_pen, arrow);
    draw(bottom.LineTo(top), axis_pen, arrow);
}
/*  End of DrawCoordinateAxes.                                                */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularCoordinateAxes                                         *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths and without labels.           *
 *  Arguments:                                                                *
 *      axis_start (real):                                                    *
 *          Starting value of the x and y axes.                               *
 *      axis_end (real):                                                      *
 *          Final value of the x and y axes.                                  *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawRectangularCoordinateAxes(real axis_start,
                                   real axis_end,
                                   pen axis_pen = default_axis_pen,
                                   arrowbar arrow = default_arrow)
{
    /*  Compute the start and end points of the axes.                         */
    vec2.Vec2 start = vec2.Vec2(axis_start, axis_start);
    vec2.Vec2 end = vec2.Vec2(axis_end, axis_end);

    /*  Pass these points to the main axes function.                          */
    DrawCoordinateAxes(start, end, axis_pen = axis_pen, arrow = arrow);
}
/*  End of DrawRectangularCoordinateAxes.                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareCoordinateAxes                                              *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths and without labels.           *
 *  Arguments:                                                                *
 *      axis_start (real):                                                    *
 *          Starting value of the x and y axes.                               *
 *      axis_end (real):                                                      *
 *          Final value of the x and y axes.                                  *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawSquareCoordinateAxes(real length,
                              pen axis_pen = default_axis_pen,
                              arrowbar arrow = default_arrow)
{
    /*  Use the rectangular function with start = -length and end = length.   */
    DrawRectangularCoordinateAxes(
        -length, length, axis_pen = axis_pen, arrow = arrow
    );
}
/*  End of DrawRectangularCoordinateAxes.                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxesWithTickMarks                               *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks.          *
 *  Arguments:                                                                *
 *      start (vec2.Vec2):                                                    *
 *          The smallest values for the x and y axes. The x axis will begin   *
 *          at start.x and the y axis at start.y.                             *
 *      end (vec2.Vec2):                                                      *
 *          The largest values for the x and y axes. The x axis will end at   *
 *          end.x and the y axis ends at end.y.                               *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_tick_length (real):                                                 *
 *          Length of tick marks in the x axis.                               *
 *      y_tick_length (real):                                                 *
 *          Length of tick marks in the y axis.                               *
 *      tick_pen (pen):                                                       *
 *          Pen used for adding tick marks.                                   *
 *      x_skip (int):                                                         *
 *          The number of indices to skip in the x axis for tick marks.       *
 *      y_skip (int):                                                         *
 *          The number of indices to skip in the y axis for tick marks.       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawCoordinateAxesWithTickMarks(vec2.Vec2 start,
                                     vec2.Vec2 end,
                                     pen axis_pen = default_axis_pen,
                                     arrowbar arrow = default_arrow,
                                     real x_tick_length = 0.1,
                                     real y_tick_length = 0.1,
                                     pen tick_pen = default_tick_pen,
                                     int x_skip = 1,
                                     int y_skip = 1)
{
    /*  Variable for indexing over the tick mark.                             */
    int n;

    /*  Indices representing the start and end values for the tick marks.     */
    int start_x, end_x, start_y, end_y;

    /*  Draw the coordinate axes using the previous function.                 */
    DrawCoordinateAxes(start, end, axis_pen = axis_pen, arrow = arrow);

    /*  Compute the starting indices for the tick marks in both axes.         */
    start_x = (int)(start.x);
    end_x = (int)(end.x);
    start_y = (int)(start.y);
    end_y = (int)(end.y);

    /*  Loop through and draw the lines for the x axes.                       */
    for (n = start_x; n <= end_x; n += x_skip)
    {
        /*  If n is zero, do not draw tick marks. The labels overlap with the *
         *  axes lines and it isn't pretty.                                   */
        if (n == 0)
            continue;

        /*  Otherwise, draw in tick marks and labels.                         */
        else
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 top = vec2.Vec2(n, x_tick_length);
            vec2.Vec2 bottom = vec2.Vec2(n, -x_tick_length);
            draw(top.LineTo(bottom), tick_pen);
        }
    }
    /*  End of for-loop drawing the x-tick-marks.                             */

    /*  Loop through and draw the lines for the y axes.                       */
    for (n = start_y; n <= end_y; n += y_skip)
    {
        /*  If n is zero, do not draw tick marks. The labels overlap with the *
         *  axes lines and it isn't pretty.                                   */
        if (n == 0)
            continue;

        /*  Otherwise, draw in tick marks and labels.                         */
        else
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 left = vec2.Vec2(-y_tick_length, n);
            vec2.Vec2 right = vec2.Vec2(y_tick_length, n);
            draw(right.LineTo(left), tick_pen);
        }
    }
    /*  End of for-loop drawing the y-tick-marks.                             */
}
/*  End of DrawCoordinateAxesWithTickMarks.                                   */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxes                                            *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels.                          *
 *  Arguments:                                                                *
 *      start (vec2.Vec2):                                                    *
 *          The smallest values for the x and y axes. The x axis will begin   *
 *          at start.x and the y axis at start.y.                             *
 *      end (vec2.Vec2):                                                      *
 *          The largest values for the x and y axes. The x axis will end at   *
 *          end.x and the y axis ends at end.y.                               *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelCoordinateAxes(vec2.Vec2 start,
                                vec2.Vec2 end,
                                vec2.Vec2 x_label_dir = vec2.South,
                                vec2.Vec2 y_label_dir = vec2.East,
                                pen axis_pen = default_axis_pen,
                                arrowbar arrow = default_arrow,
                                string x_string = "x",
                                string y_string = "y")
{
    /*  Start and end of the x axis, given by the start and end parameters.   */
    vec2.Vec2 left = vec2.Vec2(start.x, 0.0);
    vec2.Vec2 right = vec2.Vec2(end.x, 0.0);

    /*  Similarly provide the start and end of the y axis.                    */
    vec2.Vec2 bottom = vec2.Vec2(0.0, start.y);
    vec2.Vec2 top = vec2.Vec2(0.0, end.y);

    /*  Create labels for the two axes.                                       */
    Label x_label = Label("$" + x_string + "$", position = 1.0);
    Label y_label = Label("$" + y_string + "$", position = 1.0);

    /*  Draw the coordinate axes with labels.                                 */
    draw(x_label, left.LineTo(right), x_label_dir.AsPair(), axis_pen, arrow);
    draw(y_label, bottom.LineTo(top), y_label_dir.AsPair(), axis_pen, arrow);
}
/*  End of DrawAndLabelCoordinateAxes.                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelRectangularCoordinateAxes                                 *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths.                              *
 *  Arguments:                                                                *
 *      axis_start (real):                                                    *
 *          Starting value of the x and y axes.                               *
 *      axis_end (real):                                                      *
 *          Final value of the x and y axes.                                  *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelRectangularCoordinateAxes(real axis_start,
                                           real axis_end,
                                           vec2.Vec2 x_label_dir = vec2.South,
                                           vec2.Vec2 y_label_dir = vec2.East,
                                           pen axis_pen = default_axis_pen,
                                           arrowbar arrow = default_arrow,
                                           string x_string = "x",
                                           string y_string = "y")
{
    /*  Compute the start and end points of the axes.                         */
    vec2.Vec2 start = vec2.Vec2(axis_start, axis_start);
    vec2.Vec2 end = vec2.Vec2(axis_end, axis_end);

    /*  Pass these points to the main axes functions.                         */
    DrawAndLabelCoordinateAxes(
        start,
        end,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_string = x_string,
        y_string = y_string
    );
}
/*  End of DrawAndLabelRectangularCoordinateAxes.                             */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelSquareCoordinateAxes                                      *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths centered at the origin.       *
 *  Arguments:                                                                *
 *      axis_length (real):                                                   *
 *          The length of the x and y axes.                                   *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelSquareCoordinateAxes(real axis_length,
                                      vec2.Vec2 x_label_dir = vec2.South,
                                      vec2.Vec2 y_label_dir = vec2.East,
                                      pen axis_pen = default_axis_pen,
                                      arrowbar arrow = default_arrow,
                                      string x_string = "x",
                                      string y_string = "y")
{
    /*  Use the rectangular function with start = -length and end = length.   */
    DrawAndLabelRectangularCoordinateAxes(
        -axis_length,
        axis_length,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_string = x_string,
        y_string = y_string
    );
}
/*  End of DrawAndLabelSquareCoordinateAxes.                                  */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxesWithTickMarks                               *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks.          *
 *  Arguments:                                                                *
 *      start (vec2.Vec2):                                                    *
 *          The smallest values for the x and y axes. The x axis will begin   *
 *          at start.x and the y axis at start.y.                             *
 *      end (vec2.Vec2):                                                      *
 *          The largest values for the x and y axes. The x axis will end at   *
 *          end.x and the y axis ends at end.y.                               *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_tick_length (real):                                                 *
 *          Length of tick marks in the x axis.                               *
 *      y_tick_length (real):                                                 *
 *          Length of tick marks in the y axis.                               *
 *      tick_pen (pen):                                                       *
 *          Pen used for adding tick marks.                                   *
 *      label_ticks (bool):                                                   *
 *          Boolean for labeling the tick marks with numbers or not.          *
 *      x_skip (int):                                                         *
 *          The number of indices to skip in the x axis for tick marks.       *
 *      y_skip (int):                                                         *
 *          The number of indices to skip in the y axis for tick marks.       *
 *      x_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the x axis.     *
 *      x_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the x axis.      *
 *      y_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the y axis.     *
 *      y_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the y axis.      *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelCoordinateAxesWithTickMarks(vec2.Vec2 start,
                                             vec2.Vec2 end,
                                             vec2.Vec2 x_label_dir = vec2.South,
                                             vec2.Vec2 y_label_dir = vec2.East,
                                             pen axis_pen = default_axis_pen,
                                             arrowbar arrow = default_arrow,
                                             real x_tick_length = 0.1,
                                             real y_tick_length = 0.1,
                                             pen tick_pen = default_tick_pen,
                                             bool label_ticks = true,
                                             int x_skip = 1,
                                             int y_skip = 1,
                                             string x_prefix = "",
                                             string x_suffix = "",
                                             string y_prefix = "",
                                             string y_suffix = "",
                                             string x_string = "x",
                                             string y_string = "y")
{
    /*  Variable for indexing over the tick mark.                             */
    int n;

    /*  Indices representing the start and end values for the tick marks.     */
    int start_x, end_x, start_y, end_y;

    /*  Draw the coordinate axes using the previous function.                 */
    DrawAndLabelCoordinateAxes(
        start,
        end,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_string = x_string,
        y_string = y_string
    );

    /*  Compute the starting indices for the tick marks in both axes.         */
    start_x = (int)(start.x);
    end_x = (int)(end.x);
    start_y = (int)(start.y);
    end_y = (int)(end.y);

    /*  Loop through and draw the lines for the x axes.                       */
    for (n = start_x; n <= end_x; n += x_skip)
    {
        /*  If n is zero, do not draw tick marks. The labels overlap with the *
         *  axes lines and it isn't pretty.                                   */
        if (n == 0)
            continue;

        /*  Otherwise, draw in tick marks and labels.                         */
        else
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 top = vec2.Vec2(n, x_tick_length);
            vec2.Vec2 bottom = vec2.Vec2(n, -x_tick_length);

            /*  Tick labels are optional. Check if the user requested them.   */
            if (label_ticks)
            {
                /*  A label for the tick mark.                                */
                string tick_str = x_prefix + string(n) + x_suffix;
                Label tick_label = Label("$" + tick_str + "$", position = 1.0);

                /*  Draw and label the tick marks.                            */
                draw(tick_label, top.LineTo(bottom), tick_pen);
            }

            /*  Otherwise draw the tick marks without labels.                 */
            else
                draw(top.LineTo(bottom), tick_pen);
        }
    }
    /*  End of for-loop drawing the x-tick-marks.                             */

    /*  Loop through and draw the lines for the y axes.                       */
    for (n = start_y; n <= end_y; n += y_skip)
    {
        /*  If n is zero, do not draw tick marks. The labels overlap with the *
         *  axes lines and it isn't pretty.                                   */
        if (n == 0)
            continue;

        /*  Otherwise, draw in tick marks and labels.                         */
        else
        {
            /*  End points for the tick marks.                                */
            vec2.Vec2 left = vec2.Vec2(-y_tick_length, n);
            vec2.Vec2 right = vec2.Vec2(y_tick_length, n);

            /*  Tick labels are optional. Check if the user requested them.   */
            if (label_ticks)
            {
                /*  A label for the tick mark.                                */
                string tick_str = y_prefix + string(n) + y_suffix;
                Label tick_label = Label("$" + tick_str + "$", position=1.0);

                /*  Draw and label the tick marks.                            */
                draw(tick_label, right.LineTo(left), tick_pen);
            }

            /*  Otherwise draw the tick marks without labels.                 */
            else
                draw(right.LineTo(left), tick_pen);
        }
    }
    /*  End of for-loop drawing the y-tick-marks.                             */
}
/*  End of DrawAndLabelCoordinateAxesWithTickMarks.                           */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelRectangularCoordinateAxesWithTickMarks                    *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks.          *
 *  Arguments:                                                                *
 *      axis_start (real):                                                    *
 *          The starting value for the x and y axes.                          *
 *      axis_finish (real):                                                   *
 *          The final value for the x and y axes.                             *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_tick_length (real):                                                 *
 *          Length of tick marks in the x axis.                               *
 *      y_tick_length (real):                                                 *
 *          Length of tick marks in the y axis.                               *
 *      tick_pen (pen):                                                       *
 *          Pen used for adding tick marks.                                   *
 *      label_ticks (bool):                                                   *
 *          Boolean for labeling the tick marks with numbers or not.          *
 *      x_skip (int):                                                         *
 *          The number of indices to skip in the x axis for tick marks.       *
 *      y_skip (int):                                                         *
 *          The number of indices to skip in the y axis for tick marks.       *
 *      x_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the x axis.     *
 *      x_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the x axis.      *
 *      y_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the y axis.     *
 *      y_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the y axis.      *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelRectangularCoordinateAxesWithTickMarks(
    real axis_start,
    real axis_finish,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = default_tick_pen,
    bool label_ticks = true,
    int x_skip = 1,
    int y_skip = 1,
    string x_prefix = "",
    string x_suffix = "",
    string y_prefix = "",
    string y_suffix = "",
    string x_string = "x",
    string y_string = "y"
)
{
    /*  Compute the start and end points of the axes.                         */
    vec2.Vec2 start = vec2.Vec2(axis_start, axis_start);
    vec2.Vec2 end = vec2.Vec2(axis_finish, axis_finish);

    /*  Use the main drawing function with the new parameters.                */
    DrawAndLabelCoordinateAxesWithTickMarks(
        start,
        end,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_tick_length = x_tick_length,
        y_tick_length = y_tick_length,
        tick_pen = tick_pen,
        label_ticks = label_ticks,
        x_skip = x_skip,
        y_skip = y_skip,
        x_prefix = x_prefix,
        x_suffix = x_suffix,
        y_prefix = y_prefix,
        y_suffix = y_suffix,
        x_string = x_string,
        y_string = y_string
    );
}
/*  End of DrawAndLabelRectangularCoordinateAxesWithTickMarks.                */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelSquareCoordinateAxesWithTickMarks                         *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks. The axes *
 *      will have the same lengths and be centered about the origin.          *
 *  Arguments:                                                                *
 *      axis_length (real):                                                   *
 *          The length of the x and y axes.                                   *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      x_tick_length (real):                                                 *
 *          Length of tick marks in the x axis.                               *
 *      y_tick_length (real):                                                 *
 *          Length of tick marks in the y axis.                               *
 *      tick_pen (pen):                                                       *
 *          Pen used for adding tick marks.                                   *
 *      label_ticks (bool):                                                   *
 *          Boolean for labeling the tick marks with numbers or not.          *
 *      x_skip (int):                                                         *
 *          The number of indices to skip in the x axis for tick marks.       *
 *      y_skip (int):                                                         *
 *          The number of indices to skip in the y axis for tick marks.       *
 *      x_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the x axis.     *
 *      x_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the x axis.      *
 *      y_prefix (string):                                                    *
 *          Optional string to prepend to tick mark labels in the y axis.     *
 *      y_suffix (string):                                                    *
 *          Optional string to append to tick mark labels in the y axis.      *
 *      x_string (string):                                                    *
 *          Label for the x axis.                                             *
 *      y_string (string):                                                    *
 *          Label for the y axis.                                             *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawAndLabelSquareCoordinateAxesWithTickMarks(
    real axis_length,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = default_tick_pen,
    bool label_ticks = true,
    int x_skip = 1,
    int y_skip = 1,
    string x_prefix = "",
    string x_suffix = "",
    string y_prefix = "",
    string y_suffix = "",
    string x_string = "x",
    string y_string = "y"
)
{
    /*  We use the rectangular function with start = -length and end = length.*/
    DrawAndLabelRectangularCoordinateAxesWithTickMarks(
        -axis_length,
        axis_length,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_tick_length = x_tick_length,
        y_tick_length = y_tick_length,
        tick_pen = tick_pen,
        label_ticks = label_ticks,
        x_skip = x_skip,
        y_skip = y_skip,
        x_prefix = x_prefix,
        x_suffix = x_suffix,
        y_prefix = y_prefix,
        y_suffix = y_suffix,
        x_string = x_string,
        y_string = y_string
    );
}
/*  End of DrawAndLabelSquareCoordinateAxesWithTickMarks.                     */
