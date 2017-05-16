
function Y=centroid(X,d)


Sx=cov(X);
[V,D]=eig(Sx);
eigValue=diag(D);
[eigValue,IX]=sort(eigValue,'descend');
center=V(:,IX);

norm_center=sqrt(sum(center.^2));
center=center./repmat(norm_center,size(center,1),1);

Y=X*center(:,1:d);
