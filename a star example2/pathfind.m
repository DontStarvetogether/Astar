clear;
clc;
tic
disp('A Star Path Planing start!!')
load map;
delta=map.delta;
xmin=map.xmin;
ymin=map.ymin;
% map.grid(map.grid(:)==-10|map.grid(:)==-20)=NaN;
Xindex=1:1:size(map.grid,2);
Yindex=1:1:size(map.grid,1);
[Gridx,Gridy]=meshgrid(Xindex,Yindex);
hold on;
mesh(Gridx*delta+xmin,Gridy*delta+ymin,map.grid);hold on;
pcshow(map.objectpoint.Location,'r');
view(-90,90);
[sx,sy] = ginput(1);
[gx,gy] = ginput(1);
startx=floor((sx-xmin)/delta)+1;
starty=floor((sy-ymin)/delta)+1;

goalx=floor((gx-xmin)/delta)+1;
goaly=floor((gy-ymin)/delta)+1;

map.start=[starty,startx];  %��ʼ�� ע������ڵ�ͼ��Χ��
map.goal=[goaly,goalx];  %Ŀ��� ע������ڵ�ͼ��Χ��

% obstacle=GetBoundary(map);%�õ��߽�����
% nObstacle=150;%�ڵ�ͼ���������XX���ϰ���
% obstacle=GetObstacle(nObstacle,obstacle,map);%�����ͼ���ϰ�������
%obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%ȫ�������������û��·��
%obstacle = [obstacle;1,2;2,1;2,2];%��ҲΪȫ�����������Ҳû��·��
%obstacle = [obstacle;1,3;2,3;3,3;3,2;3,1];%��ҲΪȫ���������Ҳû��·��


%load('obstacle1.mat');
%����������
% PlotGrid(map);
% hold on;

%�����ϰ���
% FillPlot(obstacle,'k');
obstacle=[1,1];
path=AStar(obstacle,map);%A*�㷨

%����·��
%
hold on;
FillPlot([sx,sy],'k');
FillPlot([gx,gy],'r');
if length(path)>=1
    plot(path(:,2)*delta+xmin,path(:,1)*delta+ymin,'-c','LineWidth',5);hold on;
end
%}
% view(180, 90); %# Swap the axes
% set(gca, 'ydir', 'reverse'); 
toc