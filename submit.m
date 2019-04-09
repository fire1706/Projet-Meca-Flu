
function [psi,u,v] = submit(which)
switch which
    case 1
        cl = dlmread('1-cl.txt', '\t');
        dom = dlmread('1-dom.txt', '\t');
        num = dlmread('1-num.txt', '\t');
        PAS = 0.5;
    case 2
        cl = dlmread('2-cl.txt', '\t');
        dom = dlmread('2-dom.txt', '\t');
        num = dlmread('2-num.txt', '\t');
        PAS = 0.001;
    case 3
        cl = dlmread('3-cl.txt', '\t');
        dom = dlmread('3-dom.txt', '\t');
        num = dlmread('3-num.txt', '\t');
        PAS = 0.01;
    case 4
        cl = dlmread('4-cl.txt', '\t');
        dom = dlmread('4-dom.txt', '\t');
        num = dlmread('4-num.txt', '\t');
        PAS = 0.01;
end

psi = Laplacien(num,dom,cl);

[u,v] = velocity(psi, dom, PAS);



end


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

function [j, a, b] = getCoeff(num_left, num_right, num_down, num_up, num_cent, type_cent, cl_cent)
    if type_cent == 0 % pour ce cas on renverra des vecteurs de zeros et b=0
         j = 0;
         a = 0;
         b = 0;
 
    elseif type_cent == 1 % condition pour le noeud entour?
        a = [1;1;1;1;-4];
        b = cl_cent ; 
        j = [num_left;num_right;num_down;num_up;num_cent];
   
    elseif type_cent == 2 % condition pour le noeud de Dirichlet
        a = 1;
        b = cl_cent;
        j = num_cent;
    end
end

function v = deriv(f_left, f_c, f_right, type_left, ~, type_right, h)

    if(type_right == 0)
        %derivee decentree arriere
        v = (f_c - f_left)/h;

    elseif(type_left == 0)
        %derivee decentree avant
        v = (f_right - f_c)/h;
    else
        %derivee centree
        v = (f_right - f_left)/(2*h);
    end

end
