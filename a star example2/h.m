function hcost = h( m,goal,delta )

%����������������ֵ ����������������㷨
% hcost =delta*(  m(1)-goal(1)  )+delta*abs(  m(2)-goal(2)  );
hcost =10*delta*dist(m,goal');
end
