function [u,v] = vitesse(F, dom, PAS)

    DIMENSIONS = size(dom);
    NB_LIGNES = DIMENSIONS(1);
    NB_COLONNES = DIMENSIONS(2);
    u = zeros(NB_LIGNES -2, NB_COLONNES - 2);
    v = zeros(NB_LIGNES -2, NB_COLONNES - 2);
    
    for i=2 : NB_LIGNES-1
        for j=2 : NB_COLONNES-1
            v(i, j) = deriv(F(i-1,j), F(i,j), F(i+1,j), dom(i-1,j), dom(i,j), dom(i+1,j), PAS);
            u(i, j) = deriv(F(i,j-1), F(i,j), F(i,j+1), dom(i,j-1), dom(i,j), dom(i,j+1), PAS);
        end
    end
    
end
