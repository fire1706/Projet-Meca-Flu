%------------------------------Function deriv--------------------------%
%fonction retournant la vitesse (dérivée de la fonction courant)
%NB: 'left' peut etre remplacer par 'bas' et 'right' peut etre remplacer
%par 'haut'
% convention type de noeud: 0 = hors dom; 1 = calc; 2 =
% dirichlet
%
%
% Auteur : Thomas BASTIN ; Victor DACHET ; Maxime MIGNOLET 
%
%-------------------------------------------------------------------------%


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
