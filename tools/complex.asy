/******************************************************************************
 *                                  LICENSE                                   *
 ******************************************************************************
 *  This file is part of Mathematics-and-Physics.                             *
 *                                                                            *
 *  Mathematics-and-Physics is free software: you can redistribute it and/or  *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  Mathematics-and-Physics is distributed in the hope that it will be useful *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with Mathematics-and-Physics.  If not, see                          *
 *  <https://www.gnu.org/licenses/>.                                          *
 ******************************************************************************
 *                                  complex                                   *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides a complex number struct.                                     *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       September 17, 2023                                            *
 ******************************************************************************/

import vec2;

/*  Struct for points in the complex plane.                                   */
struct Complex {

    /*  A complex number is represented as a point in the plane.              */
    vec2.Vec2 point;

    /*  Constructor from two real numbers, the x and y coordinates.           */
    void operator init(real x, real y)
    {
        this.point.x = x;
        this.point.y = y;
    }

    /*  Initializer with no inputs. Set *this* to the origin.                 */
    void operator init()
    {
        this.point.x = 0.0;
        this.point.y = 0.0;
    }

    void operator init(vec2.Vec2 v)
    {
        this.point = v;
    }

    real RealPart()
    {
        return this.point.x;
    }

    real ImagPart()
    {
        return this.point.y;
    }

    real ImaginaryPart() = ImagPart;

    /**************************************************************************
     *  Method:                                                               *
     *      RealProjection                                                    *
     *  Purpose:                                                              *
     *      Computes the projection of *this* onto the real axis.             *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      z_real (Complex):                                                 *
     *          The real projection of *this*.                                *
     *  Method:                                                               *
     *      Zero out the imaginary part, return (this.re, 0).                 *
     **************************************************************************/
    Complex RealProjection()
    {
        return Complex(this.point.x, 0.0);
    }

    /**************************************************************************
     *  Method:                                                               *
     *      ImagProjection                                                    *
     *  Purpose:                                                              *
     *      Computes the projection of *this* onto the imaginary axis.        *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      z_imag (Complex):                                                 *
     *          The imaginary projection of *this*.                           *
     *  Method:                                                               *
     *      Zero out the real part, return (0, this.im).                      *
     **************************************************************************/
    Complex ImagProjection()
    {
        return Complex(0.0, this.point.y);
    }

    /*  Verbose alias for the imaginary projection function.                  */
    Complex ImaginaryProjection() = ImagProjection;

    /**************************************************************************
     *  Method:                                                               *
     *      AbsSq                                                             *
     *  Purpose:                                                              *
     *      Computes the square of the modulus of the complex number.         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      mod_sq (real):                                                    *
     *          The square of the distance from the origin to *this*.         *
     *  Method:                                                               *
     *      Use the Pythagorean formula.                                      *
     *                                                                        *
     *          ||P||^2 = ||x + iy||^2                                        *
     *                  = x^2 + y^2                                           *
     *                                                                        *
     *      Compute this and return.                                          *
     **************************************************************************/
    real AbsSq()
    {
        return this.point.NormSq();
    }
    /*  End of AbsSq.                                                         */

    /**************************************************************************
     *  Method:                                                               *
     *      Abs                                                               *
     *  Purpose:                                                              *
     *      Compute the modulus of the complex number.                        *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      mod (real):                                                       *
     *          The distance from the origin to *this*.                       *
     *  Method:                                                               *
     *      Use the Pythagorean formula.                                      *
     *                                                                        *
     *          ||P|| = ||x + iy||                                            *
     *                = sqrt(x^2 + y^2)                                       *
     *                                                                        *
     *      Compute this and return.                                          *
     **************************************************************************/
    real Abs()
    {
        return this.point.Norm();
    }
    /*  End of Abs.                                                           */

    /**************************************************************************
     *  Method:                                                               *
     *      Argument                                                          *
     *  Purpose:                                                              *
     *      Computes the angle the point makes with the positive real axis.   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      theta (real):                                                     *
     *          The angle *this* makes with the positive real axis.           *
     *  Method:                                                               *
     *      The angle can be computed with the atan2 function. Given x + iy   *
     *      in the complex plane, return the value atan2(y, x).               *
     **************************************************************************/
    real Argument()
    {
        return this.point.PolarAngle();
    }
    /*  End of Argument.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      Conjugate                                                         *
     *  Purpose:                                                              *
     *      Computes the complex conjugate of *this*.                         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      z_bar (Complex):                                                  *
     *          The conjugate of *this*.                                      *
     *  Method:                                                               *
     *      Negate this.im.                                                   *
     **************************************************************************/
    Complex Conjugate()
    {
        return Complex(this.point.x, -this.point.y);
    }

