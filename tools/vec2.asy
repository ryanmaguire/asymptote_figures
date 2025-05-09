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
 *                                    vec2                                    *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides a 2D vector struct. Experiments with the asymptote language. *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       September 16, 2023                                            *
 ******************************************************************************/

/*  Struct for vectors in the plane.                                          */
struct Vec2 {

    /*  A point in the plane is represented by Cartesian coordinates.         */
    real x, y;

    /*  Constructor from two real numbers, the x and y coordinates.           */
    void operator init(real x, real y)
    {
        this.x = x;
        this.y = y;
    }

    /*  Initializer with no inputs. Set *this* to the origin.                 */
    void operator init()
    {
        this.x = 0.0;
        this.y = 0.0;
    }

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectX                                                          *
     *  Purpose:                                                              *
     *      Projects *this* onto the x axis, treating the output as a vector  *
     *      instead of just a real number.                                    *
     *  Arguments:                                                            *
     *      None.                                                             *
     *  Output:                                                               *
     *      x_proj (Vec2):                                                    *
     *          The projection of *this* onto the x axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (this.x, 0).                                    *
     **************************************************************************/
    Vec2 ProjectX()
    {
        return Vec2(this.x, 0.0);
    }
    /*  End of ProjectX.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectY                                                          *
     *  Purpose:                                                              *
     *      Projects *this* onto the y axis, treating the output as a vector  *
     *      instead of just a real number.                                    *
     *  Arguments:                                                            *
     *      None.                                                             *
     *  Output:                                                               *
     *      y_proj (Vec2):                                                    *
     *          The projection of *this* onto the y axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (0, this.y).                                    *
     **************************************************************************/
    Vec2 ProjectY()
    {
        return Vec2(0.0, this.y);
    }
    /*  End of ProjectY.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      AsString                                                          *
     *  Purpose:                                                              *
     *      Converts the vector into a string that can be printed or          *
     *      displayed as a label on a figure.                                 *
     *  Arguments:                                                            *
     *      None.                                                             *
     *  Output:                                                               *
     *      y_proj (Vec2):                                                    *
     *          The projection of *this* onto the y axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (0, this.y).                                    *
     **************************************************************************/
    string AsString(bool as_int = true)
    {
        string x_string = string(this.x);
        string y_string = string(this.y);

        /*  Return the string with LaTeX math-mode enabled.                   */
        return "$(" + x_string + ",\," + y_string + ")$";
    }
    /*  End of AsString.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      NormSq                                                            *
     *  Purpose:                                                              *
     *      Computes the square of the Euclidean norm, also called the L2     *
     *      norm, of the vector.                                              *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      norm_sq (real):                                                   *
     *          The square of the distance from the origin to *this*.         *
     *  Method:                                                               *
     *      Use the Pythagorean formula.                                      *
     *                                                                        *
     *          ||P||^2 = ||(x, y)||^2                                        *
     *                  = x^2 + y^2                                           *
     *                                                                        *
     *      Compute this and return.                                          *
     **************************************************************************/
    real NormSq()
    {
        return this.x*this.x + this.y*this.y;
    }
    /*  End of NormSq.                                                        */

    /**************************************************************************
     *  Method:                                                               *
     *      Norm                                                              *
     *  Purpose:                                                              *
     *      Compute the magnitude of the vector.                              *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      norm (real):                                                      *
     *          The distance from the origin to *this*.                       *
     *  Method:                                                               *
     *      Use the Pythagorean formula.                                      *
     *                                                                        *
     *          ||P|| = ||(x, y)||                                            *
     *                = sqrt(x^2 + y^2)                                       *
     *                                                                        *
     *      Compute this and return.                                          *
     **************************************************************************/
    real Norm()
    {
        return sqrt(this.NormSq());
    }
    /*  End of Norm.                                                          */

    /**************************************************************************
     *  Method:                                                               *
     *      PolarAngle                                                        *
     *  Purpose:                                                              *
     *      Computes the angle the vector makes with the positive x axis.     *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      theta (real):                                                     *
     *          The angle *this* makes with the positive x axis.              *
     *  Method:                                                               *
     *      The angle can be computed with the atan2 function. Given (x, y)   *
     *      in the plane, return the value atan2(y, x).                       *
     **************************************************************************/
    real PolarAngle()
    {
        return atan2(this.y, this.x);
    }
    /*  End of PolarAngle.                                                    */

    /**************************************************************************
     *  Method:                                                               *
     *      PositivePolarAngle                                                *
     *  Purpose:                                                              *
     *      Computes the angle the vector makes with the positive x axis.     *
     *      The result is possibly shift by 2 pi to ensure it falls in the    *
     *      interval [0, 2pi).                                                *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      theta (real):                                                     *
     *          The (positive) angle *this* makes with the positive x axis.   *
     *  Method:                                                               *
     *      The angle can be computed with the atan2 function. Given (x, y)   *
     *      in the plane, return the value atan2(y, x).                       *
     **************************************************************************/
    real PositivePolarAngle()
    {
        /*  Get the signed angle for the vector in the plane with the x axis. */
        real angle = this.PolarAngle();

        /*  theta and theta + 2pi represent the same angle on the circle. If  *
         *  theta is negative, shifting by 2 pi will make it positive since   *
         *  -pi < theta <= pi. Do this to ensure the result is non-negative.  */
        if (angle < 0.0)
            return angle + 2.0 * pi;

        /*  Otherwise we have 0 <= theta <= pi. We can just return the angle. */
        return angle;
    }
    /*  End of PositivePolarAngle.                                            */

