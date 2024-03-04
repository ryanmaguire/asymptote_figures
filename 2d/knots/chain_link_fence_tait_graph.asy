
size(128);
pair A = (0.0, 0.0);
pair B = (0.0, 1.0);

pair V = (1.0, 0.0);
pair U = (-1.0, 0.0);

draw(A -- U, red);
draw(A -- V, red);
draw(V{N} .. B{W}, blue);
draw(U{N} .. B{E}, blue);
draw(V{W} .. B{N}, blue);
draw(U{E} .. B{N}, blue);
draw(V -- B, red);
draw(U -- B, red);

filldraw(circle(A, 0.05), black, black);
filldraw(circle(B, 0.05), black, black);
filldraw(circle(V, 0.05), white, black);
filldraw(circle(U, 0.05), white, black);
