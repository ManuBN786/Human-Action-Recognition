function varargout = main1(varargin)
% MAIN1 M-file for main1.fig
%      MAIN1, by itself, creates a new MAIN1 or raises the existing
%      singleton*.
%
%      H = MAIN1 returns the handle to a new MAIN1 or the handle to
%      the existing singleton*.
%
%      MAIN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN1.M with the given input arguments.
%
%      MAIN1('Property','Value',...) creates a new MAIN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only
%      one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main1

% Last Modified by GUIDE v2.5 21-Apr-2014 11:54:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main1_OpeningFcn, ...
                   'gui_OutputFcn',  @main1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main1 is made visible.
function main1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main1 (see VARARGIN)

% Choose default command line output for main1
handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);
bg=imread('Files\1.jpg'); imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Pruning.
function Pruning_Callback(hObject, eventdata, handles)
% hObject    handle to Pruning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nFrames
for i=1:nFrames
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
  Testfeature(i,1:40)=valinit;
  axes(handles.axes1)
  imshow(f1,[]), hold on
  axis off;
  showellipticfeatures(posinit,[1 1 0]);
  title('Feature Points','fontsize',12,'fontname','Times New Roman','color','Black')
end
set(handles.uitable1,'Visible','on');
set(handles.uitable1,'data',Testfeature);
save Testfeature Testfeature
main1


% --- Executes on button press in Recognizedaction.
function Recognizedaction_Callback(hObject, eventdata, handles)
% hObject    handle to Recognizedaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Testfeature
load Trainfeature
load Truelabel
figure(2),imshow('Frames\5.jpg')
hold on;
X=Trainfeature;
Y=Truelabel';
ens = fitensemble(X,Y,'Subspace',300,'KNN');
class = predict(ens,Testfeature(1,:));
if (class==1)
   text(5, 18, 'Boxing', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==2)
   text(5, 18, 'Jogging', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==3)
   text(5, 18, 'Hand Waving', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==4)
   text(5, 18, 'Hand Clapping', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==5)
   text(5, 18, 'Jumping', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==6)
   text(5, 18, 'Running', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==7)
   text(5, 18, 'Cycling', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
else if(class==8)
   text(5, 18, 'Surfing', 'Color','r','fontname','Times New Roman', 'FontWeight','bold', 'FontSize',20);
    end
    end
    end
    end
    end
    end
    end
end


% --- Executes on button press in Performancemeasures.
function Performancemeasures_Callback(hObject, eventdata, handles)
% hObject    handle to Performancemeasures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
performance