    /**************************************************************************
     *  Method:                                                               *
     *      Dot                                                               *
     *  Purpose:                                                              *
     *      Computes the Euclidean dot product of *this* with another vector. *
     *  Arguments:                                                            *
     *      v (Vec2):                                                         *
     *          A point in the plane.                                         *
     *  Output:                                                               *
     *      dot_prod (real):                                                  *
     *          The dot product of *this* and v.                              *
     *  Method:                                                               *
     *      Compute the sum of the products of the components.                *
     **************************************************************************/
    real Dot(Vec2 v)
    {
        return this.x*v.x + this.y*v.y;
    }
    /*  End of Dot.                                                           */

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitNormal                                                      *
     *  Purpose:                                                              *
     *      Normalizes a non-zero vector to unit magnitude.                   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      u (Vec2):                                                         *
     *          The unit vector pointing in the direction of *this*.          *
     *  Method:                                                               *
     *      Scale *this* by the reciprocal of its norm.                       *
     **************************************************************************/
    Vec2 AsUnitNormal()
    {
        /*  Avoid division by zero, and a possibly redundant square root      *
         *  call, by computing ||*this*||^2 and checking if it is zero.       */
        real norm_sq = this.NormSq();
        real factor;

        /*  Division by zero is undefined, return a NaN vector.               */
        if (norm_sq == 0.0)
            return Vec2(nan, nan);

        /*  Otherwise compute the scale factor 1 / ||*this*|| and normalize.  */
        factor = 1.0 / sqrt(norm_sq);
        return Vec2(factor*this.x, factor*this.y);
    }
    /*  End of AsUnitNormal.                                                  */

    /**************************************************************************
     *  Method:                                                               *
     *      Normalize                                                         *
     *  Purpose:                                                              *
     *      Normalizes a non-zero vector to unit magnitude.                   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Scale *this* by the reciprocal of its norm.                       *
     **************************************************************************/
    void Normalize()
    {
        /*  Avoid division by zero, and a possibly redundant square root      *
         *  call, by computing ||*this*||^2 and checking if it is zero.       */
        real norm_sq = this.NormSq();
        real factor;

        /*  Division by zero is undefined, set components to NaN.             */
        if (norm_sq == 0.0)
        {
            this.x = nan;
            this.y = nan;
            return;
        }

        /*  Otherwise compute the scale factor 1 / ||*this*|| and normalize.  */
        factor = 1.0 / sqrt(norm_sq);
        this.x *= factor;
        this.y *= factor;
    }
    /*  End of Normalize.                                                     */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthogonal                                                        *
     *  Purpose:                                                              *
     *      Computes a vector orthogonal to *this* of the same magnitude.     *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      ortho (Vec2):                                                     *
     *          A vector that is orthogonal to *this* with the same magnitude.*
     *  Method:                                                               *
     *      Return (-this.y, this.x). This follows the right-hand rule.       *
     **************************************************************************/
    Vec2 Orthogonal()
    {
        return Vec2(-this.y, this.x);
    }
    /*  End of Orthogonal.                                                    */

    /*  Alias for the Orthogonal function.                                    */
    Vec2 AsOrthogonal() = Orthogonal;

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitOrthogonal                                                  *
     *  Purpose:                                                              *
     *      Computes a vector orthogonal to *this* of unit magnitude.         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      unit_ortho (Vec2):                                                *
     *          A vector that is orthogonal to *this* with unit magnitude.    *
     *  Method:                                                               *
     *      Normalize (-this.y, this.x). This follows the right-hand rule.    *
     **************************************************************************/
    Vec2 AsUnitOrthogonal()
    {
        return this.Orthogonal().AsUnitNormal();
    }
    /*  End of AsUnitOrthogonal.                                              */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthogonalize                                                     *
     *  Purpose:                                                              *
     *      Computes a vector orthogonal to *this* of the same magnitude.     *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Return (-this.y, this.x). This follows the right-hand rule.       *
     **************************************************************************/
    void Orthogonalize()
    {
        /*  Avoid overwriting the data in an unrecoverable way. Save this.x.  */
        real x = this.x;

        /*  Set *this* to an orthogonal vector of the same magnitude.         */
        this.x = -this.y;
        this.y = x;
    }
    /*  End of Orthogonalize.                                                 */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthonormalize                                                    *
     *  Purpose:                                                              *
     *      Computes a vector orthogonal to *this* of unit magnitude.         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Normalize (-this.y, this.x). This follows the right-hand rule.    *
     **************************************************************************/
    void Orthonormalize()
    {
        /*  Use the Orthogonalize and Normalize methods to complete the task. */
        this.Orthogonalize();
        this.Normalize();
    }
    /*  End of Orthonormalize.                                                */

    /*  Alias for the Orthonormalize function.                                */
    void UnitOrthogonalize() = Orthonormalize;

    real DistanceToSquared(Vec2 v)
    {
        real dx = this.x - v.x;
        real dy = this.y - v.y;
        return dx*dx + dy*dy;
    }

    real DistanceTo(Vec2 v)
    {
        return sqrt(this.DistanceToSquared(v));
    }

    /**************************************************************************
     *  Method:                                                               *
     *      AsPair                                                            *
     *  Purpose:                                                              *
     *      Converts a Vec2 object into a pair (asymptote primitive).         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (pair):                                                         *
     *          The ordered pair (this.x, this.y).                            *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    pair AsPair()
    {
        return (this.x, this.y);
    }
    /*  End of AsPair.                                                        */

