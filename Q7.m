%Q7 scriprt
clear all
[psi, U, V] = submit(3);

[P] = Pression(U, V);

[u,v,p,x,y] = creationcircu(U',V',P');

c = circu(u,v,x,y)

[fx,fy] = force(p,x,y)

clear all

[psi, U, V] = submit(4);

[P] = Pression(U, V);

[u,v,p,x,y] = creationcircu(U',V',P');

c = circu(u,v,x,y)

[fx,fy] = force(p,x,y)