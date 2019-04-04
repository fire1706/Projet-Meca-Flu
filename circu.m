%------------------------------Function circu--------------------------%
% u le vecteur des composantes horizontales de vitesse (class�es selon l'ordre de parcours des n?uds)
% v le vecteur des composantes verticales de vitesse (class�es selon l'ordre de parcours des n?uds)
% x le vecteur de coordonn�es x (classees selon l'ordre de parcours des noeuds)
% y le vecteur de coordonn�es y (classees selon l'ordre de parcours des noeuds)
% c la circulation
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%


function c = circu(u,v,x,y)
circu = 0;
leng = length(u);

for i = 1 : leng-1
        circu = circu + (v(i) + v(i+1))*(x(i+1)-x(i))*0.5 + (u(i)+u(i+1))*(y(i+1)-y(i))* 0.5;
end
c = circu;
end
