// Boilerplate stuff.
import settings;
import graph3;
import tube;

if(settings.render < 0)    settings.render    = 8;
if(!settings.multipleView) settings.batchView = false;

settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;

viewportmargin=(2, 2);

currentprojection=perspective(camera = (0, 80, 30), up   = (0, 0, 1),
                              target = (0,  0,  0),  zoom = 0.85);

// Size of the output figure.
size(128);

int samplex = 20;
int sampley = 40;
real pipR = 0.02;

surface s;
material blob = material(diffusepen=gray(0.7),
                          emissivepen=gray(0.2),
                          specularpen=gray(0.2));

material pipe = material(diffusepen=black,
                         emissivepen=gray(0.1),
                         specularpen=gray(0.1));

triple f(pair Z){
    real u = Z.x;
    real v = Z.y;
    triple center = (v*cos(2*pi*v), v*sin(2*pi*v), v);
    real r = 1-v;
    real x = r*cos(u)+center.x;
    real y = r*sin(u)+center.y;
    real z = v;
    return (x, y, z);
}

triple g(real t){return f((t, 0));}
triple h(real t){return f((2*pi*t, t));}

s = surface(f, (0, 0.0), (2pi, 1.0), samplex, sampley, Spline);
draw(s, surfacepen=blob, meshpen=black+linewidth(0.1pt), render(merge=true));

path3 q=graph(g, 0, 2pi, 250, operator ..);
draw(tube(q, scale(pipR)*unitcircle), surfacepen=pipe, render(merge=true));

path3 q=graph(h, 0, 1, 250, operator ..);
draw(tube(q, scale(pipR)*unitcircle), surfacepen=pipe, render(merge=true));

s = shift(f((2pi, 1)))*(scale(pipR, pipR, pipR)*unitsphere);
draw(s, surfacepen=pipe, render(merge=true));