    /**************************************************************************
     *  Method:                                                               *
     *      EmbedXY                                                           *
     *  Purpose:                                                              *
     *      Converts a Vec2 object into a triple (asymptote primitive).       *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (triple):                                                       *
     *          The ordered triple (this.x, this.y, 0.0).                     *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    triple EmbedXY()
    {
        return (this.x, this.y, 0.0);
    }
    /*  End of EmbedXY.                                                       */

    /**************************************************************************
     *  Method:                                                               *
     *      EmbedXZ                                                           *
     *  Purpose:                                                              *
     *      Converts a Vec2 object into a triple (asymptote primitive).       *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (triple):                                                       *
     *          The ordered triple (this.x, 0.0, this.y).                     *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    triple EmbedXZ()
    {
        return (this.x, 0.0, this.y);
    }
    /*  End of EmbedXZ.                                                       */

    /**************************************************************************
     *  Method:                                                               *
     *      EmbedYZ                                                           *
     *  Purpose:                                                              *
     *      Converts a Vec2 object into a triple (asymptote primitive).       *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (triple):                                                       *
     *          The ordered triple (0.0, this.x, this.y).                     *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    triple EmbedYZ()
    {
        return (0.0, this.x, this.y);
    }
    /*  End of EmbedYZ.                                                       */

    Vec2 Rotate(real theta)
    {
        real cos_theta = cos(theta);
        real sin_theta = sin(theta);

        real x = cos_theta * this.x - sin_theta * this.y;
        real y = sin_theta * this.x + cos_theta * this.y;
        return Vec2(x, y);
    }

    /**************************************************************************
     *  Method:                                                               *
     *      LineTo                                                            *
     *  Purpose:                                                              *
     *      Creates a guide for a line from *this* to another vector.         *
     *  Arguments:                                                            *
     *      v (Vec2):                                                         *
     *          Another vector, the end point of the line starting at *this*. *
     *  Output:                                                               *
     *      g (guide):                                                        *
     *          The line from *this* to v.                                    *
     **************************************************************************/
    guide LineTo(Vec2 v)
    {
        /*  Convert the vectors to pairs and use asymptote primitives.        */
        guide g = this.AsPair() -- v.AsPair();
        return g;
    }
    /*  End of LineTo.                                                        */

    /**************************************************************************
     *  Method:                                                               *
     *      AddLabel                                                          *
     *  Purpose:                                                              *
     *      Adds a label to the figure anchored at *this*.                    *
     *  Arguments:                                                            *
     *      L (string):                                                       *
     *          The label to be added. If a LaTeX math-mode label is being    *
     *          added, then the string should start and end with "$".         *
     *  Output:                                                               *
     *      None (void).                                                      *
     **************************************************************************/
    void AddLabel(string L, Vec2 offset = Vec2(0.0, 0.0), pen p = currentpen)
    {
        label(L, this.AsPair(), offset.AsPair(), p = p);
    }

    /**************************************************************************
     *  Method:                                                               *
     *      DrawDot                                                           *
     *  Purpose:                                                              *
     *      Draws a filled-in black dot centered at *this*.                   *
     *  Arguments:                                                            *
     *      radius (real):                                                    *
     *          The radius of the dot.                                        *
     *  Output:                                                               *
     *      None (void).                                                      *
     **************************************************************************/
    void DrawDot(real radius, pen fillpen = black, pen drawpen = black)
    {
        filldraw(
            circle(this.AsPair(), radius),
            fillpen = fillpen,
            drawpen = drawpen
        );
    }

    path Circle(real radius)
    {
        return circle(this.AsPair(), radius);
    }

    path Ellipse(real xradius, real yradius, real rotation = 0.0)
    {
        path g = rotate(rotation)*ellipse((0.0, 0.0), xradius, yradius);
        return shift(this.x, this.y) * g;
    }

    transform Shift()
    {
        return shift(this.AsPair());
    }

    /**************************************************************************
     *  Method:                                                               *
     *      DrawCircle                                                        *
     *  Purpose:                                                              *
     *      Draws a circle dot centered at *this*.                            *
     *  Arguments:                                                            *
     *      radius (real):                                                    *
     *          The radius of the circle.                                     *
     *  Output:                                                               *
     *      None (void).                                                      *
     **************************************************************************/
    void DrawCircle(real radius, pen draw_pen = defaultpen)
    {
        draw(this.Circle(radius), draw_pen);
    }

    void
    FillDrawCircle(real radius, pen fill_pen, pen draw_pen = defaultpen)
    {
        filldraw(this.Circle(radius), fill_pen, draw_pen);
    }
}

/******************************************************************************
 *  Function:                                                                 *
 *      FromRect                                                              *
 *  Purpose:                                                                  *
 *      Creates a vector from Cartesian, or rectangular, coordinates.         *
 *  Arguments:                                                                *
 *      x (real):                                                             *
 *          The x component of the vector.                                    *
 *      y (real):                                                             *
 *          The y component of the vector.                                    *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          The vector (x, y) in the plane.                                   *
 ******************************************************************************/
Vec2 FromRect(real x, real y)
{
    Vec2 v = new Vec2;
    v.x = x;
    v.y = y;
    return v;
}
/*  End of FromRect.                                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      FromPolar                                                             *
 *  Purpose:                                                                  *
 *      Creates a vector from polar coordinates.                              *
 *  Arguments:                                                                *
 *      r (real):                                                             *
 *          The radial component of the vector.                               *
 *      theta (real):                                                         *
 *          The polar angle of the vector.                                    *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          The point r * e^{i theta} in the plane.                           *
 ******************************************************************************/
