clear;
clc;
load map;
delta=map.delta;
xmin=map.xmin;
ymin=map.ymin;
Xindex=1:1:size(map.grid,2);
Yindex=1:1:size(map.grid,1);
[Gridx,Gridy]=meshgrid(Xindex,Yindex);
mesh(Gridx*delta+xmin,Gridy*delta+ymin,map.grid,map.C);hold on;
pcshow(map.objectpoint.Location,'r');
view(-90,90);
pc=map.objectpoint.Location;
pc(:,2)=pc(:,2)-ymin;
pc(:,1)=pc(:,1)-xmin;
pc(:,1:2)=floor(pc(:,1:2)./delta)+1;
count=zeros(size(map.grid));
for ii=1:size(pc,1)
    count((pc(ii,1)-1)*size(Yindex,2)+pc(ii,2))=count((pc(ii,1)-1)*size(Yindex,2)+pc(ii,2))+1;
end
map.grid(count(:)>=2)=NaN;
[sx,sy] = ginput(1);
pause(0.1);
[gx,gy] = ginput(1);
pause(0.1);
disp('A Star Path Planing start!!')
tic
startx=floor((sx-xmin)/delta)+1;
starty=floor((sy-ymin)/delta)+1;

goalx=floor((gx-xmin)/delta)+1;
goaly=floor((gy-ymin)/delta)+1;

map.start=[starty,startx];  %起始点 注意必须在地图范围内
map.goal=[goaly,goalx];  %目标点 注意必须在地图范围内

% obstacle=GetBoundary(map);%得到边界坐标
% nObstacle=150;%在地图中随机加入XX个障碍物
% obstacle=GetObstacle(nObstacle,obstacle,map);%加入地图中障碍物坐标
%obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%全封死的情况，是没有路的
%obstacle = [obstacle;1,2;2,1;2,2];%此也为全封死的情况，也没有路的
%obstacle = [obstacle;1,3;2,3;3,3;3,2;3,1];%此也为全封死情况，也没有路的


%load('obstacle1.mat');
%画出网格线
% PlotGrid(map);
% hold on;

%画出障碍点
% FillPlot(obstacle,'k');
obstacle=[1,1];
path=AStar(obstacle,map);%A*算法

%画出路径
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