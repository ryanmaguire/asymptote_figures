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

/*  Functions for drawing grid / guide lines for a plot.                      */
import grid_lines as grid;

/*  Functions for adding tick marks to a plot.                                */
import tick_marks as tick;

/*  Default arrow head.                                                       */
arrowbar default_arrow = arrows.SharpArrow(8bp);

/*  Default axis pen. Adequate for most drawings.                             */
pen default_axis_pen = black + linewidth(1.0pt) + fontsize(12pt);

/******************************************************************************
 *  Function:                                                                 *
 *      DrawCoordinateAxes                                                    *
 *  Purpose:                                                                  *
 *      Draw the x and y axes without labels.                                 *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 *  Notes:                                                                    *
 *      Selecting x_start > x_end is legal. This will cause the arrow to      *
 *      be on the left side, pointing in the negative direction. Similarly,   *
 *      choosing y_start > y_end will cause the arrow to point downwards.     *
 ******************************************************************************/
void
DrawCoordinateAxes(real x_start,
                   real x_end,
                   real y_start,
                   real y_end,
                   pen axis_pen = default_axis_pen,
                   arrowbar arrow = default_arrow)
{
    /*  Start and end of the x axis, given by the start and end parameters.   */
    vec2.Vec2 left = vec2.Vec2(x_start, 0.0);
    vec2.Vec2 right = vec2.Vec2(x_end, 0.0);

    /*  Similarly provide the start and end of the y axis.                    */
    vec2.Vec2 bottom = vec2.Vec2(0.0, y_start);
    vec2.Vec2 top = vec2.Vec2(0.0, y_end);

    /*  Draw the coordinate axes without labels.                              */
    draw(left.LineTo(right), axis_pen, arrow);
    draw(bottom.LineTo(top), axis_pen, arrow);
}
/*  End of DrawCoordinateAxes.                                                */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularCoordinateAxes                                         *
 *  Purpose:                                                                  *
 *      Draw x and y axes without labels and centered at the origin.          *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      y_length (real):                                                      *
 *          Half the height of the y axis.                                    *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawRectangularCoordinateAxes(real x_length,
                              real y_length,
                              pen axis_pen = default_axis_pen,
                              arrowbar arrow = default_arrow)
{
    /*  Ensure we got legal inputs.                                           */
    assert(x_length > 0.0);
    assert(y_length > 0.0);

    /*  Rectangular axes means they are centered about the origin.            */
    DrawCoordinateAxes(
        -x_length,              /*  Left-most point on the x axis.            */
        x_length,               /*  Right-most point on the x axis.           */
        -y_length,              /*  Bottom-most point on the y axis.          */
        y_length,               /*  Top-most point on the y axis.             */
        axis_pen = axis_pen,    /*  Pen used for drawing the axes.            */
        arrow = arrow           /*  Arrow head for the end of the axes.       */
    );
}
/*  End of DrawRectangularCoordinateAxes.                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareCoordinateAxes                                              *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths and without labels.           *
 *  Arguments:                                                                *
 *      length (real):                                                        *
 *          Half the width of the axes.                                       *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawSquareCoordinateAxes(real length,
                         pen axis_pen = default_axis_pen,
                         arrowbar arrow = default_arrow)
{
    /*  Ensure we got legal inputs.                                           */
    assert(length > 0.0);

    /*  Use the rectangular function with width = height.                     */
    DrawRectangularCoordinateAxes(
        length,                 /*  Width of the x axis.                      */
        length,                 /*  Height of the y axis.                     */
        axis_pen = axis_pen,    /*  Pen used for drawing the axes.            */
        arrow = arrow           /*  Arrow head for the end of the axes.       */
    );
}
/*  End of DrawSquareCoordinateAxes.                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawCoordinateAxesWithTickMarks                                       *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and give them tick marks.                       *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
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
 *  Notes:                                                                    *
 *      Selecting x_start > x_end is legal. This will cause the arrow to      *
 *      be on the left side, pointing in the negative direction. Similarly,   *
 *      choosing y_start > y_end will cause the arrow to point downwards.     *
 ******************************************************************************/
