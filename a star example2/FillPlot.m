function FillPlot(coord,color,delta,xmin, ymin)


%coordΪ�����ĵ�����꣬Ϊ n by 2 ����������һ��Ϊ���x���꣬�ڶ���Ϊ���y���� 
%���ǻ�������Щ��Ϊ���ģ��߳�Ϊ1����������� colorΪ��ɫ  ��color = 'k'ʱ����ʾ��ɫ



for i = 1:length(coord(:,1))
   
    y = coord(i,1)*delta+ymin;
    x = coord(i,2)*delta+xmin;
    
    X = [x-0.5,x+0.5,x+0.5,x-0.5];
    Y = [y-0.5,y-0.5,y+0.5,y+0.5];
    
    fill(X,Y,color);
    
    hold on;
end

axis equal;


end
