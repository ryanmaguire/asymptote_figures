
size(128);
draw(circle((-0.2, 0.0), 0.2), blue);
draw(circle((-0.3, 0.0), 0.3), blue);

draw((0.0, 0.0){NE} .. (1.0, 0.0){SE}, red);
draw((0.0, 0.0){SE} .. (1.0, 0.0){NE}, red);
filldraw(circle((0.0, 0.0), 0.05), black, black);
filldraw(circle((1.0, 0.0), 0.05), black, black);
