size(256);

draw((0.0, 1.5){NE} .. (4.0, 1.5){SE}, blue);
draw((0.0, 1.5){SE} .. (4.0, 1.5){NE}, blue);
draw((0.0, 1.5) -- (1.0, 0.0) -- (2.0, 0.0) -- (3.0, 0.0), blue);

dot((0.0, 1.5));
dot((4.0, 1.5));

dot((1.0, 0.0));
dot((2.0, 0.0));
dot((3.0, 0.0));
