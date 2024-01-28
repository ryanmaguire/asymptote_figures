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
 *      Commutative diagram that appears in Stanley Chang's lectures on       *
 *      surgery theory.                                                       *
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2 as vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Transforms for shifting later.                                            */
vec2.Vec2 shift1 = vec2.Vec2(1.5, 0.0);
vec2.Vec2 shift2 = vec2.Vec2(1.5, -0.5);

/*  Coordinates for the points.                                               */
vec2.Vec2 M = vec2.Vec2(0.0, 0.0);
vec2.Vec2 BG = vec2.Vec2(1.0, 0.0);
vec2.Vec2 BO = vec2.Vec2(1.0, -1.0);

/*  This label is only used on the third diagram.                             */
vec2.Vec2 GO = vec2.Vec2(4.0, 0.5);

/*  Labels for the functions between nodes.                                   */
Label f = Label("$f$");
Label phi = Label("$\varphi$");
Label tphi = Label("$\tilde{\varphi}$");

/*  Draw the arrows.                                                          */
draw(f, BG.LineTo(BO), E, default.sharp_arrow, default.margins);
draw(phi, M.LineTo(BG), N, default.sharp_arrow, default.margins);
draw(tphi, M.LineTo(BO), SW, default.sharp_arrow, default.margins);

/*  Label points.                                                             */
M.AddLabel("$M$");
BO.AddLabel("$BO$");
BG.AddLabel("$BG$");

/*  Shift the three points to the next diagram in the sequence.               */
M += shift1;
BO += shift1;
BG += shift1;

/*  Draw arrows.                                                              */
draw(f, BG.LineTo(BO), E, default.sharp_arrow, default.margins);
draw("$?$", M.LineTo(BG), N, default.sharp_arrow, default.margins);
draw(tphi, M.LineTo(BO), SW, default.sharp_arrow, default.margins);

/*  Label coordinates.                                                        */
M.AddLabel("$M$");
BO.AddLabel("$BO$");
BG.AddLabel("$BG$");

/*  Another shift. shift2 also shifts down since this last diagram is larger. */
M += shift2;
BO += shift2;
BG += shift2;

/*  Draw the arrows.                                                          */
draw("$f_{1}$", M.LineTo(GO), NW, default.sharp_arrow, default.margins);
draw("$f_{2}$", M.LineTo(BG), S, default.sharp_arrow, default.margins);
draw("$f_{3}$", M.LineTo(BO), SW, default.sharp_arrow, default.margins);
draw("$g_{1}$", GO.LineTo(BG), E, default.sharp_arrow, default.margins);
draw("$g_{2}$", BG.LineTo(BO), E, default.sharp_arrow, default.margins);

/*  Label the points.                                                         */
M.AddLabel("$M$");
BO.AddLabel("$BO$");
BG.AddLabel("$BG$");
GO.AddLabel("$G/O$");
