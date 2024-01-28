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
 *      Draws several curves and shows their winding numbers.                 *
 ******************************************************************************/

/*  Basic complex number struct provided here.                                */
import complex;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Radius of the simple circular curves for winding number +/- 1.            */
real r = 1.0;

/*  Points of which the winding numbers are computed with respect to.         */
complex.Complex A = complex.Complex(0.0, 0.0);
complex.Complex B = complex.Complex(2.9*r, 0.0);
complex.Complex C = complex.Complex(4.7*r, -1.0*r);
complex.Complex D = complex.Complex(2.9*r, -2.5*r);
complex.Complex E = complex.Complex(0.0, -2.5*r);
complex.Complex F = complex.Complex(6.0*r, -0.7*r);

/*  More complicated path to depict a curve with winding number 2.            */
complex.Complex Swirl[] = {
    complex.Complex(0.0, r),
    complex.Complex(0.6*r, 0.0),
    complex.Complex(0.0, -r),
    complex.Complex(-0.6*r, 0.0),
    complex.Complex(0.0, r),
    complex.Complex(0.2*r, 1.1*r),
    complex.Complex(0.0, -1.2*r),
    complex.Complex(-0.2*r, 1.1*r)
};

/*  Create a smooth closed curve through the points in the array.             */
path g = complex.ClosedCurveThroughPoints(Swirl);

/*  Draw all of the curves.                                                   */
draw(reverse(B.Circle(r)), default.mid_sharp_arrow);
draw(D.Circle(r), default.mid_sharp_arrow);
draw(F.Circle(r), default.mid_sharp_arrow);
draw(g, default.mid_sharp_arrow);
draw(E.Shift()*reverse(g), default.mid_sharp_arrow);

/*  Indicate the chosen points for each curve.                                */
A.DrawDot(default.dot_radius);
B.DrawDot(default.dot_radius);
C.DrawDot(default.dot_radius);
D.DrawDot(default.dot_radius);
E.DrawDot(default.dot_radius);

/*  Label the winding numbers.                                                */
A.AddLabel("$-2$", S);
B.AddLabel("$-1$", S);
C.AddLabel("$0$", S);
D.AddLabel("$+1$", S);
E.AddLabel("$+2$", S);
