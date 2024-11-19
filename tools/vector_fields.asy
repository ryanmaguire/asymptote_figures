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
 *      Provides tools for plotting vector fields.                            *
 ******************************************************************************/

/*  Sharp tikz-style arrows found here.                                       */
import custom_arrows as arrows;

/*  Points and directions in the plane.                                       */
import vec2;

/*  Functions for drawing box plots with grid lines.                          */
import box_coordinates as bc;

/*  Default pen and arrow head used for the vector fields.                    */
pen default_arrow_pen = blue + linewidth(0.4pt) + fontsize(12pt);
arrowbar default_arrow = arrows.SharpArrow(8bp);

/******************************************************************************
 *  Function:                                                                 *
 *      PlotVectorField                                                       *
 *  Purpose:                                                                  *
 *      Plots a vector field using arrows in the plane.                       *
 *  Arguments:                                                                *
 *      vector_field (function Vec2 -> Vec2):                                 *
 *          The vector field to be plotted.                                   *
 *      x_start (real):                                                       *
 *          The left-most extreme for the horizontal lines.                   *
 *      x_end (real):                                                         *
 *          The right-most extreme for the horizontal lines.                  *
 *      y_start (real):                                                       *
 *          The bottom-most extreme for the vertical lines.                   *
 *      y_end (real):                                                         *
 *          The top-most extreme for the horizontal lines.                    *
 *  Keywords:                                                                 *
 *      dx (real):                                                            *
 *          The displacement between samples in the x axis.                   *
 *      dy (real):                                                            *
 *          The displacement between samples in the y axis.                   *
 *      arrow_pen (pen):                                                      *
 *          The pen used to draw the arrows.                                  *
 *      arrow (arrowbar):                                                     *
 *          The head of the arrow used to draw the vector field.              *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
PlotVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                real x_start,
                real x_end,
                real y_start,
                real y_end,
                real dx = 0.25,
                real dy = 0.25,
                pen arrow_pen = default_arrow_pen,
                arrowbar arrow = default_arrow)
{
    /*  Variables for the samples for the vector field.                       */
    real x, y, x_left, x_right, y_bottom, y_top, x_center, y_center;

    /*  Check that we were given legal variables.                             */
    assert(dx > 0.0);
    assert(dy > 0.0);
    assert(x_start < x_end);
    assert(y_start < y_end);

    /*  We "snap" onto the nearest grid line for the extremal samples. This   *
     *  is computed using the floor and ceil functions. Compute the midpoints *
     *  for both axes first.                                                  */
    x_center = 0.5 * (x_start + x_end);
    y_center = 0.5 * (y_start + y_end);

    /*  ceil((start - center) / dx) is the left most index for the horizontal *
     *  axis. Scaling by dx and then shifting over by "center" gives us the   *
     *  nearest grid-point for the x axis. This is the left-most sample point.*/
    x_left = dx * ceil((x_start - x_center) / dx) + x_center;

    /*  A similar argument is done for the y axis.                            */
    y_bottom = dy * ceil((y_start - y_center) / dy) + y_center;

    /*  floor((end - center) / dx) is the right-most index for the horizontal *
     *  axis. As before, scale this by dx and shift by center to get the      *
     *  right-most grid-point for the x axis. Similarly for the y axis.       */
    x_right = dx * floor((x_end - x_center) / dx) + x_center;
    y_top = dy * floor((y_end - y_center) / dy) + y_center;

    /*  Loop through the samples in the horizontal direction.                 */
    for (x = x_left; x <= x_right; x += dx)
    {
        /*  Loop through the samples in the vertical direction.               */
        for (y = y_bottom; y <= y_top; y += dy)
        {
            /*  Compute the points specifying the arrow for the vector field  *
             *  at this point. This is (x, y) and (x, y) + F(x, y), where F   *
             *  is the vector field.                                          */
            vec2.Vec2 start = vec2.Vec2(x, y);
            vec2.Vec2 end = start + vector_field(start);

            /*  Make sure the arrow doesn't go outside the bounds of the plot.*/
            if (end.x > x_start && end.x < x_end &&
                end.y > y_start && end.y < y_end)
            {
                /*  Both the base and the tip of the arrow fall inside the    *
                 *  bounds of the plot. We can draw the arrow.                */
                draw(start.LineTo(end), arrow_pen, arrow);
            }
        }
        /*  End of for-loop in the vertical direction.                        */
    }
    /*  End of for-loop in the horizontal direction.                          */
}
/*  End of PlotVectorField.                                                   */

