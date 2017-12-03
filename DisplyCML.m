% This work for the Implementation and Testing a Personalized Medicine Support System for Chronic Myeloid Leukaemia
% Codeed by: Haneen Banjar
%email:hrbanjar@kau.edu.sa
%%
function varargout = DisplyCML(varargin)
% DISPLYCML MATLAB code for DisplyCML.fig
%      DISPLYCML, by itself, creates a new DISPLYCML or raises the existing
%      singleton*.
%
%      H = DISPLYCML returns the handle to a new DISPLYCML or the handle to
%      the existing singleton*.
%
%      DISPLYCML('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISPLYCML.M with the given input arguments.
%
%      DISPLYCML('Property','Value',...) creates a new DISPLYCML or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DisplyCML_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DisplyCML_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DisplyCML

% Last Modified by GUIDE v2.5 26-Oct-2017 23:50:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DisplyCML_OpeningFcn, ...
                   'gui_OutputFcn',  @DisplyCML_OutputFcn, ...
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


% --- Executes just before DisplyCML is made visible.
function DisplyCML_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DisplyCML (see VARARGIN)

% Choose default command line output for DisplyCML
handles.output = hObject;
set(handles.figure1, 'Name', 'About the Personalized Medicine Support System');
guidata(hObject, handles);
mh = uimenu(hObject,'Label','Home','Callback',@setMenu);
eh1 = uimenu(hObject,'Label','Combined Prognostic Model','Callback',@setMenu);
eh2 = uimenu(hObject,'Label','Predictive Model','Callback',@setMenu);
mh1 = uimenu(hObject,'Label','About the System','Callback',@setMenu);
function setMenu(source,callbackdata) 
            switch source.Label
                case 'Home'
                    imatinibGUI;
                case 'Combined Prognostic Model'
                    Prognostic;
                case 'Predictive Model'
                    predictive;
                case 'About the System'
                    DisplyCML;
            end%inerswitch  
% Update handles structure


% UIWAIT makes DisplyCML wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DisplyCML_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

          
