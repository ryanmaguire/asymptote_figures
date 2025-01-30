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
 *                                 hyperbolic                                 *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides tools for drawing in the hyperbolic plane.                   *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       January 30, 2025                                              *
 ******************************************************************************/
import vec2;
import circle;

circle.Circle HalfPlaneModelCircle(vec2.Vec2 A, vec2.Vec2 B)
{
    real c1, c2;
    real y, m, dist;
    circle.Circle output;

    if (A.x == B.x)
    {
        output.center = A;
        output.radius = 1.0;
        return output;
    }

    c2 = (B.y*B.y - A.y*A.y + B.x*B.x - A.x*A.x) / (2.0*(A.x - B.x));
    c1 = A.y*A.y + (A.x + c2)*(A.x + c2);

    m = -(B.x + c2) / sqrt(c1 - (B.x + c2)*(B.x + c2));
    y = B.y + m*(A.x - B.x);

    output.center = vec2.Vec2(A.x, y);
    output.radius = output.center.DistanceTo(B);

    return output;
}

vec2.Vec2 HalfPlaneModelCenterOfLine(vec2.Vec2 A, vec2.Vec2 B)
{
    vec2.Vec2 midpoint = vec2.Midpoint(A, B);
    vec2.Vec2 velocity = (B - A).Orthogonal();

    return vec2.LinearIntersection(vec2.Origin, vec2.West, midpoint, velocity);
}

vec2.Vec2 HalfPlaneModelPointOnLine(real t, vec2.Vec2 A, vec2.Vec2 B)
{
    real c1, c2;
    real x, y;

    x = A.x*(1.0-t) + B.x*t;
    if (A.x != B.x)
    {
        c2 = (B.y*B.y - A.y*A.y + B.x*B.x - A.x*A.x)/(2.0*(A.x - B.x));
        c1 = A.y*A.y + (A.x+ c2)*(A.x + c2);

        y = sqrt(c1 - (x+c2)*(x+c2));
    }
    else
        y = A.y*(1.0-t) + B.y*t;

    return vec2.Vec2(x, y);
}

path HalfPlaneLineSegment(vec2.Vec2 A, vec2.Vec2 B)
{
    vec2.Vec2 center = HalfPlaneModelCenterOfLine(A, B);
    real start = (A - center).PolarAngle();
    real end = (B - center).PolarAngle();
    real radius = center.DistanceTo(A);
    real dpr = 180.0 / pi;

    return vec2.Arc(center, radius, dpr * start, dpr * end);
}

path HalfPlaneTriangle(vec2.Vec2 A, vec2.Vec2 B, vec2.Vec2 C)
{
    path g1 = HalfPlaneLineSegment(A, B);
    path g2 = HalfPlaneLineSegment(B, C);
    path g3 = HalfPlaneLineSegment(C, A);
    path g = g1 -- g2 -- g3 -- cycle;
    return g;
}