void
DrawCoordinateAxesWithTickMarks(real x_start,
                                real x_end,
                                real y_start,
                                real y_end,
                                pen axis_pen = default_axis_pen,
                                arrowbar arrow = default_arrow,
                                real x_tick_length = 0.1,
                                real y_tick_length = 0.1,
                                pen tick_pen = tick.default_tick_pen,
                                int x_skip = 1,
                                int y_skip = 1)
{
    /*  The origin does not get tick marks.                                   */
    bool skip_zero = true;

    /*  Check for legal inputs.                                               */
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Draw the coordinate axes using the previous function.                 */
    DrawCoordinateAxes(
        x_start,                /*  Left-most point on the x axis.            */
        x_end,                  /*  Right-most point on the x axis.           */
        y_start,                /*  Bottom-most point on the y axis.          */
        y_end,                  /*  Top-most point on the y axis.             */
        axis_pen = axis_pen,    /*  Pen used for the individual axes.         */
        arrow = arrow           /*  Arrow at the end of the axes.             */
    );

    /*  Add tick marks along the x axis.                                      */
    tick.DrawHorizontalTickMarks(
        x_start,                        /*  Left-most point for tick marks.   */
        x_end,                          /*  Right-most point for tick marks.  */
        tick_pen = tick_pen,            /*  Pen used for the tick marks.      */
        x_tick_length = x_tick_length,  /*  Length of the tick marks.         */
        x_skip = x_skip                 /*  Number of tick marks skipped.     */
    );

    /*  Add tick marks along the y axis.                                      */
    tick.DrawVerticalTickMarks(
        y_start,                        /*  Bottom-most point for tick marks. */
        y_end,                          /*  Top-most point for tick marks.    */
        tick_pen = tick_pen,            /*  Pen used for the tick marks.      */
        y_tick_length = y_tick_length,  /*  Length of the tick marks.         */
        y_skip = y_skip                 /*  Number of tick marks skipped.     */
    );
}
/*  End of DrawCoordinateAxesWithTickMarks.                                   */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularCoordinateAxesWithTickMarks                            *
 *  Purpose:                                                                  *
 *      Draw the x and y axes centered about the origin with tick marks.      *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      y_length (real):                                                      *
 *          Half the height of the y axis.                                    *
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
void
DrawRectangularCoordinateAxesWithTickMarks(real x_length,
                                           real y_length,
                                           pen axis_pen = default_axis_pen,
                                           arrowbar arrow = default_arrow,
                                           real x_tick_length = 0.1,
                                           real y_tick_length = 0.1,
                                           pen tick_pen = tick.default_tick_pen,
                                           int x_skip = 1,
                                           int y_skip = 1)
{
    /*  The origin does not get tick marks.                                   */
    bool skip_zero = true;

    /*  Check for legal inputs.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Draw the coordinate axes using the previous function.                 */
    DrawCoordinateAxesWithTickMarks(
        -x_length,                      /*  Left-most point on the x axis.    */
        x_length,                       /*  Right-most point on the x axis.   */
        -y_length,                      /*  Bottom-most point on the y axis.  */
        y_length,                       /*  Top-most point on the y axis.     */
        axis_pen = axis_pen,            /*  Pen used for the individual axes. */
        arrow = arrow,                  /*  Arrow at the end of the axes.     */
        x_tick_length = x_tick_length,  /*  Length of the x-axis tick marks.  */
        y_tick_length = y_tick_length,  /*  Length of the y-axis tick marks.  */
        x_skip = x_skip,                /*  Number of ticks to skip in x axis.*/
        y_skip = y_skip                 /*  Number of ticks to skip in y axis.*/
    );
}
/*  End of DrawRectangularCoordinateAxesWithTickMarks.                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareCoordinateAxesWithTickMarks                                 *
 *  Purpose:                                                                  *
 *      Draw the x and y axes with the same length, and with tick marks.      *
 *  Arguments:                                                                *
 *      length (real):                                                        *
 *          Half the width of the axes.                                       *
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
 *      grid_skip (int):                                                      *
 *          The number of indices to skip for tick marks.                     *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
DrawSquareCoordinateAxesWithTickMarks(real length,
                                      pen axis_pen = default_axis_pen,
                                      arrowbar arrow = default_arrow,
                                      real x_tick_length = 0.1,
                                      real y_tick_length = 0.1,
                                      pen tick_pen = tick.default_tick_pen,
                                      int grid_skip = 1)
{
    /*  The origin does not get tick marks.                                   */
    bool skip_zero = true;

    /*  Check for legal inputs.                                               */
    assert(length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(grid_skip > 0);

    /*  Draw the coordinate axes using the previous function.                 */
    DrawRectangularCoordinateAxesWithTickMarks(
        length,                         /*  Size of the x axis.               */
        length,                         /*  Size of the y axis.               */
        axis_pen = axis_pen,            /*  Pen used for the individual axes. */
        arrow = arrow,                  /*  Arrow at the end of the axes.     */
        x_tick_length = x_tick_length,  /*  Length of the x-axis tick marks.  */
        y_tick_length = y_tick_length,  /*  Length of the y-axis tick marks.  */
        x_skip = grid_skip,             /*  Number of ticks to skip in x axis.*/
        y_skip = grid_skip              /*  Number of ticks to skip in y axis.*/
    );
}
/*  End of DrawSquareCoordinateAxesWithTickMarks.                             */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxes                                            *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels.                          *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
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
void
DrawAndLabelCoordinateAxes(real x_start,
                           real x_end,
                           real y_start,
                           real y_end,
                           vec2.Vec2 x_label_dir = vec2.South,
                           vec2.Vec2 y_label_dir = vec2.East,
                           pen axis_pen = default_axis_pen,
                           arrowbar arrow = default_arrow,
                           string x_string = "x",
                           string y_string = "y")
{
    /*  Start and end of the x axis, given by the start and end parameters.   */
    vec2.Vec2 left = vec2.Vec2(x_start, 0.0);
    vec2.Vec2 right = vec2.Vec2(x_end, 0.0);

    /*  Similarly provide the start and end of the y axis.                    */
    vec2.Vec2 bottom = vec2.Vec2(0.0, y_start);
    vec2.Vec2 top = vec2.Vec2(0.0, y_end);

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
 *      Draw x and y axes with labels centered at the origin.                 *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      x_end (real):                                                         *
 *          Half the height of the y axis.                                    *
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
void
DrawAndLabelRectangularCoordinateAxes(real x_length,
                                      real y_length,
                                      vec2.Vec2 x_label_dir = vec2.South,
                                      vec2.Vec2 y_label_dir = vec2.East,
                                      pen axis_pen = default_axis_pen,
                                      arrowbar arrow = default_arrow,
                                      string x_string = "x",
                                      string y_string = "y")
{
    /*  Check for legal inputs.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);

    /*  Pass these points to the main axes functions.                         */
    DrawAndLabelCoordinateAxes(
        -x_length,                  /*  Left-most point on the x axis.        */
        x_length,                   /*  Right-most point on the x axis.       */
        -y_length,                  /*  Bottom-most point on the y axis.      */
        y_length,                   /*  Top-most point on the y axis.         */
        x_label_dir = x_label_dir,  /*  Direction of labels along x axis.     */
        y_label_dir = y_label_dir,  /*  Direction of labels along y axis.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the axes.        */
        arrow = arrow,              /*  Arrow placed at the end of the axes.  */
        x_string = x_string,        /*  The label for the x axis.             */
        y_string = y_string         /*  The label for the y axis.             */
    );
}
/*  End of DrawAndLabelRectangularCoordinateAxes.                             */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelSquareCoordinateAxes                                      *
 *  Purpose:                                                                  *
 *      Draw x and y axes with the same lengths centered at the origin.       *
 *  Arguments:                                                                *
 *      length (real):                                                        *
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
void
DrawAndLabelSquareCoordinateAxes(real length,
                                 vec2.Vec2 x_label_dir = vec2.South,
                                 vec2.Vec2 y_label_dir = vec2.East,
                                 pen axis_pen = default_axis_pen,
                                 arrowbar arrow = default_arrow,
                                 string x_string = "x",
                                 string y_string = "y")
{
    /*  Check for legal inputs.                                               */
    assert(length > 0.0);

    /*  Use the rectangular function with start = -length and end = length.   */
    DrawAndLabelRectangularCoordinateAxes(
        length,                     /*  Half the width of the x axis.         */
        length,                     /*  Half the height of the y axis.        */
        x_label_dir = x_label_dir,  /*  Direction of labels along x axis.     */
        y_label_dir = y_label_dir,  /*  Direction of labels along y axis.     */
        axis_pen = axis_pen,        /*  Pen used for drawing the axes.        */
        arrow = arrow,              /*  Arrow placed at the end of the axes.  */
        x_string = x_string,        /*  The label for the x axis.             */
        y_string = y_string         /*  The label for the y axis.             */
    );
}
/*  End of DrawAndLabelSquareCoordinateAxes.                                  */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxesWithTickMarks                               *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks.          *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
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
void
DrawAndLabelCoordinateAxesWithTickMarks(real x_start,
                                        real x_end,
                                        real y_start,
                                        real y_end,
                                        vec2.Vec2 x_label_dir = vec2.South,
                                        vec2.Vec2 y_label_dir = vec2.East,
                                        pen axis_pen = default_axis_pen,
                                        arrowbar arrow = default_arrow,
                                        real x_tick_length = 0.1,
                                        real y_tick_length = 0.1,
                                        pen tick_pen = tick.default_tick_pen,
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
    /*  The origin does not get tick marks.                                   */
    bool skip_zero = true;

    /*  Draw the coordinate axes using the previous function.                 */
    DrawAndLabelCoordinateAxes(
        x_start,
        x_end,
        y_start,
        y_end,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        x_string = x_string,
        y_string = y_string
    );

    /*  Check if the user wants the individual tick marks labeled.            */
    if (label_ticks)
    {
        /*  Draw the tick marks along the x axis and label them.              */
        tick.DrawAndLabelHorizontalTickMarks(
            x_start,
            x_end,
            tick_pen = tick_pen,
            x_tick_length = x_tick_length,
            x_skip = x_skip,
            x_prefix = x_prefix,
            x_suffix = x_suffix,
            x_string = x_string,
            skip_zero = skip_zero
        );

        /*  Draw the tick marks along the y axis and label them.              */
        tick.DrawAndLabelVerticalTickMarks(
            y_start,
            y_end,
            tick_pen = tick_pen,
            y_tick_length = y_tick_length,
            y_skip = y_skip,
            y_prefix = y_prefix,
            y_suffix = y_suffix,
            y_string = y_string,
            skip_zero = skip_zero
        );
    }

    /*  Otherwise create tick marks without labels.                           */
    else
    {
        /*  Draw the tick marks along the x axis without labels.              */
        tick.DrawHorizontalTickMarks(
            x_start,
            x_end,
            tick_pen = tick_pen,
            x_tick_length = x_tick_length,
            x_skip = x_skip,
            skip_zero = skip_zero
        );

        /*  Draw the tick marks along the y axis without labels.              */
        tick.DrawVerticalTickMarks(
            y_start,
            y_end,
            tick_pen = tick_pen,
            y_tick_length = y_tick_length,
            y_skip = y_skip,
            skip_zero = skip_zero
        );
    }

}
/*  End of DrawAndLabelCoordinateAxesWithTickMarks.                           */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelRectangularCoordinateAxesWithTickMarks                    *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with tick marks.          *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      y_length (real):                                                      *
 *          Half the height of the y axis.                                    *
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
void
DrawAndLabelRectangularCoordinateAxesWithTickMarks(
    real x_length,
    real y_length,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = tick.default_tick_pen,
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
    /*  Check for legal inputs.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Use the main drawing function with the new parameters.                */
    DrawAndLabelCoordinateAxesWithTickMarks(
        -x_length,
        x_length,
        -y_length,
        y_length,
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
 *      length (real):                                                        *
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
void
DrawAndLabelSquareCoordinateAxesWithTickMarks(
    real length,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = tick.default_tick_pen,
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
    /*  Check for legal inputs.                                               */
    assert(length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  We use the rectangular function with start = -length and end = length.*/
    DrawAndLabelRectangularCoordinateAxesWithTickMarks(
        length,
        length,
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

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelCoordinateAxesWithGridLines                               *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with grid lines.          *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawAndLabelCoordinateAxesWithGridLines(real x_start,
                                        real x_end,
                                        real y_start,
                                        real y_end,
                                        vec2.Vec2 x_label_dir = vec2.South,
                                        vec2.Vec2 y_label_dir = vec2.East,
                                        pen axis_pen = default_axis_pen,
                                        arrowbar arrow = default_arrow,
                                        pen grid_pen = grid.default_grid_pen,
                                        real x_tick_length = 0.1,
                                        real y_tick_length = 0.1,
                                        pen tick_pen = tick.default_tick_pen,
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
    /*  Parameters for the grid lines. The coordinate axes functions do not   *
     *  mind if x_start > x_end, or if y_start > y_end. In this case the axes *
     *  are drawn with the arrows in the reverse direction. The grid line     *
     *  functions are made in increasing order. We compute the lesser of      *
     *  x_start and x_end, storing this in x_begin, and the greater is stored *
     *  in x_finish. We do the same thing for the y axis.                     */
    real x_begin, x_finish, y_begin, y_finish;

    /* Check for legal inputs.                                                */
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Normal use case: x_start < x_end. The arrow points right. Set begin   *
     *  equal to start and finish equal to end.                               */
    if (x_start < x_end)
    {
        x_begin = x_start;
        x_finish = x_end;
    }

    /*  Flipped case, arrow points to the left. Set begin = end.              */
    else
    {
        x_begin = x_end;
        x_finish = x_start;
    }

    /*  Same check for the y axis.                                            */
    if (y_start < y_end)
    {
        y_begin = y_start;
        y_finish = y_end;
    }
    else
    {
        y_begin = y_end;
        y_finish = y_start;
    }

    /*  Add gride lines to the plot. This should be under the axes.           */
    grid.DrawGridLines(
        x_begin,
        x_finish,
        y_begin,
        y_finish,
        grid_pen = grid_pen,
        x_skip = x_skip,
        y_skip = y_skip
    );

    /*  Draw the coordinate axes with labels and tick marks.                  */
    DrawAndLabelCoordinateAxesWithTickMarks(
        x_start,
        x_end,
        y_start,
        y_end,
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
/*  End of DrawAndLabelCoordinateAxesWithGridLines.                           */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelRectangularCoordinateAxesWithGridLines                    *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with grid lines.          *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      y_length (real):                                                      *
 *          Half the height of the y axis.                                    *
 *  Keywords:                                                                 *
 *      x_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the x axis. Default is South.      *
 *      y_label_dir (vec2.Vec2):                                              *
 *          The direction of the label for the y axis. Default is East.       *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawAndLabelRectangularCoordinateAxesWithGridLines(
    real x_length,
    real y_length,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    pen grid_pen = grid.default_grid_pen,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = tick.default_tick_pen,
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
    /*  Check for legal inputs.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Use the main drawing function with the new parameters.                */
    DrawAndLabelCoordinateAxesWithGridLines(
        -x_length,
        x_length,
        -y_length,
        y_length,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        grid_pen = grid_pen,
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
/*  End of DrawAndLabelRectangularCoordinateAxesWithGridLines.                */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawAndLabelSquareCoordinateAxesWithGridLines                         *
 *  Purpose:                                                                  *
 *      Draw the x and y axes and gives them labels with grid lines. The axes *
 *      will have the same lengths and be centered about the origin.          *
 *  Arguments:                                                                *
 *      length (real):                                                        *
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
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawAndLabelSquareCoordinateAxesWithGridLines(
    real length,
    vec2.Vec2 x_label_dir = vec2.South,
    vec2.Vec2 y_label_dir = vec2.East,
    pen axis_pen = default_axis_pen,
    arrowbar arrow = default_arrow,
    pen grid_pen = grid.default_grid_pen,
    real x_tick_length = 0.1,
    real y_tick_length = 0.1,
    pen tick_pen = tick.default_tick_pen,
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
    /*  Check for legal inputs.                                               */
    assert(length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  We use the rectangular function with start = -length and end = length.*/
    DrawAndLabelRectangularCoordinateAxesWithGridLines(
        length,
        length,
        x_label_dir = x_label_dir,
        y_label_dir = y_label_dir,
        axis_pen = axis_pen,
        arrow = arrow,
        grid_pen = grid_pen,
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
/*  End of DrawAndLabelSquareCoordinateAxesWithGridLines.                     */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawCoordinateAxesWithGridLines                                       *
 *  Purpose:                                                                  *
 *      Draw the x and y axes without labels and with grid lines.             *
 *  Arguments:                                                                *
 *      x_start (real):                                                       *
 *          The smallest values for the x axis.                               *
 *      x_end (real):                                                         *
 *          The largest values for the x axis.                                *
 *      y_start (real):                                                       *
 *          The smallest values for the y axis.                               *
 *      y_end (real):                                                         *
 *          The largest values for the y axis.                                *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawCoordinateAxesWithGridLines(real x_start,
                                real x_end,
                                real y_start,
                                real y_end,
                                pen axis_pen = default_axis_pen,
                                arrowbar arrow = default_arrow,
                                pen grid_pen = grid.default_grid_pen,
                                real x_tick_length = 0.1,
                                real y_tick_length = 0.1,
                                pen tick_pen = tick.default_tick_pen,
                                int x_skip = 1,
                                int y_skip = 1)
{
    /*  Parameters for the grid lines. The coordinate axes functions do not   *
     *  mind if x_start > x_end, or if y_start > y_end. In this case the axes *
     *  are drawn with the arrows in the reverse direction. The grid line     *
     *  functions are made in increasing order. We compute the lesser of      *
     *  x_start and x_end, storing this in x_begin, and the greater is stored *
     *  in x_finish. We do the same thing for the y axis.                     */
    real x_begin, x_finish, y_begin, y_finish;

    /* Check for legal inputs.                                                */
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Normal use case: x_start < x_end. The arrow points right. Set begin   *
     *  equal to start and finish equal to end.                               */
    if (x_start < x_end)
    {
        x_begin = x_start;
        x_finish = x_end;
    }

    /*  Flipped case, arrow points to the left. Set begin = end.              */
    else
    {
        x_begin = x_end;
        x_finish = x_start;
    }

    /*  Same check for the y axis.                                            */
    if (y_start < y_end)
    {
        y_begin = y_start;
        y_finish = y_end;
    }
    else
    {
        y_begin = y_end;
        y_finish = y_start;
    }

    /*  Add gride lines to the plot. This should be under the axes.           */
    grid.DrawGridLines(
        x_begin,
        x_finish,
        y_begin,
        y_finish,
        grid_pen = grid_pen,
        x_skip = x_skip,
        y_skip = y_skip
    );

    /*  Draw the coordinate axes with labels and tick marks.                  */
    DrawCoordinateAxesWithTickMarks(
        x_start,
        x_end,
        y_start,
        y_end,
        axis_pen = axis_pen,
        arrow = arrow,
        x_tick_length = x_tick_length,
        y_tick_length = y_tick_length,
        tick_pen = tick_pen,
        x_skip = x_skip,
        y_skip = y_skip
    );
}
/*  End of DrawCoordinateAxesWithGridLines.                                   */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawRectangularCoordinateAxesWithGridLines                            *
 *  Purpose:                                                                  *
 *      Draw the x and y axes without labels and with grid lines.             *
 *  Arguments:                                                                *
 *      x_length (real):                                                      *
 *          Half the width of the x axis.                                     *
 *      y_length (real):                                                      *
 *          Half the height of the y axis.                                    *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawRectangularCoordinateAxesWithGridLines(real x_length,
                                           real y_length,
                                           pen axis_pen = default_axis_pen,
                                           arrowbar arrow = default_arrow,
                                           pen grid_pen = grid.default_grid_pen,
                                           real x_tick_length = 0.1,
                                           real y_tick_length = 0.1,
                                           pen tick_pen = tick.default_tick_pen,
                                           int x_skip = 1,
                                           int y_skip = 1)
{
    /*  Check for legal inputs.                                               */
    assert(x_length > 0.0);
    assert(y_length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  Use the main drawing function with the new parameters.                */
    DrawCoordinateAxesWithGridLines(
        -x_length,
        x_length,
        -y_length,
        y_length,
        axis_pen = axis_pen,
        arrow = arrow,
        grid_pen = grid_pen,
        x_tick_length = x_tick_length,
        y_tick_length = y_tick_length,
        tick_pen = tick_pen,
        x_skip = x_skip,
        y_skip = y_skip
    );
}
/*  End of DrawRectangularCoordinateAxesWithGridLines.                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawSquareCoordinateAxesWithGridLines                                 *
 *  Purpose:                                                                  *
 *      Draw the x and y axes without labels and with grid lines. The axes    *
 *      will have the same lengths and be centered about the origin.          *
 *  Arguments:                                                                *
 *      length (real):                                                        *
 *          The length of the x and y axes.                                   *
 *  Keywords:                                                                 *
 *      axis_pen (pen):                                                       *
 *          Pen used to draw the axis.                                        *
 *      arrow (arrowbar):                                                     *
 *          Arrow used to end the axes.                                       *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
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
void
DrawSquareCoordinateAxesWithGridLines(real length,
                                      pen axis_pen = default_axis_pen,
                                      arrowbar arrow = default_arrow,
                                      pen grid_pen = grid.default_grid_pen,
                                      real x_tick_length = 0.1,
                                      real y_tick_length = 0.1,
                                      pen tick_pen = tick.default_tick_pen,
                                      int x_skip = 1,
                                      int y_skip = 1)
{
    /*  Check for legal inputs.                                               */
    assert(length > 0.0);
    assert(x_tick_length > 0.0);
    assert(y_tick_length > 0.0);
    assert(x_skip > 0);
    assert(y_skip > 0);

    /*  We use the rectangular function with start = -length and end = length.*/
    DrawRectangularCoordinateAxesWithGridLines(
        length,
        length,
        axis_pen = axis_pen,
        arrow = arrow,
        grid_pen = grid_pen,
        x_tick_length = x_tick_length,
        y_tick_length = y_tick_length,
        tick_pen = tick_pen,
        x_skip = x_skip,
        y_skip = y_skip
    );
}
/*  End of DrawSquareCoordinateAxesWithGridLines.                             */
