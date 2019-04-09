%------------------------------Function vitesse--------------------------%
% Cette fonction calcul les matrices de vitesse horizontal et vertical a
% partir du laplacien
% Elle prend en entree la matrice de la fonction de courant, la matrice de 
% domaine et le pas correspondant au cas etudier.
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
function [u,v] = velocity(F, dom, PAS)

    DIMENSIONS = size(dom);
    NB_LIGNES = DIMENSIONS(1);
    NB_COLONNES = DIMENSIONS(2);
    u = zeros(NB_LIGNES, NB_COLONNES);
    v = zeros(NB_LIGNES, NB_COLONNES);
    
    for i=1 : NB_LIGNES
        for j=1 : NB_COLONNES
            if (dom(i,j)==0)
                j=j+1;
            else
                v(i, j) = -deriv(F(i-1,j), F(i,j), F(i+1,j), dom(i-1,j), dom(i,j), dom(i+1,j), PAS);
                u(i, j) = deriv(F(i,j-1), F(i,j), F(i,j+1), dom(i,j-1), dom(i,j), dom(i,j+1), PAS);
            end   
        end
    end
end
