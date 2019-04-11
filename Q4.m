[F,U,V] = submit(2);
NB_LIGNES = 202;
NB_COLONNES = 102;
PAS = 0.001;

[X, Y] = meshgrid((0:PAS:(NB_LIGNES-1) * PAS),(0:PAS:(NB_COLONNES-1) * PAS));

figure;
 subplot(2,1,2);
    contour(X,Y,F');
    xlabel({'';'X[m]'});
    set(get(gca,'Ylabel'),'Rotation',0.0);
    ylabel({'Y[m]       '});
    shading flat;
    axis equal;
    
    colormap jet;
    colorbar;
 subplot(2,1,1);
    contour(X,Y,F',[0.25,0.3,0.35,0.40,0.45,0.50,0.55,0.60,0.65],'LineWidth',0.5);
    xlabel({'';'X[m]'});
    set(get(gca,'Ylabel'),'Rotation',0.0);
    ylabel({'Y[m]       '});
    shading flat;
    axis equal;
    title('Ligne de courant')
    colormap jet;
    colorbar;
    
    
%     
%     
%     
%    DeLigt = 0:0.5:100;
%     figure;
%     R = sqrt(U.*U+V.*V);
%     R = R';
%     contour(X,Y,R,DeLigt);
%     title('Vitesse');
%     shading flat;
%     axis equal;
%     colorbar;
%     
     
   [P] = Pression(U, V);
     fuckthisshit = 0:-250:-14000;
     figure;
     contour(X,Y,P',fuckthisshit)
     xlabel({'';'X[m]'});
     set(get(gca,'Ylabel'),'Rotation',0.0);
     ylabel({'Y[m]'});
    shading flat;
     axis equal;
     title('Courbes isobares');
    colormap jet;
   
  
    
    