Vec2 FromPolar(real r, real theta)
{
    Vec2 v = new Vec2;
    v.x = r * cos(theta);
    v.y = r * sin(theta);
    return v;
}
/*  End of FromPolar.                                                         */

/******************************************************************************
 *  Function:                                                                 *
 *      UnitVectorFromAngle                                                   *
 *  Purpose:                                                                  *
 *      Creates a unit vector from a given polar angle.                       *
 *  Arguments:                                                                *
 *      theta (real):                                                         *
 *          The polar angle of the vector.                                    *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          The point e^{i theta} in the plane.                               *
 ******************************************************************************/
Vec2 UnitVectorFromAngle(real theta)
{
    Vec2 v = new Vec2;
    v.x = cos(theta);
    v.y = sin(theta);
    return v;
}
/*  End of UnitVectorFromAngle.                                               */

/******************************************************************************
 *  Function:                                                                 *
 *      FromPair                                                              *
 *  Purpose:                                                                  *
 *      Creates a vector from a pair (native asymptote type).                 *
 *  Arguments:                                                                *
 *      P (pair):                                                             *
 *          A point in the plane.                                             *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          The point converted to a Vec2 object.                             *
 ******************************************************************************/
Vec2 FromPair(pair P)
{
    Vec2 v = new Vec2;
    v.x = P.x;
    v.y = P.y;
    return v;
}
/*  End of FromPair.                                                          */

/******************************************************************************
 *  Operator:                                                                 *
 *      init                                                                  *
 *  Purpose:                                                                  *
 *      Constructor for Vec2 objects.                                         *
 *  Arguments:                                                                *
 *      None.                                                                 *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          An initialized vector.                                            *
 ******************************************************************************/
Vec2 operator init()
{
    /*  The default constructor sets the output to the origin. Use this.      */
    return Vec2();
}
/*  End of init.                                                              */

real DistanceSquared(Vec2 P, Vec2 Q)
{
    real dx = P.x - Q.x;
    real dy = P.y - Q.y;
    return dx*dx + dy*dy;
}

real Distance(Vec2 P, Vec2 Q)
{
    return sqrt(DistanceSquared(P, Q));
}

