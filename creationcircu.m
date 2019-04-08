%------------------------------Function creationcircu--------------------------%
% Cette fonction nous permet juste de sortir un vecteur utiliser dans la fonction
% de circuculation ( circu ) . C'est un code de facilitee.
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
function [a,b,c,d]= creationcircu(u,v)
Dim = size(u);
j = 1;
cpt = 1;
for i=16:38
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=91:113
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for i=38:-1:16
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=113:-1:91
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

end
