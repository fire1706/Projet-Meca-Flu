%------------------------------Function getCoeff--------------------------%
% Cette fonction prend en entr?e les num?ros attribu? au ?l?ment de la
% matrice le type du centre ( 0 = Hors domaine , 1 = n?ud de calcul entour?
% de n?uds de calcul ou condition limite et 2 = n?ud condition limite de 
% Dirichlet ) et la condition limite associ? a ce centre. En sortie on va
% recevoir deux vecteurs colonne et un scalaire. le vecteur j contiendra
% les num?ro des colonnes , a les coefficient correspondant et le scalaire
% b la condition limite associ?.
%
%
% Auteur : Thomas BASTIN ; Victor Dachet ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%
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

    












