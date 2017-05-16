function showellipsefeatures(pos,fcol,flag)
if nargin<2 fcol=[0 0 1]; end
if nargin<3 flag=0; end

hold on;
for i=1:size(pos,1)
  x0=pos(i,1); y0=pos(i,2); s0=pos(i,3);
  %Sigma=inv([pos(i,4) pos(i,5); pos(i,5) pos(i,6)]);
  Sigma=inv([pos(i,1) pos(i,2); pos(i,3) pos(i,4)]);
  Sigma=Sigma/sqrt(det(Sigma));
  h=drawellipse_cov(Sigma*s0*10,[x0 y0]);
  set(h,'Color',fcol)
  h=plot(x0,y0,'x');
  set(h,'Color',fcol)
  if flag
    title(sprintf('i=%d',i));
    pause
  end
end
pause(0.1)
