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
 *      Figure for convex geometry made while studying with Dan Klain at UML. *
 *      It features a circle with a rectangle to depict a given projection.   *
 ******************************************************************************/

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Radius of the big circle, length of the axes, and radius of circle        *
 *  that is used to indicate an angle.                                        */
real R = 1.0;
real len = 1.8;
real rAng = 0.2;

/*  Various points on the circle used to draw the rectangle.                  */
pair A = scale(R)*expi(0.75*pi);
pair B = scale(R)*expi(-0.25*pi);
pair D = scale(R)*expi(0.25*pi);
pair X = (len, 0.0);
pair Y = (0.0, len);
pair O = (0.0, 0.0);

/*  Labels for the axes.                                                      */
Label A_Label = Label("$A$", position = 1.0);
Label B_Label = Label("$B$", position = 1.0);

/*  The angle the point D makes.                                              */
real delta = atan(D.y/D.x);

/*  Draw the circle and add axes.                                             */
draw(circle(O, R));
draw(B_Label, O -- X, S, default.thick_pen, default.sharp_arrow);
draw(A_Label, O -- Y, W, default.thick_pen, default.sharp_arrow);

/*  Draw the rectangle.                                                       */
draw(A -- (A + D) -- (B + D) -- B -- cycle);
draw(O -- D);

/*  Add the angle and label.                                                  */
draw("$\delta$", arc(O, rAng, 90, 180*delta/pi), N + 0.5E);
