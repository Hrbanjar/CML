% This work for the Implementation and Testing a Personalized Medicine Support System for Chronic Myeloid Leukaemia
% Codeed by: Haneen Banjar
%email:hrbanjar@kau.edu.sa
%%
function varargout = Prognostic(varargin)
% PROGNOSTIC MATLAB code for Prognostic.fig
%      PROGNOSTIC, by itself, creates a new PROGNOSTIC or raises the existing
%      singleton*.
%
%      H = PROGNOSTIC returns the handle to a new PROGNOSTIC or the handle to
%      the existing singleton*.
%
%      PROGNOSTIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGNOSTIC.M with the given input arguments.
%
%      PROGNOSTIC('Property','Value',...) creates a new PROGNOSTIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prognostic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prognostic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prognostic

% Last Modified by GUIDE v2.5 13-Nov-2017 07:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prognostic_OpeningFcn, ...
                   'gui_OutputFcn',  @Prognostic_OutputFcn, ...
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


% --- Executes just before Prognostic is made visible.
function Prognostic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prognostic (see VARARGIN)

% Choose default command line output for Prognostic
handles.output = hObject;
set(handles.figure1, 'Name', 'Combined Prognostic Model');
set(handles.ConflictResult,'String',' ');
set(handles.sokalresult,'String',' ');
set(handles.hasfordresult,'String',' ');
set(handles.eutosresults,'String',' ');
set(handles.Recommendation,'String',' ');
set(handles.editAge,'String','');
set(handles.editSpleen,'String','');
set(handles.editPlatelets,'String','');
set(handles.editBlast,'String','');
set(handles.editEosinophils,'String','');
set(handles.editBasophils,'String','');

        set(handles.t1,'Visible','off');    
        set(handles.t2,'Visible','off'); 
        set(handles.t3,'Visible','off'); 
        set(handles.t4,'Visible','off'); 
        set(handles.t5,'Visible','off'); 
        set(handles.t6,'Visible','off'); 
handles.obj= CMLPatintData();
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prognostic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prognostic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
            
          


function editSpleen_Callback(hObject, eventdata, handles)
% hObject    handle to editSpleen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSpleen as text
%        str2double(get(hObject,'String')) returns contents of editSpleen as a double


% --- Executes during object creation, after setting all properties.
function editSpleen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSpleen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPlatelets_Callback(hObject, eventdata, handles)
% hObject    handle to editPlatelets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPlatelets as text
%        str2double(get(hObject,'String')) returns contents of editPlatelets as a double


% --- Executes during object creation, after setting all properties.
function editPlatelets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPlatelets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBlast_Callback(hObject, eventdata, handles)
% hObject    handle to editBlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlast as text
%        str2double(get(hObject,'String')) returns contents of editBlast as a double


% --- Executes during object creation, after setting all properties.
function editBlast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEosinophils_Callback(hObject, eventdata, handles)
% hObject    handle to editEosinophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEosinophils as text
%        str2double(get(hObject,'String')) returns contents of editEosinophils as a double


% --- Executes during object creation, after setting all properties.
function editEosinophils_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEosinophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBasophils_Callback(hObject, eventdata, handles)
% hObject    handle to editBasophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of editBasophils as text
%        str2double(get(hObject,'String')) returns contents of editBasophils as a double


% --- Executes during object creation, after setting all properties.
function editBasophils_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBasophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editAge_Callback(hObject, eventdata, handles)
% hObject    handle to editAge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAge as text
%        str2double(get(hObject,'String')) returns contents of editAge as a double


% --- Executes during object creation, after setting all properties.
function editAge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.editAge,'String')) || isempty(get(handles.editSpleen,'String')) || isempty(get(handles.editPlatelets,'String')) ||  isempty(get(handles.editBlast,'String')) || isempty(get(handles.editEosinophils,'String')) || isempty(get(handles.editBasophils,'String'))
    set(handles.ConflictResult,'String','Please enter  pre-treatment value/s');
if   isempty(get(handles.editAge,'String'))
     set(handles.t1,'Visible','on');
else
    set(handles.t1,'Visible','off');
end
if   isempty(get(handles.editSpleen,'String'))
     set(handles.t2,'Visible','on');
else
    set(handles.t2,'Visible','off');
   
end


if   isempty(get(handles.editPlatelets,'String'))
     set(handles.t3,'Visible','on');
else
    set(handles.t3,'Visible','off');
    
end


if   isempty(get(handles.editBlast,'String'))
     set(handles.t4,'Visible','on');
else
    set(handles.t4,'Visible','off');
    
end


if   isempty(get(handles.editEosinophils,'String'))
     set(handles.t5,'Visible','on');
