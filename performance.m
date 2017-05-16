function varargout = performance(varargin)
% PERFORMANCE MATLAB code for performance.fig
%      PERFORMANCE, by itself, creates a new PERFORMANCE or raises the existing
%      singleton*.
%
%      H = PERFORMANCE returns the handle to a new PERFORMANCE or the handle to
%      the existing singleton*.
%
%      PERFORMANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERFORMANCE.M with the given input arguments.
%
%      PERFORMANCE('Property','Value',...) creates a new PERFORMANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before performance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to performance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help performance

% Last Modified by GUIDE v2.5 21-Apr-2014 12:21:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @performance_OpeningFcn, ...
                   'gui_OutputFcn',  @performance_OutputFcn, ...
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


% --- Executes just before performance is made visible.
function performance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to performance (see VARARGIN)

% Choose default command line output for performance
handles.output = hObject;
handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);
bg=imread('Files\1.jpg'); imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes performance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = performance_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Confusionmatrix.
function Confusionmatrix_Callback(hObject, eventdata, handles)
% hObject    handle to Confusionmatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Trainfeature
load Truelabel
global class
X=Trainfeature;
Y=TrueLabel';
ens = fitensemble(X,Y,'Subspace',300,'KNN');
class = predict(ens,Trainfeature);
confusionmatrix=confusionmat(Truelabel,class);
set(handles.uitable1,'Visible','on');
set(handles.uitable1,'data',confusionmatrix)


% --- Executes on button press in Accuracy.
function Accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to Accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global class
load Truelabel
Performance=classperf(class,Truelabel);
Accuracy=Performance.CorrectRate*100;
set(handles.edit1,'Visible','on');
set(handles.text1,'Visible','on');
set(handles.edit1,'string',[num2str(Accuracy),'%'])


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in redo.
function redo_Callback(hObject, eventdata, handles)
% hObject    handle to redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(main1);
close(performance);
close(figure(1));
close(figure(2));
main

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;