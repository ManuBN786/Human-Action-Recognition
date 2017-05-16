function gray=il_rgb2gray(rgb)

%
% gray=il_rgb2gray(rgb)
%
%   converts n-channel image into a one channel
%   (gray) image as gray=(r+g+b+...)/n
%

if ndims(rgb)<3
  gray=rgb;
else
  gray=sum(rgb,3)/size(rgb,3);
end