    /**************************************************************************
     *  Method:                                                               *
     *      Inverse                                                           *
     *  Purpose:                                                              *
     *      Computes the inverse of *this*.                                   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      z_inv (Complex):                                                  *
     *          The inverse of *this* under complex multiplication.           *
     *  Method:                                                               *
     *      Compute conj(z) / |z|^2, conj being the complex conjugate.        *
     **************************************************************************/
    Complex Inverse()
    {
        real abs_sq = this.AbsSq();
        real factor;

        if (abs_sq == 0.0)
            return Complex(nan, nan);

        factor = 1.0 / abs_sq;

        return Complex(this.point.x * factor, -this.point.y * factor);
    }

    /**************************************************************************
     *  Method:                                                               *
     *      Invert                                                            *
     *  Purpose:                                                              *
     *      Computes the inverse of *this*.                                   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void):                                                      *
     *  Method:                                                               *
     *      Compute conj(z) / |z|^2, conj being the complex conjugate.        *
     **************************************************************************/
    void Invert()
    {
        real abs_sq = this.AbsSq();
        real factor;

        if (abs_sq == 0.0)
        {
            this.point.x = nan;
            this.point.y = nan;
        }

        else
        {
            factor = 1.0 / abs_sq;

            this.point.x *= factor;
            this.point.y *= -factor;
        }
    }

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitNormal                                                      *
     *  Purpose:                                                              *
     *      Normalizes a non-zero complex number to unit magnitude.           *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      w (Complex):                                                      *
     *          The unit complex number pointing in the direction of *this*.  *
     *  Method:                                                               *
     *      Scale *this* by the reciprocal of its norm.                       *
     **************************************************************************/
    Complex AsUnitNormal()
    {
        return Complex(this.point.AsUnitNormal());
    }
    /*  End of AsUnitNormal.                                                  */

    /**************************************************************************
     *  Method:                                                               *
     *      Normalize                                                         *
     *  Purpose:                                                              *
     *      Normalizes a non-zero complex number to unit magnitude.           *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Scale *this* by the reciprocal of its norm.                       *
     **************************************************************************/
    void Normalize()
    {
        this.point.Normalize();
    }
    /*  End of Normalize.                                                     */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthogonal                                                        *
     *  Purpose:                                                              *
     *      Computes a complex number orthogonal to *this* of equal magnitude.*
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      ortho (Complex):                                                  *
     *          A complex number that is orthogonal to *this* with the        *
     *          same magnitude.                                               *
     *  Method:                                                               *
     *      Return (-this.im, this.re). This follows the right-hand rule.     *
     **************************************************************************/
    Complex Orthogonal()
    {
        return Complex(this.point.Orthogonal());
    }
    /*  End of Orthogonal.                                                    */

    /*  Alias for the Orthogonal function.                                    */
    Complex AsOrthogonal() = Orthogonal;

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitOrthogonal                                                  *
     *  Purpose:                                                              *
     *      Computes a complex number orthogonal to *this* of unit magnitude. *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      unit_ortho (Complex):                                             *
     *          A complex number that is orthogonal to *this* and unit length.*
     *  Method:                                                               *
     *      Normalize (-this.re, this.im). This follows the right-hand rule.  *
     **************************************************************************/
    Complex AsUnitOrthogonal()
    {
        return this.Orthogonal().AsUnitNormal();
    }
    /*  End of AsUnitOrthogonal.                                              */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthogonalize                                                     *
     *  Purpose:                                                              *
     *      Computes a complex number orthogonal to *this* with equal modulus.*
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Return (-this.im, this.re). This follows the right-hand rule.     *
     **************************************************************************/
    void Orthogonalize()
    {
        this.point.Orthogonalize();
    }
    /*  End of Orthogonalize.                                                 */

    /**************************************************************************
     *  Method:                                                               *
     *      Orthonormalize                                                    *
     *  Purpose:                                                              *
     *      Computes a complex number orthogonal to *this* of unit modulus.   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      None (void).                                                      *
     *  Method:                                                               *
     *      Normalize (-this.im, this.re). This follows the right-hand rule.  *
     **************************************************************************/
    void Orthonormalize()
    {
        this.point.Orthonormalize();
    }
    /*  End of Orthonormalize.                                                */

    /*  Alias for the Orthonormalize function.                                */
    void UnitOrthogonalize() = Orthonormalize;

    /**************************************************************************
     *  Method:                                                               *
     *      AsPair                                                            *
     *  Purpose:                                                              *
     *      Converts a Complex object into a pair (asymptote primitive).      *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (pair):                                                         *
     *          The ordered pair (this.re, this.im).                          *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    pair AsPair()
    {
        return this.point.AsPair();
    }
    /*  End of AsPair.                                                        */

