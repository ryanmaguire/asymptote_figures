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
 *                                    vec3                                    *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides a 3D vector struct. Experiments with the asymptote language. *
 ******************************************************************************
 *  Author:     Ryan Maguire                                                  *
 *  Date:       February 1, 2025                                              *
 ******************************************************************************/

import vec2;
import three;

/*  Struct for vectors in Euclidean space.                                    */
struct Vec3 {

    /*  A point in space is represented by Cartesian coordinates.             */
    real x, y, z;

    /*  Constructor from three real numbers, the x, y, and z coordinates.     */
    void operator init(real x, real y, real z)
    {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    /*  Initializer with no inputs. Set *this* to the origin.                 */
    void operator init()
    {
        this.x = 0.0;
        this.y = 0.0;
        this.z = 0.0;
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
     *      x_proj (Vec3):                                                    *
     *          The projection of *this* onto the x axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (this.x, 0, 0).                                 *
     **************************************************************************/
    Vec3 ProjectX()
    {
        return Vec3(this.x, 0.0, 0.0);
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
     *      y_proj (Vec3):                                                    *
     *          The projection of *this* onto the y axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (0, this.y, 0).                                 *
     **************************************************************************/
    Vec3 ProjectY()
    {
        return Vec3(0.0, this.y, 0.0);
    }
    /*  End of ProjectY.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectZ                                                          *
     *  Purpose:                                                              *
     *      Projects *this* onto the z axis, treating the output as a vector  *
     *      instead of just a real number.                                    *
     *  Arguments:                                                            *
     *      None.                                                             *
     *  Output:                                                               *
     *      z_proj (Vec3):                                                    *
     *          The projection of *this* onto the z axis, as a vector.        *
     *  Method:                                                               *
     *      Create the vector (0, 0, this.z).                                 *
     **************************************************************************/
    Vec3 ProjectZ()
    {
        return Vec3(0.0, 0.0, this.z);
    }
    /*  End of ProjectZ.                                                      */

    /**************************************************************************
     *  Method:                                                               *
     *      AsString                                                          *
     *  Purpose:                                                              *
     *      Converts the vector into a string that can be printed or          *
     *      displayed as a label on a figure.                                 *
     *  Arguments:                                                            *
     *      None.                                                             *
     *  Output:                                                               *
     *      vec_string (string):                                              *
     *          The string (x, y, z), with components from *this*.            *
     *  Method:                                                               *
     *      Cast components to strings and return with parentheses added.     *
     **************************************************************************/
    string AsString(bool as_int = true)
    {
        string x_string = string(this.x);
        string y_string = string(this.y);
        string z_string = string(this.z);

        /*  Return the string with LaTeX math-mode enabled.                   */
        return "$(" + x_string + ",\," + y_string + ",\," + z_string + ")$";
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
     *          ||P||^2 = ||(x, y, z)||^2                                     *
     *                  = x^2 + y^2 + z^2                                     *
     *                                                                        *
     *      Compute this and return.                                          *
     **************************************************************************/
    real NormSq()
    {
        return this.x*this.x + this.y*this.y + this.z*this.z;
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
     *          ||P|| = ||(x, y, z)||                                         *
     *                = sqrt(x^2 + y^2 + z^2)                                 *
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
     *      Computes the angle of the azimuthal part (or "xy" part) of *this*.*
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      theta (real):                                                     *
     *          The angle the azimuthal part of *this* makes with the         *
     *          positive x axis.                                              *
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
     *      Computes the angle the azimuthal part makes with the x axis.      *
     *      The result is possibly shift by 2 pi to ensure it falls in the    *
     *      interval [0, 2pi).                                                *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      theta (real):                                                     *
     *          The (positive) angle the azimuthal part of *this* makes with  *
     *          the positive x axis.                                          *
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
     *      v (Vec3):                                                         *
     *          A point in space.                                             *
     *  Output:                                                               *
     *      dot_prod (real):                                                  *
     *          The dot product of *this* and v.                              *
     *  Method:                                                               *
     *      Compute the sum of the products of the components.                *
     **************************************************************************/
    real Dot(Vec3 v)
    {
        return this.x*v.x + this.y*v.y + this.z*v.z;
    }
    /*  End of Dot.                                                           */

    /**************************************************************************
     *  Method:                                                               *
     *      Cross                                                             *
     *  Purpose:                                                              *
     *      Computes the cross product of *this* with another vector.         *
     *  Arguments:                                                            *
     *      v (Vec3):                                                         *
     *          A point in space.                                             *
     *  Output:                                                               *
     *      cross_prod (Vec3):                                                *
     *          The cross product of *this* and v.                            *
     **************************************************************************/
    Vec3 Cross(Vec3 v)
    {
        /*  Compute the components of the cross product.                      */
        real x = this.y*v.z - this.z*v.y;
        real y = this.z*v.x - this.x*v.z;
        real z = this.x*v.y - this.y*v.x;
        return Vec3(x, y, z);
    }
    /*  End of Cross.                                                         */

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitNormal                                                      *
     *  Purpose:                                                              *
     *      Normalizes a non-zero vector to unit magnitude.                   *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      u (Vec3):                                                         *
     *          The unit vector pointing in the direction of *this*.          *
     *  Method:                                                               *
     *      Scale *this* by the reciprocal of its norm.                       *
     **************************************************************************/
    Vec3 AsUnitNormal()
    {
        /*  Avoid division by zero, and a possibly redundant square root      *
         *  call, by computing ||*this*||^2 and checking if it is zero.       */
        real norm_sq = this.NormSq();
        real factor;

        /*  Division by zero is undefined, return a NaN vector.               */
        if (norm_sq == 0.0)
            return Vec3(nan, nan, nan);

        /*  Otherwise compute the scale factor 1 / ||*this*|| and normalize.  */
        factor = 1.0 / sqrt(norm_sq);
        return Vec3(factor*this.x, factor*this.y, factor*this.z);
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
            this.z = nan;
            return;
        }

        /*  Otherwise compute the scale factor 1 / ||*this*|| and normalize.  */
        factor = 1.0 / sqrt(norm_sq);
        this.x *= factor;
        this.y *= factor;
        this.z *= factor;
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
     *      ortho (Vec3):                                                     *
     *          A vector that is orthogonal to *this* with the same magnitude.*
     *  Method:                                                               *
     *      By the hairy ball theorem from topology, there is no continuous   *
     *      function that assigns to each non-zero vector a new non-zero      *
     *      vector that is orthogonal to the first. So we need to ditch       *
     *      continuity. We do the following. For points on the line           *
     *      z = x = -y, return (x, x, 0). Otherwise, return the vector        *
     *      (y + z, z - x, -x - y). The discontinuities will all fall along   *
     *      the line z = x = -y in this case.                                 *
     **************************************************************************/
    Vec3 Orthogonal()
    {
        /*  (y + z, z - x, -x - y) is always orthogonal to (x, y, z), but it  *
         *  may be the zero vector. We'll check for this.                     */
        real a = this.y + this.z;
        real b = this.z - this.x;
        real c = -(this.x + this.y);
        real norm_squared = a*a + b*b + c*c;

        /*  If P lies on the line z = x, y = -x, then the output is zero.     */
        if (norm_squared == 0.0)
        {
            /*  For points (x, -x, x), the vector (x, x, 0) is orthogonal.    */
            real val = this.x * sqrt(1.5);
            return Vec3(val, val, 0.0);
        }

        /*  For all other points not lying on the line z = x, y = -x.         */
        else
        {
            /*  Normalize so that the output and input have the same norm.    */
            real factor = this.Norm() / sqrt(norm_squared);
            return Vec3(a*factor, b*factor, c*factor);
        }
    }
    /*  End of Orthogonal.                                                    */

    /*  Alias for the Orthogonal function.                                    */
    Vec3 AsOrthogonal() = Orthogonal;

    /**************************************************************************
     *  Method:                                                               *
     *      AsUnitOrthogonal                                                  *
     *  Purpose:                                                              *
     *      Computes a vector orthogonal to *this* of unit magnitude.         *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      unit_ortho (Vec3):                                                *
     *          A vector that is orthogonal to *this* with unit magnitude.    *
     *  Method:                                                               *
     *      Normalize (-this.y, this.x). This follows the right-hand rule.    *
     **************************************************************************/
    Vec3 AsUnitOrthogonal()
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
        /*  (y + z, z - x, -x - y) is always orthogonal to (x, y, z), but it  *
         *  may be the zero vector. We'll check for this.                     */
        real a = this.y + this.z;
        real b = this.z - this.x;
        real c = -(this.x + this.y);
        real norm_squared = a*a + b*b + c*c;

        /*  If P lies on the line z = x, y = -x, then the output is zero.     */
        if (norm_squared == 0.0)
        {
            /*  For points (x, -x, x), the vector (x, x, 0) is orthogonal.    */
            real val = this.x * sqrt(1.5);
            this.x = val;
            this.y = val;
            this.z = 0.0;
        }

        /*  For all other points not lying on the line z = x, y = -x.         */
        else
        {
            /*  Normalize so that the output and input have the same norm.    */
            real factor = this.Norm() / sqrt(norm_squared);
            this.x = a*factor;
            this.y = b*factor;
            this.z = c*factor;
        }
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

    real DistanceToSquared(Vec3 v)
    {
        real dx = this.x - v.x;
        real dy = this.y - v.y;
        real dz = this.z - v.z;
        return dx*dx + dy*dy + dz*dz;
    }

    real DistanceTo(Vec3 v)
    {
        return sqrt(this.DistanceToSquared(v));
    }

    /**************************************************************************
     *  Method:                                                               *
     *      AsTriple                                                          *
     *  Purpose:                                                              *
     *      Converts a Vec3 object into a triple (asymptote primitive).       *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      P (triple):                                                       *
     *          The ordered triple (this.x, this.y, this.z).                  *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    triple AsTriple()
    {
        return (this.x, this.y, this.z);
    }
    /*  End of AsPair.                                                        */

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectXY                                                         *
     *  Purpose:                                                              *
     *      Converts a Vec3 object into a Vec2 object.                        *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      Pxy (Vec2):                                                       *
     *          The ordered pair (this.x, this.y).                            *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    vec2.Vec2 ProjectXY()
    {
        return vec2.Vec2(this.x, this.y);
    }
    /*  End of ProjectXY.                                                     */

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectXZ                                                         *
     *  Purpose:                                                              *
     *      Converts a Vec3 object into a Vec2 object.                        *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      Pxz (Vec2):                                                       *
     *          The ordered pair (this.x, this.z).                            *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    vec2.Vec2 ProjectXZ()
    {
        return vec2.Vec2(this.x, this.z);
    }
    /*  End of ProjectXZ.                                                     */

    /**************************************************************************
     *  Method:                                                               *
     *      ProjectYZ                                                         *
     *  Purpose:                                                              *
     *      Converts a Vec3 object into a Vec2 object.                        *
     *  Arguments:                                                            *
     *      None (void).                                                      *
     *  Output:                                                               *
     *      Pxy (Vec2):                                                       *
     *          The ordered pair (this.y, this.z).                            *
     *  Method:                                                               *
     *      Convert *this* into a tuple and return.                           *
     **************************************************************************/
    vec2.Vec2 ProjectYZ()
    {
        return vec2.Vec2(this.y, this.z);
    }
    /*  End of ProjectYZ.                                                     */

    /**************************************************************************
     *  Method:                                                               *
     *      LineTo                                                            *
     *  Purpose:                                                              *
     *      Creates a guide3 for a line from *this* to another vector.        *
     *  Arguments:                                                            *
     *      v (Vec3):                                                         *
     *          Another vector, the end point of the line starting at *this*. *
     *  Output:                                                               *
     *      g (guide3):                                                       *
     *          The line from *this* to v.                                    *
     **************************************************************************/
    guide3 LineTo(Vec3 v)
    {
        /*  Convert the vectors to pairs and use asymptote primitives.        */
        guide3 g = this.AsTriple() -- v.AsTriple();
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
        label(L, this.AsTriple(), offset.AsPair(), p = p);
    }

    transform3 Shift()
    {
        return shift(this.AsTriple());
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
 *      z (real):                                                             *
 *          The z component of the vector.                                    *
 *  Output:                                                                   *
 *      v (Vec3):                                                             *
 *          The vector (x, y, z) in space.                                    *
 ******************************************************************************/
Vec3 FromRect(real x, real y, real z)
{
    return Vec3(x, y, z);
}
/*  End of FromRect.                                                          */

/******************************************************************************
 *  Function:                                                                 *
 *      FromSpherical                                                         *
 *  Purpose:                                                                  *
 *      Creates a vector from polar coordinates.                              *
 *  Arguments:                                                                *
 *      r (real):                                                             *
 *          The radial component of the vector.                               *
 *      theta (real):                                                         *
 *          The polar angle of the vector.                                    *
 *  Output:                                                                   *
 *      v (Vec3):                                                             *
 *          The point (r, phi, theta) in space.                               *
 ******************************************************************************/
Vec3 FromSpherical(real r, real phi, real theta)
{
    real cos_phi = cos(phi);
    real sin_phi = sin(phi);
    real cos_theta = cos(theta);
    real sin_theta = sin(theta);

    real x = r * cos_phi * sin_theta;
    real y = r * sin_phi * sin_theta;
    real z = r * cos_theta;

    return Vec3(x, y, z);
}
/*  End of FromSpherical.                                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      FromTriple                                                            *
 *  Purpose:                                                                  *
 *      Creates a vector from a triple (native asymptote type).               *
 *  Arguments:                                                                *
 *      P (triple):                                                           *
 *          A point in space.                                                 *
 *  Output:                                                                   *
 *      v (Vec3):                                                             *
 *          The point converted to a Vec3 object.                             *
 ******************************************************************************/
Vec3 FromTriple(triple P)
{
    return Vec3(P.x, P.y, P.z);
}
/*  End of FromTriple.                                                        */

/******************************************************************************
 *  Operator:                                                                 *
 *      init                                                                  *
 *  Purpose:                                                                  *
 *      Constructor for Vec3 objects.                                         *
 *  Arguments:                                                                *
 *      None.                                                                 *
 *  Output:                                                                   *
 *      v (Vec3):                                                             *
 *          An initialized vector.                                            *
 ******************************************************************************/
Vec3 operator init()
{
    /*  The default constructor sets the output to the origin. Use this.      */
    return Vec3();
}
/*  End of init.                                                              */

real DistanceSquared(Vec3 P, Vec3 Q)
{
    real dx = P.x - Q.x;
    real dy = P.y - Q.y;
    real dz = P.z - Q.z;
    return dx*dx + dy*dy + dz*dz;
}

real Distance(Vec3 P, Vec3 Q)
{
    return sqrt(DistanceSquared(P, Q));
}

/******************************************************************************
 *  Operator:                                                                 *
 *      +                                                                     *
 *  Purpose:                                                                  *
 *      Performs vector addition.                                             *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      u (Vec3):                                                             *
 *          Another vector in space.                                          *
 *  Output:                                                                   *
 *      sum (Vec3):                                                           *
 *          The vector sum of v and u.                                        *
 *  Method:                                                                   *
 *      Vector addition is performed component-wise. That is:                 *
 *                                                                            *
 *          v + u = (vx, vy, vz) + (ux, uy, uz)                               *
 *                = (vx + ux, vy + uy, vz + uz)                               *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator + (Vec3 v, Vec3 u)
{
    return Vec3(v.x + u.x, v.y + u.y, v.z + u.z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      -                                                                     *
 *  Purpose:                                                                  *
 *      Performs vector subtraction.                                          *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      u (Vec3):                                                             *
 *          Another vector in space.                                          *
 *  Output:                                                                   *
 *      diff (Vec3):                                                          *
 *          The vector difference of v and u.                                 *
 *  Method:                                                                   *
 *      Vector subtraction is performed component-wise. That is:              *
 *                                                                            *
 *          v - u = (vx, vy) - (ux, uy)                                       *
 *                = (vx - ux, vy - uy)                                        *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator - (Vec3 v, Vec3 u)
{
    return Vec3(v.x - u.x, v.y - u.y, v.z - u.z);
}

Vec3 operator - (Vec3 v)
{
    return Vec3(-v.x, -v.y, -v.z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the left.           *
 *  Arguments:                                                                *
 *      r (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *  Output:                                                                   *
 *      rv (Vec3):                                                            *
 *          The scalar product of r and v.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          r*v = r*(vx, vy)                                                  *
 *              = (r*vx, r*vy)                                                *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator * (real r, Vec3 v)
{
    return Vec3(r*v.x, r*v.y, r*v.z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar multiplication with the scalar on the right.          *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      r (real):                                                             *
 *          A real number, the scalar multiplier.                             *
 *  Output:                                                                   *
 *      rv (Vec3):                                                            *
 *          The scalar product of r and v.                                    *
 *  Method:                                                                   *
 *      Scalar multiplication is performed component-wise. That is:           *
 *                                                                            *
 *          v*r = (vx, vy, vz)*r                                              *
 *              = (vx*r, vy*r, vz*r)                                          *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator * (Vec3 v, real r)
{
    return Vec3(v.x*r, v.y*r, v.z*r);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs scalar division.                                             *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      r (real):                                                             *
 *          A real number, the scalar divider.                                *
 *  Output:                                                                   *
 *      v_by_r (Vec3):                                                        *
 *          The scalar product of 1/r and v.                                  *
 *  Method:                                                                   *
 *      Scalar division is performed component-wise. That is:                 *
 *                                                                            *
 *          v/r = (vx, vy)/r                                                  *
 *              = (vx/r, vy/r)                                                *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator / (Vec3 v, real r)
{
    /*  Variable for 1 / r. We need to check if this is safe to compute.      */
    real rcpr;

    /*  If the input is zero the result is undefined. Return a NaN vector.    */
    if (r == 0.0)
        return Vec3(nan, nan, nan);

    /*  Otherwise compute 1 / r and perform scalar multiplication with this.  */
    rcpr = 1.0 / r;
    return Vec3(rcpr*v.x, rcpr*v.y, rcpr*v.z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      *                                                                     *
 *  Purpose:                                                                  *
 *      Performs component-wise multiplication.                               *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      u (Vec3):                                                             *
 *          Another vector in space.                                          *
 *  Output:                                                                   *
 *      vu (Vec3):                                                            *
 *          The component-wise product of v and u.                            *
 *  Method:                                                                   *
 *      Component-wise multiplication is performed component-wise. That is:   *
 *                                                                            *
 *          v*u = (vx, vy, vz)*(ux, uy, uz)                                   *
 *              = (vx*ux, vy*uy, vz*uz)                                       *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator * (Vec3 v, Vec3 u)
{
    return Vec3(v.x*u.x, v.y*u.y, v.z*u.z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      /                                                                     *
 *  Purpose:                                                                  *
 *      Performs component-wise division.                                     *
 *  Arguments:                                                                *
 *      v (Vec3):                                                             *
 *          A vector in space.                                                *
 *      u (Vec3):                                                             *
 *          Another vector in space.                                          *
 *  Output:                                                                   *
 *      v_by_u (Vec3):                                                        *
 *          The component-wise division of v and u.                           *
 *  Method:                                                                   *
 *      Component-wise division is performed component-wise. That is:         *
 *                                                                            *
 *          v/u = (vx, vy)/(ux, uy)                                           *
 *              = (vx/ux, vy/uy)                                              *
 *                                                                            *
 *      Compute this and return.                                              *
 ******************************************************************************/
Vec3 operator / (Vec3 v, Vec3 u)
{
    /*  Avoid division by zero. We'll store a NaN in the output component if  *
     *  the corresponding component for u is zero.                            */
    real x, y, z;

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

    /*  Similar check for the z-component.                                    */
    if (u.z == 0.0)
        z = nan;
    else
        z = v.z / u.z;

    return Vec3(x, y, z);
}

/******************************************************************************
 *  Operator:                                                                 *
 *      cast                                                                  *
 *  Purpose:                                                                  *
 *      Converts a pair to a Vec3 object.                                     *
 *  Arguments:                                                                *
 *      P (pair):                                                             *
 *          A point in space.                                                 *
 *  Output:                                                                   *
 *      v (Vec3):                                                             *
 *          The same point as a vector.                                       *
 ******************************************************************************/
Vec3 operator cast(triple P)
{
    return FromTriple(P);
}
/*  End of cast.                                                              */

/******************************************************************************
 *  Function:                                                                 *
 *      PolygonThroughPoints                                                  *
 *  Purpose:                                                                  *
 *      Creates a piece-wise linear curve through points in space.            *
 *  Arguments:                                                                *
 *      v (Vec3[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Keywords:                                                                 *
 *      closed (bool):                                                        *
 *          Boolean determining if the returned polygon is closed or not.     *
 *  Outputs:                                                                  *
 *      g (guide3):                                                           *
 *          A polygonal curve through the points of v.                        *
 ******************************************************************************/
guide3 PolygonThroughPoints(Vec3[] v, bool closed = false)
{
    /*  Variable for the polygonal curve. We'll loop through v in a bit.      */
    guide3 g;

    /*  Dummy variable for indexing over the points in v.                     */
    int n;

    /*  There needs to be at least 2 points to create a curve.                */
    assert(v.length > 1);

    /*  Initialize the curve to start at the zeroth point.                    */
    g = v[0].AsTriple();

    /*  Loop through the remaining points of the curve and draw lines.        */
    for (n = 1; n < v.length; ++n)
        g = g -- v[n].AsTriple();

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
 *      Creates a closed piece-wise linear curve through points in space.     *
 *  Arguments:                                                                *
 *      v (Vec3[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A closed polygonal curve through the points of v.                 *
 ******************************************************************************/
guide3 ClosedPolygonThroughPoints(Vec3[] v)
{
    return PolygonThroughPoints(v, closed = true);
}
/*  End of ClosedPolygonThroughPoints.                                        */

/******************************************************************************
 *  Function:                                                                 *
 *      CurveThroughPoints                                                    *
 *  Purpose:                                                                  *
 *      Creates a smooth curve through points in space.                       *
 *  Arguments:                                                                *
 *      v (Vec3[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Keywords:                                                                 *
 *      closed (bool):                                                        *
 *          Boolean determining if the returned curve is closed or not.       *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A smooth curve through the points of v.                           *
 ******************************************************************************/
guide3 CurveThroughPoints(Vec3[] v, bool closed = false)
{
    /*  Variable for the output smooth curve.                                 */
    guide3 g;

    /*  Dummy variable for indexing over the points of v.                     */
    int n;

    /*  We need at least two points to create a curve.                        */
    assert(v.length > 1);

    /*  Initialize the curve using the first two points. If there are only    *
     *  two points, the output curve will be the straight line between these. */
    g = v[0].AsTriple() .. v[1].AsTriple();

    /*  Loop over the remaining points of v and add them to the curve.        */
    for (n = 2; n < v.length; ++n)
        g = g .. v[n].AsTriple();

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
 *      Creates a closed smooth curve through points in space.                *
 *  Arguments:                                                                *
 *      v (Vec3[]):                                                           *
 *          An (ordered) array of points.                                     *
 *  Outputs:                                                                  *
 *      g (guide):                                                            *
 *          A closed smooth curve through the points of v.                    *
 ******************************************************************************/
guide3 ClosedCurveThroughPoints(Vec3[] v)
{
    return CurveThroughPoints(v, closed = true);
}
/*  End of ClosedCurveThroughPoints.                                          */

/*  Useful directions saved as constants.                                     */
Vec3 Origin = Vec3(0.0, 0.0, 0.0);

/******************************************************************************
 *  Function:                                                                 *
 *      Midpoint                                                              *
 *  Purpose:                                                                  *
 *      Computes the midpoint of two points in space.                         *
 *  Arguments:                                                                *
 *      P (Vec3):                                                             *
 *          A point in space.                                                 *
 *      Q (Vec3):                                                             *
 *          Another point in space.                                           *
 *  Outputs:                                                                  *
 *      M (Vec3):                                                             *
 *          The middle of P and Q.                                            *
 ******************************************************************************/
Vec3 Midpoint(Vec3 P, Vec3 Q)
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
 *      P (Vec3):                                                             *
 *          A point in space.                                                 *
 *      Q (Vec3):                                                             *
 *          Another point in space.                                           *
 *  Outputs:                                                                  *
 *      theta (real):                                                         *
 *          The angle between P and Q.                                        *
 ******************************************************************************/
real Angle(Vec3 P, Vec3 Q)
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
 *      P (Vec3):                                                             *
 *          A point in space.                                                 *
 *      Q (Vec3):                                                             *
 *          Another point in space.                                           *
 *      C (Vec3):                                                             *
 *          The point the angle is made with respect to.                      *
 *  Outputs:                                                                  *
 *      theta (real):                                                         *
 *          The angle between P and Q with respect to C.                      *
 ******************************************************************************/
real RelativeAngle(Vec3 P, Vec3 Q, Vec3 C)
{
    Vec3 PC = P - C;
    Vec3 QC = Q - C;
    return Angle(PC, QC);
}
/*  End of RelativeAngle.                                                     */

/******************************************************************************
 *  Function:                                                                 *
 *      PointOnLine                                                           *
 *  Purpose:                                                                  *
 *      Computes the point on a line parameterized by two fixed points.       *
 *  Arguments:                                                                *
 *      t (real):                                                             *
 *          The time parameter corresponding to the desired point.            *
 *      P (Vec3):                                                             *
 *          The starting point for the line, corresponding to t = 0.          *
 *      Q (Vec3):                                                             *
 *          The finishing point for the line, corresponding to t = 1.         *
 *  Output:                                                                   *
 *      out (Vec3):                                                           *
 *          The point (1-t)P + tQ.                                            *
 *  Method:                                                                   *
 *      Compute (1-t)*P and t*Q and then compute their sum.                   *
 ******************************************************************************/
Vec3 PointOnLine(real t, Vec3 P, Vec3 Q)
{
    Vec3 X0 = (1.0 - t) * P;
    Vec3 X1 = t * Q;
    return X0 + X1;
}
/*  End of PointOnLine.                                                       */

/*  Compute the equation of a great circle on a sphere of radius r given the  *
 *  vectors pointing in the P and Q directions.                               */

/******************************************************************************
 *  Function:                                                                 *
 *      GreatCircle                                                           *
 *  Purpose:                                                                  *
 *      Given two points on a sphere, computes the point on the great circle  *
 *      containing these points corresponding to time "t".                    *
 *  Arguments:                                                                *
 *      t (real):                                                             *
 *          The time parameter corresponding to the desired point.            *
 *      r (real):                                                             *
 *          The radius of the sphere.                                         *
 *      P (Vec3):                                                             *
 *          A point on the sphere of radius r.                                *
 *      Q (Vec3):                                                             *
 *          Another point on the sphere of radius r.                          *
 *  Output:                                                                   *
 *      out (Vec3):                                                           *
 *          A point on the great circle containing P and Q corresponding to t.*
 ******************************************************************************/
Vec3 GreatCircle(real t, real r, Vec3 P, Vec3 Q)
{
    /*  Get three orthogonal vectors from the inputs P and Q.                 */
    Vec3 e0 = P.AsUnitNormal();
    Vec3 e1 = e0.Cross(Q).AsUnitNormal();
    Vec3 e2 = e1.Cross(P).AsUnitNormal();

    /*  Get the angle between P and Q and scale this by t.                    */
    real theta = Angle(P, Q);
    real tau = t * theta;

    /*  Values for parameterizing the great circle.                           */
    real u = cos(tau);
    real v = sin(tau);

    /*  Compute the output point and return.                                  */
    return r * (u*e0 + v*e2);
}
/*  End of GreatCircle.                                                       */

/*  Compute the stereographic projection of a 3-dimensional vector P. P does  *
 *  not need to lie on the unit sphere, and the stereographic projection will *
 *  occur with respect to the sphere of radius equal to the norm of P.        */
vec2.Vec2 StereographicProjection(Vec3 P)
{
    /*  Declare necessary values.                                             */
    real norm, denom;
    vec2.Vec2 out;

    /*  Compute the norm of P to find the radius of the sphere it lies on.    */
    norm = P.Norm();

    /*  The z component of P cannot be equal to the radius, so check this.    */
    assert(P.z != norm);

    /*  Compute the denominator of the stereographic projection.              */
    denom = norm / (norm - P.z);

    /*  Perform the computation and return.                                   */
    return vec2.Vec2(P.x * denom, P.y * denom);
}

/*  Compute the inverse stereographic projection of a point in the plane.     *
 *  computes the inverse projection with respect to the unit sphere. If you   *
 *  used StereographicProjection on a vector that did not have length 1, this *
 *  will not return it's inverse.                                             */
Vec3 InverseStereographicProjection(vec2.Vec2 P)
{
    /*  Declare necessary variables.                                          */
    real norm, denom, x, y;
    Vec3 out;

    /*  Extract the values from the pair P.                                   */
    x = P.x;
    y = P.y;

    /*  Get the length of the vector P.                                       */
    norm = P.Norm();

    /*  Compute the denominator for the inverse stereographic projection.     */
    denom = 1.0 / (1.0 + norm*norm);

    /*  Compute the corresponding point on the unit sphere and return.        */
    return denom * Vec3(2.0*x, 2.0*y, -1.0 + x*x + y*y);
}

vec2.Vec2 OrthographicProjection(Vec3 P, Vec3 U)
{
    Vec3 V = U.Orthogonal().AsUnitNormal();
    Vec3 W = V.Cross(U).AsUnitNormal();
    real x = P.Dot(V);
    real y = P.Dot(W);
    return vec2.Vec2(x, y);
}

/*  Given a point Q, and a line in the form P + tV, computes the projection   *
 *  of Q onto this line. That is, the closest point on the line to Q.         */
Vec3 ProjectPointToLine(Vec3 Q, Vec3 P, Vec3 V)
{
    /*  Declare necessary variables.                                          */
    real scale;
    Vec3 PQ;

    /*  Compute the norm of V. V needs to be non-zero to unambiguously define *
     *  a straight line, so we'll check for this.                             */
    real norm_squared = V.NormSq();

    assert(norm_squared > 0.0);

    /*  Get the vector pointing from P to Q.                                  */
    PQ = Q - P;

    /*  Compute the scale which is used for the projection of Q onto the line.*/
    scale = PQ.Dot(V) / (norm_squared * norm_squared);

    /*  Compute the x, y, and z values and return.                            */
    return scale * V + P;
}

Vec3 SphericalCircle(real t, real r, Vec3 P, Vec3 Q)
{
    real cos_t, sin_t, factor;

    /*  Normalize P and Q so that they are unit vectors.                      */
    Vec3 Pn = r * P.AsUnitNormal();
    Vec3 Qn = r * Q.AsUnitNormal();

    /*  Project Q onto the line through the origin and P.                     */
    Vec3 proj = ProjectPointToLine(Q, Origin, P);

    /*  Get the vector from the projection point to Q.                        */
    Vec3 projQ = Q - proj;

    /*  The length of projQ is the radius of the circle we wish to compute,   *
     *  with projQ as the center. So compute this value.                      */
    real radius = projQ.Norm();

    /*  Compute the cross product of P and projQ.                             */
    Vec3 cross = P.Cross(projQ);
    real cross_norm = cross.Norm();

    /*  The norm of the cross product should not be zero, so check this.      */
    assert(cross_norm > 0.0);

    /*  Scale factor for the final circle.                                    */
    factor = radius / cross_norm;
    cross = factor * cross;

    /*  Precompute the sine and cosine of t.                                  */
    cos_t = cos(t);
    sin_t = sin(t);

    /*  And lastly, compute the point on the circle corresponding to t.       */
    return  proj + cos_t * projQ + sin_t * cross;
}

guide3
ParametricCurve(Vec3 func(real),
                real a,
                real b,
                int samples,
                bool closed = false)
{
    guide3 g;
    int n;
    real dt = (b - a) / (real)(samples);
    real t = a;

    g = func(t).AsTriple();

    for (n = 1; n < samples; ++n)
    {
        t += dt;
        g = g .. func(t).AsTriple();
    }

    if (closed)
        return g .. cycle;

    return g;
}
