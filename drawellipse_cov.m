function h=drawellipse_cov(cov,pos)

%
% drawellipse_cov(cov,pos)
%   draws an ellipse with the covariance 'cov'
%   at position 'pos'
%

points=linspace(0,2*pi,100);   
%T=[sin(angle) cos(angle); -cos(angle) sin(angle)];
ell=(sqrtm(cov)*[cos(points)' sin(points)']')';
ell(:,1)=ell(:,1)+pos(1);
ell(:,2)=ell(:,2)+pos(2);

h=plot(ell(:,1),ell(:,2),'LineWidth',1.5);
%plot(ell(:,1),ell(:,2))

% draw axes
%[V,D]=eig(cov);
%v1=D(1,1)*V(:,1);
%v2=D(2,2)*V(:,2);
%plot([pos(1); pos(1)+v1(1)],[pos(2); pos(2)+v1(2)],'r')
%plot([pos(1); pos(1)+v2(1)],[pos(2); pos(2)+v2(2)],'r')
