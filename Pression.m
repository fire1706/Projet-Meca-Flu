%------------------------------Function Pression--------------------------%
% Cette fonction nous permet de calculer la pression en tout point. Elle 
% prend en entree les matrices de vitesse horizontal et vertical et sort 
% la matrice des pressions relatives (par rapport a la pression du fluide
% au repos).
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
function [P] = Pression(u, v)

    rho = 1000; %en kg/m^3
    taille = size(u);
    P = zeros(taille);
    
    for i=1: taille(1)
        for j=1:taille(2)
            P(i, j) = - rho * (u(i,j) * u(i,j) + v(i,j) * v(i,j)) / 2;
        end
    end
end
