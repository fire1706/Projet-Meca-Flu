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

[u,v] = vitesse(psi, dom, PAS);


end
