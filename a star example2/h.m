function hcost = h( m,goal,delta )

%����������������ֵ ����������������㷨
% hcost =delta*abs(  m(1)-goal(1)  )+delta*abs(  m(2)-goal(2)  );
% hcost =10*delta*dist(m,goal');
hcost =delta*sqrt(( m(1)-goal(1) ).^2+(  m(2)-goal(2)  ).^2);
end
