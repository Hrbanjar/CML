% This work for the Implementation and Testing a Personalized Medicine Support System for Chronic Myeloid Leukaemia
% Codeed by: Haneen Banjar
%email:hrbanjar@kau.edu.sa

%%

function varargout = imatinibGUI(varargin)
% IMATINIBGUI MATLAB code for imatinibGUI.fig
%      IMATINIBGUI, by itself, creates a new IMATINIBGUI or raises the existing
%      singleton*.
%
%      H = IMATINIBGUI returns the handle to a new IMATINIBGUI or the handle to
%      the existing singleton*.
%
%      IMATINIBGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMATINIBGUI.M with the given input arguments.
%
%      IMATINIBGUI('Property','Value',...) creates a new IMATINIBGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imatinibGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imatinibGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imatinibGUI

% Last Modified by GUIDE v2.5 08-Nov-2017 22:17:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imatinibGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @imatinibGUI_OutputFcn, ...
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


% --- Executes just before imatinibGUI is made visible.
function imatinibGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imatinibGUI (see VARARGIN)

% Choose default command line output for imatinibGUI
        

% Update handles structure
guidata(hObject, handles);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.figure1, 'Name', 'Personalized Medicine Support System');
% UIWAIT makes imatinibGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handles.output = hObject;



% --- Outputs from this function are returned to the command line.
function varargout = imatinibGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mh1 = uimenu(hObject,'Label','About the System','Callback',@setMenu);

function setMenu(source,callbackdata) 
            switch source.Label
                case 'About the System'
                   DisplyCML;
            end%inerswitch  



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.obj= CMLPatintData();
if get(handles.radiobutton3,'Value')==0 && get(handles.radiobutton4,'Value')==0
    set(handles.text1,'String','Please select a model');
    guidata(hObject,handles);
else
if get(handles.radiobutton3,'Value')==1 && get(handles.radiobutton4,'Value')==0
    Prognostic;
else if get(handles.radiobutton3,'Value')==0 && get(handles.radiobutton4,'Value')==1
      predictive;
    end
end
end%if
guidata(hObject, handles);
