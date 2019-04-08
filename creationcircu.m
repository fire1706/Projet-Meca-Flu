function [a,b,e,c,d]= creationcircu(u,v,p)
Dim = size(u);
j = 2;
cpt = 1;
for i=2:Dim(1)-1
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=3:Dim(2)-1
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for i=Dim(1)-2:-1:2
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

for j=Dim(2)-2:-1:2
    a(cpt) = u(i,j);
    b(cpt) = v(i,j);
    e(cpt) = p(i,j);
    c(cpt) = i;
    d(cpt) = j;
    cpt = cpt+1;
end

end
