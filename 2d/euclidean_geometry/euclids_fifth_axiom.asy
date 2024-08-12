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
 ******************************************************************************/

/*  Provides a vector struct for drawing lines and curves.                    */
import vec2;

/*  Default pens and parameters for size(256) drawings provided here.         */
import size_256_default_settings as default;

/*  Start and end times for the line between A and C, and B and C.            */
real start = -0.2;
real end = 1.3;

/*  Radius used for drawing arcs used to represent angles.                    */
real angle_length = 0.2;

/*  The three points used for the two lines.                                  */
vec2.Vec2 A = vec2.Vec2(0.0, 1.0);
vec2.Vec2 B = vec2.Vec2(0.0, 0.0);
vec2.Vec2 C = vec2.Vec2(4.0, 0.2);

/*  The start and end points on both lines.                                   */
vec2.Vec2 L0Start = vec2.PointOnLine(start, A, C);
vec2.Vec2 L1Start = vec2.PointOnLine(start, B, C);
vec2.Vec2 L0End = vec2.PointOnLine(end, A, C);
vec2.Vec2 L1End = vec2.PointOnLine(end, B, C);

/*  The angles the two lines make.                                            */
real angle1 = vec2.RelativeAngle(A, B, C);
real angle2 = vec2.RelativeAngle(B, A, C);

/*  Factor for converting from radians to degrees.                            */
real r2d = 0.017453292519943295;

/*  Draw the lines.                                                           */
draw(L0Start.LineTo(L0End));
draw(L1Start.LineTo(L1End));

/*  Draw the perspective line from A to B.                                    */
draw(A.LineTo(B));

/*  Mark the angles.                                                          */
draw(vec2.Arc(A, angle_length, 270, 270 + r2d*angle1));
draw(vec2.Arc(B, angle_length, 90,  90 - r2d*angle2));

/*  Mark and label the points.                                                */
A.DrawDot(default.dot_radius);
B.DrawDot(default.dot_radius);
C.DrawDot(default.dot_radius);
A.AddLabel("$A$", vec2.NorthEast);
B.AddLabel("$B$", vec2.SouthEast);
C.AddLabel("$C$", vec2.North);
