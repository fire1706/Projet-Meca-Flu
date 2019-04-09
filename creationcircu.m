function [a,b,e,c,d]= creationcircu(u,v,p)
Dim = size(u);
j = 91;
cpt = 1;
for i=16:38
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=92:113
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for i=37:-1:16
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=112:-1:91
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

end

