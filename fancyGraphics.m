%%
%Script to create fancy figures
close all
fig01=figure;
hold on
grid on

%Definition of axis
xMin=0; xMax=12;
yMin=0; yMax=400;

axis([xMin xMax yMin yMax])
axis square;
%axis equal
grid minor

%%
%Definition for plot data
%Any data for example
data001=[0,0;...
         0.329366753875152, 49.8269896193772;...
         0.821110079612908,	98.2698961937716;...
         1.24803780909781,	149.480968858131;...
         1.70759839086280,	202.076124567474;...
         2.65485132359974,	253.287197231834;...
         3.79688862632571,	300.346020761246;...
         5.32939488564436,	350.173010380623;...
         7.05657298787521,	394.463667820069];

%%
%add here each plot separately
plotV(data001,'rs-',...
              'LineWidth',2,...
              'MarkerSize',10,...
              'MarkerEdgeColor','r',...
              'MarkerFaceColor','r')

%%
%Definition of labels
title('"Any title"'       ,'interpreter','latex')
ylabel('$Load (N)$'         ,'interpreter','latex')
xlabel('$Displacement (mm)$','interpreter','latex')
legend('Case 1')
%%
%Fancy colors
set(gca,'FontSize'       ,20,...
        'MinorGridColor' ,'g',...
        'GridColor'      ,'r',...
        'Xgrid'          ,'on',...
        'Ygrid'          ,'on',...
        'LineWidth'      ,2)

                
                
                
                
                
                
                
                
                
                
                
                
             
