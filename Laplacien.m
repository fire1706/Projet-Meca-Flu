%------------------------------Function Laplacien-------------------------%
% Cette fonction nous permet de resoudre le Laplacien sur l'ensemble du 
% domaine de la fonction. Il prend en entree les matrices correspondant 
% au numero des points , a la caracterisation du domaine et au condition
% limites et nous sort la matrices du laplacien.
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
function [F] = Laplacien(num ,dom, cl)

DIMENSIONS = size(num);
NB_LIGNES = DIMENSIONS(1);
NB_COLONNES = DIMENSIONS(2);
A = sparse((NB_LIGNES-2) * (NB_COLONNES-2), (NB_LIGNES-2) * (NB_COLONNES-2));
B = sparse((NB_LIGNES-2) * (NB_COLONNES-2), 1);

line = 0; %ligne de la matrice au fil du remplissage

for i=1:NB_LIGNES
    for j=1:NB_COLONNES
        line = line + 1;
        if dom(i, j) == 0   %noeud de bordure
            continue;
        else                %noeud interne
            num_left = num(i-1, j);
            num_right = num(i + 1, j);
            num_down = num(i, j - 1);
            num_up = num(i, j + 1);
            num_cent = num(i, j);
            type_cent = dom(i, j);
            cl_cent = cl(i, j);
            [indices, a, b] = getCoeff(num_left, num_right, num_down, num_up, num_cent, type_cent, cl_cent);
            for k=1:length(indices)
                A(line, indices(k)) = a(k);
            end
            B(line) = b;
        end
    end
end

f = sparse(A\B);

F = zeros(NB_LIGNES,NB_COLONNES);
for i=1:NB_LIGNES
    for j=1:NB_COLONNES
        if num(i,j) ~= 0
            F(i,j) = f(num(i,j),1);
        end
    end
end


end
