% Project Title: Human Action Recognition
% Author: Manu B.N
% Contact: manubn88@gmail.com
% Main module of action recognition

close all
clear all
clc
delete('Frames\*.jpg');
[filename pathname] = uigetfile({'*.avi'},'Select A Video File'); 
I = VideoReader([pathname,filename]);
implay([pathname,filename]);
pause(3);
nFrames = I.numberofFrames;
vidHeight =  I.Height;
vidWidth =  I.Width;
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
       WantedFrames = 50;
for k = 1:WantedFrames
    mov(k).cdata = read( I, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
    imwrite(mov(k).cdata,['Frames\',num2str(k),'.jpg']);
end

for I = 1:WantedFrames
   im=imread(['Frames\',num2str(I),'.jpg']);
    figure(1),subplot(5,10,I),imshow(im);
end
clc
for i=1:WantedFrames
    disp(['Processing frame no.',num2str(i)]);
  img=imread(['Frames\',num2str(i),'.jpg']);
  f1=il_rgb2gray(double(img));
  [ysize,xsize]=size(f1);
  nptsmax=40;   
  kparam=0.04;  
  pointtype=1;  
  sxl2=4;       
  sxi2=2*sxl2;  
  % detect points
  [posinit,valinit]=STIP(f1,kparam,sxl2,sxi2,pointtype,nptsmax);
  Test_Feat(i,1:40)=valinit;
  %imshow(f1,[]), hold on
 % axis off;
 % showellipticfeatures(posinit,[1 1 0]);
 % title('Feature Points','fontsize',12,'fontname','Times New Roman','color','Black')
end

% Use KNN To classify the videos
load('TrainFeat.mat')
X = meas;
Y = New_Label;
Z = Test_Feat;
% Now Classify

%ens = fitensemble(X,Y,'Subspace',300,'KNN');
%class = predict(ens,Z(1,:))
md1 = ClassificationKNN.fit(X,Y);
Type = predict(md1,Z);
if (Type == 1)
    disp('Boxing');
    helpdlg(' Boxing ');
elseif (Type == 2)
    disp('Hand Clapping');
    helpdlg('Hand Clapping');
elseif (Type == 3)
    disp('Hand Waving');
    helpdlg('Hand Waving');
elseif (Type == 4)
    disp('Jogging');
    helpdlg('Jogging');
elseif (Type == 5)
    disp('Running');
    helpdlg('Running');
elseif (Type == 6)
    disp('Walking');
    helpdlg('Walking');
elseif (Type == 7)
    disp('Cycling');
    helpdlg('Cycling');
elseif (Type == 8)
    disp('Surfing');
    helpdlg('Surfing');
end
    

