function [P,x,y] = Pression

    rho = 1000;
    [u,v] = vitesse;
    
    taille = size(u);
    for i=1: taille(1)
        for j=1:taille(2)
            P((i-1)*taille(2)+j) = rho*sqrt(u(i,j)*u(i,j)+v(i,j)*v(i,j))/2;
            x((i-1)*taille(2)+j) = i;
            y((i-1)*taille(2)+j) = j;
        end
    end
end