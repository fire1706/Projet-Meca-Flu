function [P] = Pression(u, v)

    rho = 1000;
    taille = size(u);
    
    for i=1: taille(1)
        for j=1:taille(2)
            P(i, j) = rho*sqrt(u(i,j)*u(i,j)+v(i,j)*v(i,j))/2;
        end
    end
end