function hcost = h( m,goal,delta )

%计算启发函数代价值 ，这里采用曼哈顿算法
% hcost =delta*(  m(1)-goal(1)  )+delta*abs(  m(2)-goal(2)  );
hcost =5*delta*dist(m,goal');
end