/******************************************************************************
 *  Function:                                                                 *
 *      PlotRectangularVectorField                                            *
 *  Purpose:                                                                  *
 *      Plots a vector field using arrows, centered about the origin.         *
 *  Arguments:                                                                *
 *      vector_field (function Vec2 -> Vec2):                                 *
 *          The vector field to be plotted.                                   *
 *      x_length (real):                                                      *
 *          Half the width of the plot.                                       *
 *      y_length (real):                                                      *
 *          Half the height of the plot.                                      *
 *  Keywords:                                                                 *
 *      dx (real):                                                            *
 *          The displacement between samples in the x axis.                   *
 *      dy (real):                                                            *
 *          The displacement between samples in the y axis.                   *
 *      arrow_pen (pen):                                                      *
 *          The pen used to draw the arrows.                                  *
 *      arrow (arrowbar):                                                     *
 *          The head of the arrow used to draw the vector field.              *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
PlotRectangularVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                           real x_length,
                           real y_length,
                           real dx = 0.25,
                           real dy = 0.25,
                           pen arrow_pen = default_arrow_pen,
                           arrowbar arrow = default_arrow)
{
    /*  Check for legal inputs.                                               */
    assert(dx > 0.0);
    assert(dy > 0.0);
    assert(x_length > 0.0);
    assert(y_length > 0.0);

    /*  Use the main plotting function.                                       */
    PlotVectorField(
        vector_field,           /*  The vector field that is being plotted.   */
        -x_length,              /*  The left-most point on the x axis.        */
        x_length,               /*  The right-most point on the x axis.       */
        -y_length,              /*  The bottom-most point on the y axis.      */
        y_length,               /*  The top-most point on the y axis.         */
        dx = dy,                /*  Displacement between horizontal samples.  */
        dy = dy,                /*  Displacement between vertical samples.    */
        arrow_pen = arrow_pen,  /*  Pen used for drawing the arrows.          */
        arrow = arrow           /*  Arrow type used for the vector field plot.*/
    );
}
/*  End of PlotRectangularVectorField.                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      PlotSquareVectorField                                                 *
 *  Purpose:                                                                  *
 *      Plots a square vector field using arrows, centered about the origin.  *
 *  Arguments:                                                                *
 *      vector_field (function Vec2 -> Vec2):                                 *
 *          The vector field to be plotted.                                   *
 *      length (real):                                                        *
 *          Half the width of the plot.                                       *
 *  Keywords:                                                                 *
 *      ds (real):                                                            *
 *          The displacement between samples.                                 *
 *      arrow_pen (pen):                                                      *
 *          The pen used to draw the arrows.                                  *
 *      arrow (arrowbar):                                                     *
 *          The head of the arrow used to draw the vector field.              *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
PlotSquareVectorField(vec2.Vec2 vector_field(vec2.Vec2),
                      real length,
                      real ds = 0.25,
                      pen arrow_pen = default_arrow_pen,
                      arrowbar arrow = default_arrow)
{
    /*  Check for legal inputs.                                               */
    assert(ds > 0.0);
    assert(length > 0.0);

    /*  A square plot is a rectangular plot with width equal height.          */
    PlotRectangularVectorField(
        vector_field,           /*  The vector field that is being plotted.   */
        length,                 /*  Half the width of the plot.               */
        length,                 /*  Half the height of the plot.              */
        dx = ds,                /*  Displacement between horizontal samples.  */
        dy = ds,                /*  Displacement between vertical samples.    */
        arrow_pen = arrow_pen,  /*  Pen used for drawing the arrows.          */
        arrow = arrow           /*  Arrow type used for the vector field plot.*/
    );
}
/*  End of PlotSquareVectorField.                                             */

/******************************************************************************
 *  Function:                                                                 *
 *      VectorFieldSquareBoxPlotWithGridLines                                 *
 *  Purpose:                                                                  *
 *      Plots a square vector field with grid lines.                          *
 *  Arguments:                                                                *
 *      vector_field (function Vec2 -> Vec2):                                 *
 *          The vector field to be plotted.                                   *
 *      length (real):                                                        *
 *          Half the width of the plot.                                       *
 *  Keywords:                                                                 *
 *      ds (real):                                                            *
 *          The displacement between samples.                                 *
 *      arrow_pen (pen):                                                      *
 *          The pen used to draw the arrows.                                  *
 *      arrow (arrowbar):                                                     *
 *          The head of the arrow used to draw the vector field.              *
 *      axis_pen (pen):                                                       *
 *          The pen used for the "axes," which is the outer box.              *
 *      tick_pen (pen):                                                       *
 *          Pen used for the small tick marks along the axes.                 *
 *      grid_pen (pen):                                                       *
 *          Pen used for the grid lines.                                      *
 *      grid_skip (int):                                                      *
 *          The number of points to skip over when drawing tick marks.        *
 *      tick_length (real):                                                   *
 *          Parameter for the size of the tick marks.                         *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void
VectorFieldSquareBoxPlotWithGridLines(vec2.Vec2 vector_field(vec2.Vec2),
                                      real length,
                                      real ds = 0.25,
                                      pen arrow_pen = default_arrow_pen,
                                      arrowbar arrow = default_arrow,
                                      pen axis_pen = bc.default_axis_pen,
                                      pen tick_pen = bc.default_tick_pen,
                                      pen grid_pen = bc.grid.default_grid_pen,
                                      int grid_skip = 1,
                                      real tick_length = 0.1)
{
    /*  Check for legal inputs.                                               */
    assert(ds > 0.0);
    assert(length > 0.0);
    assert(grid_skip > 0);
    assert(tick_length > 0.0);

    /*  Add a box around the drawing, marking the two axes with tick marks.   */
    bc.DrawSquareBoxCoordinatesWithGridLines(
        length,                     /*  Half the width of the square.         */
        axis_pen = axis_pen,        /*  Pen used for the box.                 */
        tick_pen = tick_pen,        /*  Pen used for tick marks on the box.   */
        grid_pen = grid_pen,        /*  Pen used for the grid lines.          */
        grid_skip = grid_skip,      /*  The number of tick marks skipped.     */
        tick_length = tick_length   /*  Length of the individual tick marks.  */
    );

    /*  Draw the vector field on top of the grid lines and box plot.          */
    PlotSquareVectorField(
        vector_field,           /*  The vector field that is being plotted.   */
        length,                 /*  Half the width of the plot.               */
        ds = ds,                /*  Displacement between samples.             */
        arrow_pen = arrow_pen,  /*  Pen used for drawing the arrows.          */
        arrow = arrow           /*  Arrow type used for the vector field plot.*/
    );
}
/*  End of VectorFieldSquareBoxPlotWithGridLines.                             */
