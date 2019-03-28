function [u,v,x,y] = vitesse

    [F,dom,h] = Laplacien_thomas;
    DIMENSIONS = size(dom);
    NB_LIGNES = DIMENSIONS(1);
    NB_COLONNES = DIMENSIONS(2);
    
    for i=2 : NB_LIGNES-1
        for j=2 : NB_COLONNES-1
            v((i-1)*(NB_LIGNES-1)+j) = deriv(F(i-1,j), F(i,j), F(i+1,j), dom(i-1,j), dom(i,j), dom(i+1,j), h);
            u((i-1)*(NB_LIGNES-1)+j) = deriv(F(i,j-1), F(i,j), F(i,j+1), dom(i,j-1), dom(i,j), dom(i,j+1), h);
            x((i-1)*(NB_LIGNES-1)+j) = i;
            y((i-1)*(NB_LIGNES-1)+j) = j;
        end
    end
    
end