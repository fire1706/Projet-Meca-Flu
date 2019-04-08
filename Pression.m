%------------------------------Function Pression--------------------------%
% Cette fonction nous permet de calculer la pression en tout point. Elle 
% prend en entree les matrices de vitesse horizontal et vertical et sort 
% la matrice des pressions
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
function [P] = Pression(u, v)

    rho = 1000;
    taille = size(u);
    
    for i=1: taille(1)
        for j=1:taille(2)
            P(i, j) = rho*sqrt(u(i,j)*u(i,j)+v(i,j)*v(i,j))/2;
        end
    end
end
