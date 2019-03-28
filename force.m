function [fx, fy] = force(p, x, y)

h = 0.5;
fx = 0;
fy = 0;

for i=2:length(p)
    if x(i-1) ~= x(i) %si la normale a la surface est dirigee selon y
        fy = fy - (p(i) + p(i-1)) / ( (x(i) - x(i-1)) * h );
    end
    if y(i-1) ~= y(i) %si la normale a la surface est dirigee selon x
        fx = fx + (p(i) + p(i-1)) / ( (y(i) - y(i-1)) * h );
    end
end
end