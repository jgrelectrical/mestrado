function out = verlin(x,n)
Start = 0; % sorry I completely misinterpreted the question xD
End = 12;
Point = x;
% plot(linspace(Start, End, 1e2), repelem(Point, 1e2), '-k')
% text(End - .11, Point + .07, 'Ground', 'Color', 'k')
out = repelem(Point, n);
end