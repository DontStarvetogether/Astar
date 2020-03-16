%%%在图上选取起点和终点，开始路径规划
clear;
clc;
load minemap;
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
% map.grid(count(:)>=2)=NaN;
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

%画出障碍点
% FillPlot(obstacle,'k');
obstacle=[0,0];
path=AStar(obstacle,map);%A*算法

%画出路径
%
hold on;
FillPlot([sx,sy],'k',map.delta, map.xmin, map.ymin);
FillPlot([gx,gy],'r',map.delta, map.xmin, map.ymin);
if length(path)>=1
    plot(path(:,2)*delta+xmin,path(:,1)*delta+ymin,'-k','LineWidth',1);hold on;
end
%}
% view(180, 90); %# Swap the axes
% set(gca, 'ydir', 'reverse'); 
toc