    /**************************************************************************
     *  Method:                                                               *
     *      LineTo                                                            *
     *  Purpose:                                                              *
     *      Creates a guide for a line from *this* to another point.          *
     *  Arguments:                                                            *
     *      w (Complex):                                                      *
     *          Complex number, the end point of the line starting at *this*. *
     *  Output:                                                               *
     *      g (guide):                                                        *
     *          The line from *this* to w.                                    *
     **************************************************************************/
    guide LineTo(Complex w)
    {
        return this.point.LineTo(w.point);
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
     *  Keywords:                                                             *
     *      offset (pair):                                                    *
     *          Shift paramter for offsetting the center of the anchor.       *
     *  Output:                                                               *
     *      None (void).                                                      *
     **************************************************************************/
    void AddLabel(string L, vec2.Vec2 offset = vec2.Vec2(0.0, 0.0))
    {
        label(L, this.point.AsPair(), offset.AsPair());
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
    void DrawDot(real radius)
    {
        this.point.DrawDot(radius);
    }

    path Circle(real radius)
    {
        return this.point.Circle(radius);
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
    void DrawCircle(real radius)
    {
        this.point.DrawCircle(radius);
    }

    transform Shift()
    {
        return this.point.Shift();
    }
}

/*  Alternative constructor from two real numbers.                            */
Complex FromRect(real x, real y)
{
    return Complex(x, y);
}

/*  Constructor from the polar representation of the point.                   */
Complex FromPolar(real r, real theta)
{
    return Complex(r * cos(theta), r * sin(theta));
}

/*  Convert a pair (native asymptote data type) into a Complex object.        */
Complex FromPair(pair P)
{
    return Complex(P.x, P.y);
}

/*  Default initializer for the Complex struct. Sets the output to the origin.*/
Complex operator init()
{
    /*  The default constructor sets the output to the origin. Use this.      */
    return Complex();
}

/******************************************************************************
 *  Operator:                                                                 *
 *      +                                                                     *
 *  Purpose:                                                                  *
 *      Performs complex addition.                                            *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      w (Complex):                                                          *
 *          Another complex number.                                           *
 *  Output:                                                                   *
 *      sum (Complex):                                                        *
 *          The complex sum of z and w.                                       *
 *  Method:                                                                   *
 *      Complex addition is performed component-wise. That is:                *
 *                                                                            *
 *          z + w = (zx + izy) + (wx + iwy)                                   *
 *                = (zx + wx) + i (zy + wy)                                   *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator + (Complex z, Complex w)
{
    return Complex(z.point.x + w.point.x, z.point.y + w.point.y);
}

Complex operator + (Complex z, real x)
{
    return Complex(z.point.x + x, z.point.y);
}

Complex operator + (real x, Complex z)
{
    return Complex(x + z.point.x, z.point.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      -                                                                     *
 *  Purpose:                                                                  *
 *      Performs complex subtraction.                                         *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      w (Complex):                                                          *
 *          Another complex number.                                           *
 *  Output:                                                                   *
 *      diff (Complex):                                                       *
 *          The complex difference of z and w.                                *
 *  Method:                                                                   *
 *      Complex addition is performed component-wise. That is:                *
 *                                                                            *
 *          z - w = (zx + izy) - (wx + iwy)                                   *
 *                = (zx - wx) + i (zy - wy)                                   *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator - (Complex z, Complex w)
{
    return Complex(z.point.x - w.point.x, z.point.y - w.point.y);
}

Complex operator - (Complex z, real x)
{
    return Complex(z.point.x - x, z.point.y);
}

Complex operator - (real x, Complex z)
{
    return Complex(x - z.point.x, -z.point.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the left.           *
 *  Arguments:                                                                *
 *      a (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *  Output:                                                                   *
 *      az (Complex):                                                         *
 *          The scalar product of a and z.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          a*z = a*(x + iy)                                                  *
 *              = ax + i ay                                                   *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator * (real a, Complex z)
{
    return Complex(a*z.point.x, a*z.point.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the right.          *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      a (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *  Output:                                                                   *
 *      az (Complex):                                                         *
 *          The scalar product of a and z.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          a*z = a*(x + iy)                                                  *
 *              = ax + i ay                                                   *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator * (Complex z, real a)
{
    return Complex(a*z.point.x, a*z.point.y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs complex multiplication.                                      *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      w (Complex):                                                          *
 *          Another complex number.                                           *
 *  Output:                                                                   *
 *      zw (Complex):                                                         *
 *          The product of z and w.                                           *
 *  Method:                                                                   *
 *      Multiplication is performed using the distributive law and i^2 = -1.  *
 *                                                                            *
 *          z*w = (zx + i zy) * (wx + i wy)                                   *
 *              = (zx * wx - zy * wy) + i (zx * wy + zy * wx)                 *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator * (Complex z, Complex w)
{
    real x = z.point.x*w.point.x - z.point.y*w.point.y;
    real y = z.point.x*w.point.y + z.point.y*w.point.x;
    return Complex(x, y);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs complex division.                                            *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      w (Complex):                                                          *
 *          Another complex number.                                           *
 *  Output:                                                                   *
 *      z_by_w (Complex):                                                     *
 *          The complex division of z and w.                                  *
 *  Method:                                                                   *
 *      Compute z * (1 / w) = z * conj(w) / |w|^2.                            *
 ******************************************************************************/
Complex operator / (Complex z, Complex w)
{
    real w_abs_sq = w.AbsSq();
    real factor, re, im;

    if (w_abs_sq == 0.0)
        return Complex(nan, nan);

    factor = 1.0 / w_abs_sq;

    re = factor * (z.point.x*w.point.x + z.point.y*w.point.y);
    im = factor * (-z.point.x*w.point.y + z.point.y*w.point.x);

    return Complex(re, im);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar division.                                             *
 *  Arguments:                                                                *
 *      z (Complex):                                                          *
 *          A complex number.                                                 *
 *      a (real):                                                             *
 *          A real number, the scalar divider.                                *
 *  Output:                                                                   *
 *      z_by_a (Complex):                                                     *
 *          The scalar product of 1/a and z.                                  *
 *  Method:                                                                   *
 *      Scalar division is performed component-wise. That is:                 *
 *                                                                            *
 *          z/a = (x + iy)/a                                                  *
 *              = (x/a) + i (y/a)                                             *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Complex operator / (Complex z, real a)
{
    /*  Variable for 1 / r. We need to check if this is safe to compute.      */
    real rcpr;

    /*  If the input is zero the result is undefined. Return complex NaN.     */
    if (a == 0.0)
        return Complex(nan, nan);

    /*  Otherwise compute 1 / r and perform scalar multiplication with this.  */
    rcpr = 1.0 / a;
    return Complex(rcpr * z.point.x, rcpr * z.point.y);
}

Complex operator / (real x, Complex z)
{
    real z_abs_sq = z.AbsSq();
    real factor;

    if (z_abs_sq == 0.0)
        return Complex(nan, nan);

    factor = x / z_abs_sq;

    return Complex(factor * z.point.x, -factor * z.point.y);
}

/******************************************************************************
 *  Function:                                                                 *
 *      CurveThroughPoints                                                    *
 *  Purpose:                                                                  *
 *      Creates a smooth curve through points in the plane.                   *
 *  Arguments:                                                                *
 *      v (Complex []):                                                       *
 *          An (ordered) array of points.                                     *
 *  Keywords:                                                                 *
 *      closed (bool):                                                        *
 *          Boolean determining if the returned curve is closed or not.       *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A smooth curve through the points of v.                           *
 ******************************************************************************/
guide CurveThroughPoints(Complex[] z, bool closed = false)
{
    /*  Variable for the output smooth curve.                                 */
    guide g;

    /*  Dummy variable for indexing over the points of v.                     */
    int n;

    /*  We need at least two points to create a curve.                        */
    assert(z.length > 1);

    /*  Initialize the curve using the first two points. If there are only    *
     *  two points, the output curve will be the straight line between these. */
    g = z[0].AsPair() .. z[1].AsPair();

    /*  Loop over the remaining points of v and add them to the curve.        */
    for (n = 2; n < z.length; ++n)
        g = g .. z[n].AsPair();

    /*  If the closed Boolean is set, cycle back to the start of the path.    */
    if (closed)
        g = g .. cycle;

    return g;
}
/*  End of CurveThroughPoints.                                                */

guide ClosedCurveThroughPoints(Complex[] z)
{
    return CurveThroughPoints(z, true);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      cast                                                                  *
 *  Purpose:                                                                  *
 *      Converts a pair to a Complex object.                                  *
 *  Arguments:                                                                *
 *      P (pair):                                                             *
 *          A point in the plane.                                             *
 *  Output:                                                                   *
 *      v (Complex):                                                          *
 *          The same point as a vector.                                       *
 ******************************************************************************/
Complex operator cast(pair P)
{
    return FromPair(P);
}
/*  End of cast.                                                              */

/******************************************************************************
 *  Operator:                                                                 *
 *      cast                                                                  *
 *  Purpose:                                                                  *
 *      Converts a pair to a Vec2 object.                                     *
 *  Arguments:                                                                *
 *      P (Vec2):                                                             *
 *          A point in the plane.                                             *
 *  Output:                                                                   *
 *      v (Complex):                                                          *
 *          The same point as a vector.                                       *
 ******************************************************************************/
Complex operator cast(Vec2 P)
{
    return FromPair(P.AsPair());
}
/*  End of cast.                                                              */
