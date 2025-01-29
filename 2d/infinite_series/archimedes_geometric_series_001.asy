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
 *      Draws nested boxes indicating the sum of 1/2^n, a geometric series.   *
 ******************************************************************************/

/*  Two dimensional vector struct provided here.                              */
import vec2;

/*  Functions for drawing polygonal figures found here.                       */
import path_functions as pf;

/*  Default pens and parameters for size(512) drawings provided here.         */
import size_512_default_settings as default;

/*  Original length of the box.                                               */
real length = 2.0;
real current_length = 0.5 * length;

/*  Integer for indexing over the boxes.                                      */
int n;

/*  Maximum number of boxes we'll draw for the geometric series.              */
int max_boxes = 8;

/*  Integer for the denominator of the LaTeX string for the width of the box. */
int power_of_two = 2;

/*  Scale factor for making the font smaller as the boxes shrink in size.     */
real font_scale = 0.75;
real font_size = 32.0pt;

/*  Loop through and draw the boxes.                                          */
for (n = 0; n < max_boxes; ++n)
{
    /*  Bounds for the small inner box and large outer box.                   */
    real lower = length - 2.0 * current_length;
    real upper = length - current_length;

    /*  The large outer box.                                                  */
    vec2.Vec2 main_box[] = {
        vec2.Vec2(lower, lower),
        vec2.Vec2(lower, length),
        vec2.Vec2(length, length),
        vec2.Vec2(length, lower)
    };

    /*  The small inner box, which will be filled in gray.                    */
    vec2.Vec2 small_box[] = {
        vec2.Vec2(lower, lower),
        vec2.Vec2(upper, lower),
        vec2.Vec2(upper, upper),
        vec2.Vec2(lower, upper)
    };

    /*  Create paths for the two boxes.                                       */
    path main_box_path = pf.PolyFromPoints(main_box, closed = true);
    path small_box_path = pf.PolyFromPoints(small_box, closed = true);

    /*  The large outer box is drawn but not filled in, and the small inner   *
     *  box is shaded gray.                                                   */
    draw(main_box_path);
    filldraw(small_box_path, gray(0.7), black);

    /*  For n = 0, 1, 2, 3, 4, add the label 1 / 2^n to the sides of the box. */
    if (n < 5)
    {
        /*  LaTeX string for 1 / 2^n.                                         */
        string lbl = "$\frac{1}{" + string(power_of_two) + "}$";

        /*  We'll add the labels to the centers for the sides of the box.     */
        vec2.Vec2 mid_horizontal = vec2.Midpoint(small_box[0], small_box[1]);
        vec2.Vec2 mid_vertical = vec2.Midpoint(small_box[0], small_box[3]);

        /*  The font size decreases as the box width gets smaller. Create a   *
         *  new pen with a smaller font for the current box.                  */
        pen label_pen = black + fontsize(font_size);

        /*  Add the labels (offset a bit so they fall outside the box).       */
        mid_horizontal.AddLabel(lbl, vec2.South, label_pen);
        mid_vertical.AddLabel(lbl, vec2.West, label_pen);

        /*  Decrease the font size for the next box.                          */
        font_size *= font_scale;

        /*  Lastly, double the denominator for the LaTeX string.              */
        power_of_two *= 2;
    }

    /*  Decrease the width of the box. We are halving the size each time.     */
    current_length = 0.5 * current_length;
}
/*  End of for-loop drawing all of the boxes.                                 */