/******************************************************************************
 *  Operator:                                                                 *
 *      +                                                                     *
 *  Purpose:                                                                  *
 *      Performs vector addition.                                             *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      u (Vec2):                                                             *
 *          Another vector in the plane.                                      *
 *  Output:                                                                   *
 *      sum (Vec2):                                                           *
 *          The vector sum of v and u.                                        *
 *  Method:                                                                   *
 *      Vector addition is performed component-wise. That is:                 *
 *                                                                            *
 *          v + u = (vx, vy) + (ux, uy)                                       *
 *                = (vx + ux, vy + uy)                                        *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator + (Vec2 v, Vec2 u)
{
    return Vec2(v.x + u.x, v.y + u.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      -                                                                     *
 *  Purpose:                                                                  *
 *      Performs vector subtraction.                                          *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      u (Vec2):                                                             *
 *          Another vector in the plane.                                      *
 *  Output:                                                                   *
 *      diff (Vec2):                                                          *
 *          The vector difference of v and u.                                 *
 *  Method:                                                                   *
 *      Vector subtraction is performed component-wise. That is:              *
 *                                                                            *
 *          v - u = (vx, vy) - (ux, uy)                                       *
 *                = (vx - ux, vy - uy)                                        *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator - (Vec2 v, Vec2 u)
{
    return Vec2(v.x - u.x, v.y - u.y);
}

Vec2 operator - (Vec2 v)
{
    return Vec2(-v.x, -v.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the left.           *
 *  Arguments:                                                                *
 *      r (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *  Output:                                                                   *
 *      rv (Vec2):                                                            *
 *          The scalar product of r and v.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          r*v = r*(vx, vy)                                                  *
 *              = (r*vx, r*vy)                                                *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator * (real r, Vec2 v)
{
    return Vec2(r*v.x, r*v.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the right.          *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      r (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *  Output:                                                                   *
 *      rv (Vec2):                                                            *
 *          The scalar product of r and v.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          v*r = (vx, vy)*r                                                  *
 *              = (vx*r, vy*r)                                                *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator * (Vec2 v, real r)
{
    return Vec2(v.x*r, v.y*r);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar division.                                             *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      r (real):                                                             *
 *          A real number, the scalar divider.                                *
 *  Output:                                                                   *
 *      v_by_r (Vec2):                                                        *
 *          The scalar product of 1/r and v.                                  *
 *  Method:                                                                   *
 *      Scalar division is performed component-wise. That is:                 *
 *                                                                            *
 *          v/r = (vx, vy)/r                                                  *
 *              = (vx/r, vy/r)                                                *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator / (Vec2 v, real r)
{
    /*  Variable for 1 / r. We need to check if this is safe to compute.      */
    real rcpr;

    /*  If the input is zero the result is undefined. Return a NaN vector.    */
    if (r == 0.0)
        return Vec2(nan, nan);

    /*  Otherwise compute 1 / r and perform scalar multiplication with this.  */
    rcpr = 1.0 / r;
    return Vec2(rcpr*v.x, rcpr*v.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs component-wise multiplication.                               *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      u (Vec2):                                                             *
 *          Another vector in the plane.                                      *
 *  Output:                                                                   *
 *      vu (Vec2):                                                            *
 *          The component-wise product of v and u.                            *
 *  Method:                                                                   *
 *      Component-wise multiplication is performed component-wise. That is:   *
 *                                                                            *
 *          v*u = (vx, vy)*(ux, uy)                                           *
 *              = (vx*ux, vy*uy)                                              *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator * (Vec2 v, Vec2 u)
{
    return Vec2(v.x*u.x, v.y*u.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs component-wise division.                                     *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          A vector in the plane.                                            *
 *      u (Vec2):                                                             *
 *          Another vector in the plane.                                      *
 *  Output:                                                                   *
 *      v_by_u (Vec2):                                                        *
 *          The component-wise division of v and u.                           *
 *  Method:                                                                   *
 *      Component-wise division is performed component-wise. That is:         *
 *                                                                            *
 *          v/u = (vx, vy)/(ux, uy)                                           *
 *              = (vx/ux, vy/uy)                                              *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec2 operator / (Vec2 v, Vec2 u)
{
    /*  Avoid division by zero. We'll store a NaN in the output component if  *
     *  the corresponding component for u is zero.                            */
    real x, y;

    /*  Check if we can divide. Return NaN if not.                            */
    if (u.x == 0.0)
        x = nan;
    else
        x = v.x / u.x;

    /*  Similar check for the y-component.                                    */
    if (u.y == 0.0)
        y = nan;
    else
        y = v.y / u.y;

    return Vec2(x, y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      cast                                                                  *
 *  Purpose:                                                                  *
 *      Converts a pair to a Vec2 object.                                     *
 *  Arguments:                                                                *
 *      P (pair):                                                             *
 *          A point in the plane.                                             *
 *  Output:                                                                   *
 *      v (Vec2):                                                             *
 *          The same point as a vector.                                       *
 ******************************************************************************/
Vec2 operator cast(pair P)
{
    return FromPair(P);
}
/*  End of cast.                                                              */

/******************************************************************************
 *  Function:                                                                 *
 *      PolygonThroughPoints                                                  *
 *  Purpose:                                                                  *
 *      Creates a piece-wise linear curve through points in the plane.        *
 *  Arguments:                                                                *
 *      v (Vec2[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Keywords:                                                                 *
 *      closed (bool):                                                        *
 *          Boolean determining if the returned polygon is closed or not.     *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A polygonal curve through the points of v.                        *
 ******************************************************************************/
guide PolygonThroughPoints(Vec2[] v, bool closed = false)
{
    /*  Variable for the polygonal curve. We'll loop through v in a bit.      */
    guide g;

    /*  Dummy variable for indexing over the points in v.                     */
    int n;

    /*  There needs to be at least 2 points to create a curve.                */
    assert(v.length > 1);

    /*  Initialize the curve to start at the zeroth point.                    */
    g = v[0].AsPair();

    /*  Loop through the remaining points of the curve and draw lines.        */
    for (n = 1; n < v.length; ++n)
        g = g -- v[n].AsPair();

    /*  If the closed Boolean is set, cycle back to the start of the path.    */
    if (closed)
        g = g -- cycle;

    return g;
}
/*  End of PolygonThroughPoints.                                              */

/******************************************************************************
 *  Function:                                                                 *
 *      ClosedPolygonThroughPoints                                            *
 *  Purpose:                                                                  *
 *      Creates a closed piece-wise linear curve through points in the plane. *
 *  Arguments:                                                                *
 *      v (Vec2[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A closed polygonal curve through the points of v.                 *
 ******************************************************************************/
guide ClosedPolygonThroughPoints(Vec2[] v)
{
    return PolygonThroughPoints(v, closed = true);
}
/*  End of ClosedPolygonThroughPoints.                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      CurveThroughPoints                                                    *
 *  Purpose:                                                                  *
 *      Creates a smooth curve through points in the plane.                   *
 *  Arguments:                                                                *
 *      v (Vec2[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Keywords:                                                                 *
 *      closed (bool):                                                        *
 *          Boolean determining if the returned curve is closed or not.       *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A smooth curve through the points of v.                           *
 ******************************************************************************/
guide CurveThroughPoints(Vec2[] v, bool closed = false)
{
    /*  Variable for the output smooth curve.                                 */
    guide g;

    /*  Dummy variable for indexing over the points of v.                     */
    int n;

    /*  We need at least two points to create a curve.                        */
    assert(v.length > 1);

    /*  Initialize the curve using the first two points. If there are only    *
     *  two points, the output curve will be the straight line between these. */
    g = v[0].AsPair() .. v[1].AsPair();

    /*  Loop over the remaining points of v and add them to the curve.        */
    for (n = 2; n < v.length; ++n)
        g = g .. v[n].AsPair();

    /*  If the closed Boolean is set, cycle back to the start of the path.    */
    if (closed)
        g = g .. cycle;

    return g;
}
/*  End of CurveThroughPoints.                                                */

/******************************************************************************
 *  Function:                                                                 *
 *      ClosedCurveThroughPoints                                              *
 *  Purpose:                                                                  *
 *      Creates a closed smooth curve through points in the plane.            *
 *  Arguments:                                                                *
 *      v (Vec2[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A closed smooth curve through the points of v.                    *
 ******************************************************************************/
guide ClosedCurveThroughPoints(Vec2[] v)
{
    return CurveThroughPoints(v, closed = true);
}
/*  End of ClosedCurveThroughPoints.                                          */

/*  Useful directions saved as constants.                                     */
Vec2 NorthEast = UnitVectorFromAngle(0.25 * pi);
Vec2 NorthWest = UnitVectorFromAngle(0.75 * pi);
Vec2 SouthWest = UnitVectorFromAngle(1.25 * pi);
Vec2 SouthEast = UnitVectorFromAngle(1.75 * pi);
Vec2 East = Vec2(1.0, 0.0);
Vec2 North = Vec2(0.0, 1.0);
Vec2 West = Vec2(-1.0, 0.0);
Vec2 South = Vec2(0.0, -1.0);
Vec2 Origin = Vec2(0.0, 0.0);

/*  Value used to scale the axes in the ProjectXYZ function below.            */
private real shear_factor = -0.4;

/******************************************************************************
 *  Function:                                                                 *
 *      ResetShear                                                            *
 *  Purpose:                                                                  *
 *      Resets the shear factor to a user defined value.                      *
 *  Arguments:                                                                *
 *      shear (real):                                                         *
 *          The new shear factor.                                             *
 *  Outputs:                                                                  *
 *      None.                                                                 *
 ******************************************************************************/
void ResetShear(real shear)
{
    shear_factor = shear;
}
/*  End of ResetShear.                                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      ProjectXYZ                                                            *
 *  Purpose:                                                                  *
 *      Mimics points in 3D using a 2D canvas by projecting and shearing.     *
 *  Arguments:                                                                *
 *      x (real):                                                             *
 *          The x component of the point.                                     *
 *      y (real):                                                             *
 *          The y component of the point.                                     *
 *      z (real):                                                             *
 *          The z component of the point.                                     *
 *  Outputs:                                                                  *
 *      P (Vec2):                                                             *
 *          The point (x, y, z) representing as a 2D point by projecting.     *
 ******************************************************************************/
Vec2 ProjectXYZ(real x, real y, real z)
{
    /*  The x component is computed from the y and z axes by shearing.        */
    Vec2 X = Vec2(shear_factor*x, shear_factor*x);

    /*  The y and z axes are unchanged by the projection.                     */
    Vec2 Y = Vec2(y, 0.0);
    Vec2 Z = Vec2(0.0, z);

    /*  The final result (the projection) is the sum of the three terms.      */
    return X + Y + Z;
}
/*  End of ProjectXYZ.                                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      DrawDot                                                               *
 *  Purpose:                                                                  *
 *      Draws a dot about a given point in the plane.                         *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          The center of the dot.                                            *
 *      r (real):                                                             *
 *          The radius of the dot.                                            *
 *  Keywords:                                                                 *
 *      fillpen (pen):                                                        *
 *          The pen used to fill in the dot.                                  *
 *      drawpen (pen):                                                        *
 *          The pen used for the outline of the dot.                          *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void DrawDot(Vec2 v, real r, pen fillpen = black, pen drawpen = black)
{
    filldraw(circle(v.AsPair(), r), fillpen = fillpen, drawpen = drawpen);
}
/*  End of DrawDot.                                                           */

/******************************************************************************
 *  Function:                                                                 *
 *      AddLabel                                                              *
 *  Purpose:                                                                  *
 *      Draws a dot about a given point in the plane.                         *
 *  Arguments:                                                                *
 *      v (Vec2):                                                             *
 *          The center of the dot.                                            *
 *      r (real):                                                             *
 *          The radius of the dot.                                            *
 *  Keywords:                                                                 *
 *      fillpen (pen):                                                        *
 *          The pen used to fill in the dot.                                  *
 *      drawpen (pen):                                                        *
 *          The pen used for the outline of the dot.                          *
 *  Outputs:                                                                  *
 *      None (void).                                                          *
 ******************************************************************************/
void AddLabel(picture pic = currentpicture, Label L, Vec2 v,
              align a = NoAlign, pen p = currentpen, filltype f = NoFill)
{
    label(pic = pic, L, v.AsPair(), align = a, p = p, filltype = f);
}
/*  End of AddLabel.                                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      Arc                                                                   *
 *  Purpose:                                                                  *
 *      Creates a path from an arc of a circle.                               *
 *  Arguments:                                                                *
 *      center (Vec2):                                                        *
 *          The center of the arc.                                            *
 *      radius (real):                                                        *
 *          The radius of the arc.                                            *
 *      start_angle (real):                                                   *
 *          The starting angle, in degrees, of the arc.                       *
 *      end_angle (real):                                                     *
 *          The ending angle, in degrees, of the arc.                         *
 *  Outputs:                                                                  *
 *      g (path):                                                             *
 *          The arc on the circle.                                            *
 ******************************************************************************/
path Arc(Vec2 center, real radius, real start_angle, real end_angle)
{
    return arc(center.AsPair(), radius, start_angle, end_angle);
}
/*  End of Arc.                                                               */

/******************************************************************************
 *  Function:                                                                 *
 *      Midpoint                                                              *
 *  Purpose:                                                                  *
 *      Computes the midpoint of two points in the plane.                     *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the plane.                                             *
 *      Q (Vec2):                                                             *
 *          Another point in the plane.                                       *
 *  Outputs:                                                                  *
 *      M (Vec2):                                                             *
 *          The middle of P and Q.                                            *
 ******************************************************************************/
Vec2 Midpoint(Vec2 P, Vec2 Q)
{
    return 0.5 * (P + Q);
}
/*  End of Midpoint.                                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      Angle                                                                 *
 *  Purpose:                                                                  *
 *      Computes the angle two points make with the origin.                   *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the plane.                                             *
 *      Q (Vec2):                                                             *
 *          Another point in the plane.                                       *
 *  Outputs:                                                                  *
 *      theta (real):                                                         *
 *          The angle between P and Q.                                        *
 ******************************************************************************/
real Angle(Vec2 P, Vec2 Q)
{
    return acos(P.Dot(Q) / (P.Norm() * Q.Norm()));
}
/*  End of Angle.                                                             */

/******************************************************************************
 *  Function:                                                                 *
 *      RelativeAngle                                                         *
 *  Purpose:                                                                  *
 *      Computes the angle two points make with respect to another point.     *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the plane.                                             *
 *      Q (Vec2):                                                             *
 *          Another point in the plane.                                       *
 *      C (Vec2):                                                             *
 *          The point the angle is made with respect to.                      *
 *  Outputs:                                                                  *
 *      theta (real):                                                         *
 *          The angle between P and Q with respect to C.                      *
 ******************************************************************************/
real RelativeAngle(Vec2 P, Vec2 Q, Vec2 C)
{
    Vec2 PC = P - C;
    Vec2 QC = Q - C;
    return Angle(PC, QC);
}
/*  End of RelativeAngle.                                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      Arc                                                                   *
 *  Purpose:                                                                  *
 *      Creates a path from an arc of a circle.                               *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point on the circle.                                            *
 *      Q (Vec2):                                                             *
 *          Another point on the circle.                                      *
 *      radius (real):                                                        *
 *          The radius of the circle.                                         *
 *  Outputs:                                                                  *
 *      g (path):                                                             *
 *          The arc on the circle.                                            *
 ******************************************************************************/
path Arc(Vec2 P, Vec2 Q, real radius, bool reflect = false, bool flip = false)
{
    /*  Conversion factor to go from radians to degrees.                      */
    real dpr = 180.0 / pi;

    /*  The center of the chord on the circle containing P and Q.             */
    Vec2 M = Midpoint(P, Q);

    /*  Line representing the chord from P to Q.                              */
    Vec2 PQ = Q - P;

    /*  Orthogonal vector. This points from M to the center of the circle.    */
    Vec2 ortho = PQ.AsUnitOrthogonal();

    /*  The distance from M to the center can be computed using Pythagoras.   *
     *  Since PQC, C being the center of the circle, is an isosceles triangle *
     *  the height is sqrt(r^2 - (d/2)^2) where r is the radius and d is the  *
     *  distance from P to Q. Compute using this.                             */
    real dist = PQ.Norm();
    real shift_val = sqrt(radius * radius - 0.25 * dist * dist);
    real shift = (reflect ? -shift_val : shift_val);

    /*  Compute the location of the center of the circle.                     */
    Vec2 center = M + shift*ortho;

    /*  Treat the center as the origin and compute angles for P and Q.        */
    Vec2 relP = P - center;
    Vec2 relQ = Q - center;
    real start_angle = dpr * relP.PositivePolarAngle();
    real end_angle = dpr * relQ.PositivePolarAngle();

    /*  The arc can be computed from the main arc routine.                    */
    if (flip)
        return Arc(center, radius, start_angle, end_angle - 360.0);

    return Arc(center, radius, start_angle, end_angle);
}
/*  End of Arc.                                                               */

/******************************************************************************
 *  Function:                                                                 *
 *      PointOnLine                                                           *
 *  Purpose:                                                                  *
 *      Computes the point on a line parameterized by two fixed points.       *
 *  Arguments:                                                                *
 *      t (real):                                                             *
 *          The time parameter corresponding to the desired point.            *
 *      P (Vec2):                                                             *
 *          The starting point for the line, corresponding to t = 0.          *
 *      Q (Vec2):                                                             *
 *          The finishing point for the line, corresponding to t = 1.         *
 *  Output:                                                                   *
 *      out (Vec2):                                                           *
 *          The point (1-t)P + tQ.                                            *
 *  Method:                                                                   *
 *      Compute (1-t)*P and t*Q and then compute their sum.                   *
 ******************************************************************************/
Vec2 PointOnLine(real t, Vec2 P, Vec2 Q)
{
    Vec2 X0 = (1.0 - t) * P;
    Vec2 X1 = t * Q;
    return X0 + X1;
}
/*  End of PointOnLine.                                                       */

/******************************************************************************
 *  Function:                                                                 *
 *      PlaneToDisk                                                           *
 *  Purpose:                                                                  *
 *      Provides an explicit smooth transformation of the Euclidean plane to  *
 *      the unit disk (i.e. a diffeomorphism).                                *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the Euclidean plane.                                   *
 *  Output:                                                                   *
 *      out (Vec2):                                                           *
 *          The point P transformed to the unit disk.                         *
 *  Method:                                                                   *
 *      Compute 1 / (1 + ||P||^2) and scale the input by this.                *
 ******************************************************************************/
Vec2 PlaneToDisk(Vec2 P)
{
    real norm_squared = P.NormSq();
    real factor = 1.0 / (1.0 + norm_squared);
    return factor * P;
}
/*  End of PlaneToDisk.                                                       */

/******************************************************************************
 *  Function:                                                                 *
 *      AreCollinear                                                          *
 *  Purpose:                                                                  *
 *      Determines if three points in the plane are collinear.                *
 *  Arguments:                                                                *
 *      O (Vec2):                                                             *
 *          A point in the Euclidean plane.                                   *
 *      P (Vec2):                                                             *
 *          Another point in the Euclidean plane.                             *
 *      Q (Vec2):                                                             *
 *          A third point in the Euclidean plane.                             *
 *  Output:                                                                   *
 *      are_collinear (bool):                                                 *
 *          True if OP and OQ are collinear, false otherwise.                 *
 *  Method:                                                                   *
 *      Compute the determinant of the matrix formed by the column vectors    *
 *      OP and OQ.                                                            *
 ******************************************************************************/
bool AreCollinear(Vec2 O, Vec2 P, Vec2 Q)
{
    /*  To determine if O, P, and Q are collinear, we need the vectors OP and *
     *  OQ. Compute this using the extracted values.                          */
    real a = P.x - O.x;
    real b = Q.x - O.x;
    real c = P.y - O.y;
    real d = Q.y - O.y;

    /*  Consider the following matrix:                                        *
     *                                                                        *
     *           -                    -                                       *
     *          |  Px - Ox    Qx - Ox  |                                      *
     *      A = |  Py - Oy    Qy - Oy  |                                      *
     *           -                    -                                       *
     *                                                                        *
     *           -        -                                                   *
     *          |  a    b  |                                                  *
     *        = |  c    d  |                                                  *
     *           -        -                                                   *
     *                                                                        *
     *  This matrix is the linear transformation that takes the standard unit *
     *  vectors (1, 0) and (0, 1) to the relative position vector OP and OQ.  *
     *  OP and OQ are collinear if and only if this matrix is singular,       *
     *  meaning the determinant is zero. Compute this.                        */
    real det = a*d - b*c;

    /*  det is zero if and only if the points are collinear. Check this.      */
    if (det == 0.0)
        return true;

    /*  Otherwise the three points describe a (non-degenerate) plane.         */
    return false;
}
/*  End of AreCollinear.                                                      */

/******************************************************************************
 *  Function:                                                                 *
 *      LinearIntersection                                                    *
 *  Purpose:                                                                  *
 *      Determines where two lines intersect.                                 *
 *  Arguments:                                                                *
 *      O (Vec2):                                                             *
 *          A point in the Euclidean plane.                                   *
 *      P (Vec2):                                                             *
 *          Another point in the Euclidean plane.                             *
 *      Q (Vec2):                                                             *
 *          A third point in the Euclidean plane.                             *
 *  Output:                                                                   *
 *      center (Vec2):                                                        *
 *          The center of O, P, and Q.                                        *
 *  Method:                                                                   *
 *      Find the bisectors of the line segments AB and AC, compute the        *
 *      vectors orthogonal to AB and AC, and then find where the lines        *
 *      described by the vectors intersect.                                   *
 ******************************************************************************/
Vec2 LinearIntersection(Vec2 P0, Vec2 V0, Vec2 P1, Vec2 V1)
{
    /*  Declare necessary variables.                                          */
    real diffx, diffy, t0, intersectx, intersecty, inva, invb, rcpr_det;

    /*  We will solve this by finding the solution to t0*V0 - t1*V1 = P1 - P0 *
     *  and then return P0 + t0*V0. To do this we'll set this up as a matrix  *
     *  equation, so first we'll compute the matrix values.                   */
    real a = V0.x;
    real b = -V1.x;
    real c = V0.y;
    real d = -V1.y;

    /*  The solution exists if and only if the determinant is non-zero.       */
    real det = a*d - b*c;
    assert(det != 0.0);

    /*  If the determinant is non-zero, compute the upper row of the inverse  *
     *  matrix. We will not need the bottom row.                              */
    rcpr_det = 1.0 / det;
    inva = d * rcpr_det;
    invb = -b * rcpr_det;

    /*  The right-side of the equation is P1 - P0, so compute this.           */
    diffx = P1.x - P0.x;
    diffy = P1.y - P0.y;

    /*  Solve for t0, the "time" of the intersection in the parametrization.  */
    t0 = inva*diffx + invb*diffy;

    /*  Compute the intersection using t0 and return.                         */
    intersectx = P0.x + t0*V0.x;
    intersecty = P0.y + t0*V0.y;
    return Vec2(intersectx, intersecty);
}
/*  End of LinearIntersection.                                                */

/******************************************************************************
 *  Function:                                                                 *
 *      FindCenter                                                            *
 *  Purpose:                                                                  *
 *      Determines the center of three non-collinear points.                  *
 *  Arguments:                                                                *
 *      O (Vec2):                                                             *
 *          A point in the Euclidean plane.                                   *
 *      P (Vec2):                                                             *
 *          Another point in the Euclidean plane.                             *
 *      Q (Vec2):                                                             *
 *          A third point in the Euclidean plane.                             *
 *  Output:                                                                   *
 *      center (Vec2):                                                        *
 *          The center of O, P, and Q.                                        *
 *  Method:                                                                   *
 *      Find the bisectors of the line segments AB and AC, compute the        *
 *      vectors orthogonal to AB and AC, and then find where the lines        *
 *      described by the vectors intersect.                                   *
 ******************************************************************************/
Vec2 FindCenter(Vec2 A, Vec2 B, Vec2 C)
{
    Vec2 U, V, dU, dV, center;

    /*  For O, P, and Q to describe a circle, the points must not fall on the *
     *  same line. Check for this.                                            */
    assert(!AreCollinear(A, B, C));

    /*  Get the midpoints of two of the pairs of the points. The two you      *
     *  choose does not matter, we'll just use AB and AC.                     */
    U = Midpoint(A, B);
    V = Midpoint(A, C);

    /*  Get the orthogonal vectors to the relative position vectors AB and AC.*/
    dU = (B - A).AsOrthogonal();
    dV = (C - A).AsOrthogonal();

    /*  V and dV describe a line, as do U and dU. The center of ABC is where  *
     *  these two lines intersect.                                            */
    return LinearIntersection(U, dU, V, dV);
}
/*  End of FindCenter.                                                        */
