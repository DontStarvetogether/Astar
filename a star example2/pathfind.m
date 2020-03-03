clear;
clc;
tic
disp('A Star Path Planing start!!')
load map;
map.grid(map.grid(:)==-10|map.grid(:)==-20)=NaN;
Xindex=1:1:size(map.grid,2);
Yindex=1:1:size(map.grid,1);
[Gridx,Gridy]=meshgrid(Xindex,Yindex);
mesh(Gridy,Gridx,map.grid);hold on;view(0,90);

map.start=[354,18];  %��ʼ�� ע������ڵ�ͼ��Χ��
map.goal=[242,228];  %Ŀ��� ע������ڵ�ͼ��Χ��

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
FillPlot(map.start,'k');
FillPlot(map.goal,'r');
if length(path)>=1
    plot(path(:,1),path(:,2),'-c','LineWidth',1);hold on;
end
%}
view(180, 90); %# Swap the axes
set(gca, 'ydir', 'reverse'); 
toc