else
    set(handles.t5,'Visible','off');
end


if   isempty(get(handles.editBasophils,'String'))
     set(handles.t6,'Visible','on');
else
    set(handles.t6,'Visible','off');
end
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%
else
       handles.age= str2double(get(handles.editAge,'String'));
       handles.spleensize= str2double(get(handles.editSpleen,'String'));
       handles.Platelet= str2double(get(handles.editPlatelets,'String'));
       handles.blastsPercentage= str2double(get(handles.editBlast,'String'));
       handles.eosinophilsPercentage= str2double(get(handles.editEosinophils,'String'));
       handles.basophilsPercentage= str2double(get(handles.editBasophils,'String'));
        set(handles.t1,'Visible','off');    
        set(handles.t2,'Visible','off'); 
        set(handles.t3,'Visible','off'); 
        set(handles.t4,'Visible','off'); 
        set(handles.t5,'Visible','off'); 
        set(handles.t6,'Visible','off');
    set(handles.ConflictResult,'String',' ');
    handles.sokalscore=handles.obj.Sokal(handles.age, handles.spleensize, handles.Platelet, handles.blastsPercentage);
    handles.hasfordscore=handles.obj.Hasford(handles.age,handles.spleensize,handles.Platelet,handles.blastsPercentage, handles.eosinophilsPercentage,handles.basophilsPercentage);
    handles.eutosscore=handles.obj.EUTOS(handles.basophilsPercentage,handles.spleensize);
    guidata(hObject, handles);
    %%%%%%%
    if handles.sokalscore==1 && handles.hasfordscore==1 &&  handles.eutosscore==1
       set(handles.sokalresult,'String','Low-Risk ');
       set(handles.hasfordresult,'String','Low-Risk ');
       set(handles.eutosresults,'String','Low-Risk ');
       set(handles.Recommendation,'String',strcat('Frontline imatinib is recommended, the patient may achieve MMR at 24 months, and the patient should not need more aggressive imatinib therapy.'));   
    elseif handles.sokalscore==0 && handles.hasfordscore==0 &&  handles.eutosscore==0
       set(handles.sokalresult,'String','High-Risk ');       
       set(handles.hasfordresult,'String','High-Risk ');
       set(handles.eutosresults,'String','High-risk ');
       set(handles.Recommendation,'String',strcat('Warning: frontline imatinib is not recommended, other TKIs are recommended, and the patient should need more aggressive imatinib therapy, or switch to nilotinib or dasatinib with close monitoring.'));
    else
        handles.combinedprognostic=handles.obj.CombinedScore();
        if handles.combinedprognostic==1
            set(handles.ConflictResult,'String',strcat('Warning: Conflicting decisions were generated by the prognostic scores, but the combined prognostic score classifies the patient as Low-risk.'));
            set(handles.Recommendation,'String',strcat('Frontline imatinib is recommended, the patient may achieve MMR at 24 months, and the patient should not need more aggressive imatinib therapy.'));   
        else
            set(handles.ConflictResult,'String',strcat('Warning: Conflicting decisions were generated by the prognostic scores, but the combined prognostic score classifies the patient as High-risk.'));
            set(handles.Recommendation,'String',strcat('Warning: frontline imatinib is not recommended, other TKIs are recommended, and the patient should need more aggressive imatinib therapy, or switch to nilotinib or dasatinib with close monitoring.'));
        end
       if handles.sokalscore==1 
       set(handles.sokalresult,'String','Low-Risk ');
       else
           set(handles.sokalresult,'String','High-Risk ');
       end
         if handles.hasfordscore==1 
       set(handles.hasfordresult,'String','Low-Risk ');
       else
           set(handles.hasfordresult,'String','High-Risk ');
         end
         if handles.eutosscore==1 
       set(handles.eutosresults,'String','Low-Risk ');
       else
           set(handles.eutosresults,'String','High-Risk ');
         end
    end
       guidata(hObject,handles);   
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton1




% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ConflictResult,'String',' ');
set(handles.sokalresult,'String',' ');
set(handles.hasfordresult,'String',' ');
set(handles.eutosresults,'String',' ');
set(handles.Recommendation,'String',' ');
set(handles.editAge,'String','');
set(handles.editSpleen,'String','');
set(handles.editPlatelets,'String','');
set(handles.editBlast,'String','');
set(handles.editEosinophils,'String','');
set(handles.editBasophils,'String','');
set(handles.t1,'Visible','off');    
set(handles.t2,'Visible','off'); 
set(handles.t3,'Visible','off'); 
set(handles.t4,'Visible','off'); 
set(handles.t5,'Visible','off'); 
set(handles.t6,'Visible','off');
handles.obj= CMLPatintData ();
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton2
