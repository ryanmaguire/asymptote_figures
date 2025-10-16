size(512);

defaultpen(black + linewidth(0.7pt));

pair B0 = (-1.25, 0.4);
pair B1 = (-1.25, 0.6);
pair B2 = (-0.8, 0.6);
pair B3 = (-0.8, 0.4);

pair C0 = (-0.6, 0.7);
pair C1 = (-0.6, 0.3);
pair C2 = (-0.2, 0.3);
pair C3 = (-0.2, 0.7);

axialshade(C0 -- C1 -- C2 -- C3 -- cycle, yellow, (-0.6, 0.5), white, (-0.2, 0.5));
filldraw(B0 -- B1 -- B2 -- B3 -- cycle, black, black);
filldraw(B2{N} .. {E}C0 -- C1{W} .. {N}B3 -- cycle);
filldraw(ellipse((-1.0, 0.5), 0.07, 0.05), gray(0.5));

filldraw(
    (0.0, 1.125) -- (0.75, 0.75) -- (0.75, 0.5) -- (0.0, 0.875) -- cycle,
    gray(0.5),
    black
);

axialshade(
    (1.99, 0.88) -- (2.75, 0.5) -- (2.75, 0.25) -- (1.99, 0.63) -- cycle,
    yellow, (2.75, 0.0),
    gray(0.5), (2.0, 0.0)
);

axialshade(
    (2.01, 0.87) -- (1.74, 1.005) -- (1.74, 0.755) -- (2.01, 0.62) -- cycle,
    0.95 * yellow, (1.76, 0.0),
    gray(0.5), (2.0, 0.0)
);

axialshade(
    (1.76, 0.995) -- (1.49, 1.13) -- (1.49, 0.88) -- (1.76, 0.745) -- cycle,
    0.95 * yellow, (1.74, 0.0),
    gray(0.5), (1.51, 0.0)
);

axialshade(
    (1.51, 1.12) -- (1.25, 1.25) -- (1.25, 1.0) -- (1.51, 0.87) -- cycle,
    0.8 * yellow, (1.25, 0.0),
    gray(0.5), (1.49, 0.0)
);

draw(
    (1.25, 1.25) -- (2.75, 0.5) -- (2.75, 0.25) -- (1.25, 1.0) -- cycle,
    black
);

label("Light Source", (-0.75, 0.2));
label("Gray Screen", (0.375, 1.25));
label("Detector", (2.125, 1.25));
label("Straight-Edge Diffraction", (0.75, 1.75), fontsize(15pt));
