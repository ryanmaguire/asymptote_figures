// Boilerplate stuff.
import graph3;

currentprojection = perspective(
    camera = (0.0, 60.0, 20.0),
    up = (0.0, 0.0, 1.0),
    target = (0.0,  0.0,  0.0),
    zoom = 0.85
);

// Size of the output figure.
size(256);

pen mpen = black;

int samplesx = 10;
int samplesy = 6;
triple O = (0.0, 0.0, 0.0);
triple X = (1.0, 0.0, 0.0);
triple Y = (0.0, 1.0, 0.0);
triple Z = (0.0, 0.0, 1.0);

real[][] T0 = reflect(O, Y, X);
real[][] T1 = reflect(O, Y, Z);

// Material for the xy plane.
material blob = material(
    diffusepen = gray(0.7) + opacity(0.8),
    emissivepen = gray(0.2),
    specularpen = gray(0.1)
);

triple LineSegment(real t, triple A, triple B)
{
    real x = t*A.x + (1.0 - t)*B.x;
    real y = t*A.y + (1.0 - t)*B.y;
    real z = t*A.z + (1.0 - t)*B.z;
    return (x, y, z);
}

triple f(pair t)
{
    triple A = (cos(t.x) + 1.0, sin(t.x), 0.0);
    triple P = (0, 0, 1);
    real lambda = fabs(t.y);
    return LineSegment(lambda, A, P);
}

surface s0 = surface(f, (0.0, -1.0), (2.0*pi, 1.0), samplesx, samplesy, Spline);
surface s1 = T0 * s0;
surface s2 = T1 * s0;
surface s3 = T0 * s2;

draw(s0, surfacepen=blob, meshpen = mpen);
draw(s1, surfacepen=blob, meshpen = mpen);
draw(s2, surfacepen=blob, meshpen = mpen);
draw(s3, surfacepen=blob, meshpen = mpen);
