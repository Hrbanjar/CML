% This work for the Implementation and Testing a Personalized Medicine Support System for Chronic Myeloid Leukaemia
% Codeed by: Haneen Banjar
%email:hrbanjar@kau.edu.sa
%%
function varargout = predictive(varargin)
% PREDICTIVE MATLAB code for predictive.fig
%      PREDICTIVE, by itself, creates a new PREDICTIVE or raises the existing
%      singleton*.
%
%      H = PREDICTIVE returns the handle to a new PREDICTIVE or the handle to
%      the existing singleton*.
%
%      PREDICTIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREDICTIVE.M with the given input arguments.
%
%      PREDICTIVE('Property','Value',...) creates a new PREDICTIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before predictive_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to predictive_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help predictive

% Last Modified by GUIDE v2.5 09-Nov-2017 09:01:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @predictive_OpeningFcn, ...
                   'gui_OutputFcn',  @predictive_OutputFcn, ...
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


% --- Executes just before predictive is made visible.
function predictive_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to predictive (see VARARGIN)

% Choose default command line output for predictive
handles.output = hObject;
set(handles.figure1, 'Name', 'Predictive Models');
          
        set(handles.popAge,'Enable','off');
        set(handles.popGender,'Enable','off');
        set(handles.popSpleen,'Enable','off');
        set(handles.popBlast,'Enable','off');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','off');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
        set(handles.radiobutton7,'Value',0);
        set(handles.radiobutton8,'Value',0);
        set(handles.radiobutton9,'Value',0);
        handles.obj= CMLPatintData();
        %error *
        set(handles.t1,'Visible','off');    
        set(handles.t2,'Visible','off'); 
        set(handles.t3,'Visible','off'); 
        set(handles.t4,'Visible','off'); 
        set(handles.t5,'Visible','off'); 
        set(handles.t6,'Visible','off'); 
        set(handles.t7,'Visible','off'); 
        set(handles.t8,'Visible','off'); 
        set(handles.t9,'Visible','off'); 
            
    
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes predictive wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = predictive_OutputFcn(hObject, eventdata, handles) 
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
% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.uibuttongroup2,'SelectedObject');
selectedModel=get(s,'String');
if get(handles.radiobutton7,'Value')==0 && get(handles.radiobutton8,'Value')==0 && get(handles.radiobutton9,'Value')==0
    set(handles.ErrorMsg,'String','Please select a model');
else
    set(handles.ErrorMsg,'String',' ');
switch selectedModel
    case 'Model D' 
        set(handles.popAge,'Enable','on');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','on');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','off');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
        if get(handles.popAge,'Value')==1
            set(handles.t1,'Visible','on');
        else
            set(handles.t1,'Visible','off');
        end
        if get(handles.popGender,'Value')==1
            set(handles.t2,'Visible','on');
        else
        set(handles.t2,'Visible','off');
        end
        if get(handles.popSpleen,'Value')==1
            set(handles.t3,'Visible','on');
        else
            set(handles.t3,'Visible','off');
        end
        if get(handles.popBlast,'Value')==1
            set(handles.t4,'Visible','on');
        else
            set(handles.t4,'Visible','off');
        end
        if get(handles.popMonocytes,'Value')==1
           set(handles.t5,'Visible','on');
        else
            set(handles.t5,'Visible','off');
        end
        if get(handles.popAge,'Value')~=1 && get(handles.popGender,'Value')~=1 &&get(handles.popSpleen,'Value')~=1 &&get(handles.popBlast,'Value')~=1 && get(handles.popMonocytes,'Value')~=1
            handles.obj=handles.obj.ModelD();
            set(handles.ErrorMsg,'String','');
           if handles.obj.predictiveresponseD==1
               set(handles.Recommendation,'String',strcat('Frontline imatinib is recommended, the patient may achieve MMR at 24 months, and the patient should not need more aggressive imatinib therapy.'));   
               guidata(hObject,handles);
            elseif handles.obj.predictiveresponseD==0
                set(handles.Recommendation,'String',strcat('Warning: frontline imatinib is not recommended, other TKIs are recommended, and the patient should need more aggressive imatinib therapy, or switch to nilotinib or dasatinib with close monitoring.'));
                guidata(hObject,handles);
           end
        else
           set(handles.ErrorMsg,'String','Please select pre-treatment value/s');
           guidata(hObject,handles);
        end
    case 'Model E'
        set(handles.popAge,'Enable','on');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','on');
        set(handles.popOA,'Enable','on');
        set(handles.popLevel,'Enable','on');
        set(handles.popType,'Enable','on');

        if get(handles.popAge,'Value')==1
            set(handles.t1,'Visible','on');
        else
            set(handles.t1,'Visible','off');
        end
        if get(handles.popGender,'Value')==1
             set(handles.t2,'Visible','on');
        else
            set(handles.t2,'Visible','off');
        end
        if get(handles.popSpleen,'Value')==1
             set(handles.t3,'Visible','on');
        else
            set(handles.t3,'Visible','off');
        end
        if get(handles.popBlast,'Value')==1
             set(handles.t4,'Visible','on');
        else
            set(handles.t4,'Visible','off');
        end
        if get(handles.popEosinophils,'Value')==1
             set(handles.t6,'Visible','on');
        else
            set(handles.t6,'Visible','off');
        end
        if get(handles.popOA,'Value')==1
             set(handles.t7,'Visible','on');
        else
            set(handles.t7,'Visible','off');
        end
        if get(handles.popLevel,'Value')==1
             set(handles.t8,'Visible','on');
        else
            set(handles.t8,'Visible','off');
        end
        if get(handles.popType,'Value')==1
             set(handles.t9,'Visible','on');
        else
            set(handles.t9,'Visible','off');
        end       
        if get(handles.popAge,'Value')~=1 && get(handles.popGender,'Value')~=1 && get(handles.popSpleen,'Value')~=1 && get(handles.popBlast,'Value')~=1 && get(handles.popEosinophils,'Value')~=1 && get(handles.popOA,'Value')~=1 && get(handles.popLevel,'Value')~=1 && get(handles.popType,'Value')==1
            handles.obj=handles.obj.ModelE();
            set(handles.ErrorMsg,'String','');
            if handles.obj.predictiveresponseE==1
               set(handles.Recommendation,'String',strcat('Frontline imatinib is recommended, the patient may achieve MMR at 24 months, and the patient should not need more aggressive imatinib therapy.'));   
               guidata(hObject,handles);
            elseif handles.obj.predictiveresponseE==0
                set(handles.Recommendation,'String',strcat('Warning: frontline imatinib is not recommended, other TKIs are recommended, and the patient should need more aggressive imatinib therapy, or switch to nilotinib or dasatinib with close monitoring.'));
                guidata(hObject,handles);
            end
        else
            set(handles.ErrorMsg,'String','Please select pre-treatment value/s');
            guidata(hObject,handles);
        end
    case 'Model F' 
        set(handles.popAge,'Enable','off');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','on');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
        if get(handles.popGender,'Value')==1
           set(handles.t2,'Visible','on');
        else
            set(handles.t2,'Visible','off');
        end
        if get(handles.popSpleen,'Value')==1 
           set(handles.t3,'Visible','on');
        else
            set(handles.t3,'Visible','off');
        end
        if get(handles.popBlast,'Value')==1
           set(handles.t4,'Visible','on');
        else
            set(handles.t4,'Visible','off');
        end
        if get(handles.popOA,'Value')==1
           set(handles.t7,'Visible','on');
        else
            set(handles.t7,'Visible','off');
        end
        if get(handles.popGender,'Value')~=1 && get(handles.popSpleen,'Value')~=1 && get(handles.popBlast,'Value')~=1 && get(handles.popOA,'Value')~=1
             handles.obj=handles.obj.ModelF();
             set(handles.ErrorMsg,'String','');
             if handles.obj.predictiveresponseF==1
                set(handles.Recommendation,'String',strcat('Frontline imatinib is recommended, the patient may achieve MMR at 24 months, and the patient should not need more aggressive imatinib therapy.'));   
                guidata(hObject,handles);
             elseif handles.obj.predictiveresponseF==0
                 set(handles.Recommendation,'String',strcat('Warning: frontline imatinib is not recommended, other TKIs are recommended, and the patient should need more aggressive imatinib therapy, or switch to nilotinib or dasatinib with close monitoring.'));
                 guidata(hObject,handles);
             end
        else
            set(handles.ErrorMsg,'String','Please select pre-treatment value/s');
            guidata(hObject,handles);
        end
            
% Hint: get(hObject,'Value') returns toggle state of togglebutton1

end
end


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        set(handles.popAge,'Enable','off');
        set(handles.popGender,'Enable','off');
        set(handles.popSpleen,'Enable','off');
        set(handles.popBlast,'Enable','off');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','off');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
        
        set(handles.popAge,'Value',1);
        set(handles.popGender,'Value',1);
        set(handles.popSpleen,'Value',1);
        set(handles.popBlast,'Value',1);
        set(handles.popMonocytes,'Value',1);
        set(handles.popEosinophils,'Value',1);
        set(handles.popOA,'Value',1);
        set(handles.popLevel,'Value',1);
        set(handles.popType,'Value',1);
        
        set(handles.Recommendation,'String','*');
        set(handles.ErrorMsg,'String','');
        guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on selection change in popGender.
function popGender_Callback(hObject, eventdata, handles)
% hObject    handle to popGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 switch get(handles.popGender,'Value')
     case 1
     set(handles.t2,'Visible','on');
     set(handles.t2,'String','*');
     case 2
     handles.obj.gender=1;
     set(handles.t2,'Visible','off');
     case 3
     handles.obj.gender=2;
     set(handles.t2,'Visible','off');
     otherwise
 end  
 set(handles.popGender, 'UserData', handles.obj.gender);
  guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popGender contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popGender


% --- Executes during object creation, after setting all properties.
function popGender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popSpleen.
function popSpleen_Callback(hObject, eventdata, handles)
% hObject    handle to popSpleen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 switch get(handles.popSpleen,'Value') 
    case 1
     set(handles.t3,'Visible','on');
     set(handles.t3,'String','*');
    case 2
      handles.obj.spleensize=1;
      set(handles.t3,'Visible','off');
    case 3
      handles.obj.spleensize=2;
      set(handles.t3,'Visible','off');
    case 4
      handles.obj.spleensize=3;
      set(handles.t3,'Visible','off');
     otherwise        
 end  
set(handles.popSpleen, 'UserData', handles.obj.spleensize);
 guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popSpleen contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popSpleen


% --- Executes during object creation, after setting all properties.
function popSpleen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popSpleen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popBlast.
function popBlast_Callback(hObject, eventdata, handles)
% hObject    handle to popBlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popBlast,'Value')
    case 1
     set(handles.t4,'Visible','on');
     set(handles.t4,'String','*');
    case 2
      handles.obj.blasts=1;
      set(handles.t4,'Visible','off');
    case 3
      handles.obj.blasts=2;
      set(handles.t4,'Visible','off');
    otherwise
 end  
 set(handles.popBlast, 'UserData',handles.obj.blasts);
 guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popBlast contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popBlast


% --- Executes during object creation, after setting all properties.
function popBlast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popBlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popAge.
function popAge_Callback(hObject, eventdata, handles)
% hObject    handle to popAge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch get(handles.popAge,'Value')   
    case 1
     set(handles.t1,'Visible','on');
     set(handles.t1,'String','*');
    case 2
      handles.obj.age=1;
      set(handles.t1,'Visible','off');
    case 3
      handles.obj.age=2;
      set(handles.t1,'Visible','off');
    case 4
      handles.obj.age=3;
      set(handles.t1,'Visible','off');
    otherwise
end  
    set(handles.popAge,'UserData',handles.obj.age);

   guidata(hObject,handles);


% Hints: contents = cellstr(get(hObject,'String')) returns popAge contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popAge


% --- Executes during object creation, after setting all properties.
function popAge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popAge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popMonocytes.
function popMonocytes_Callback(hObject, eventdata, handles)
% hObject    handle to popMonocytes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 switch get(handles.popMonocytes,'Value')
     case 1
     set(handles.t5,'Visible','on');
     set(handles.t5,'String','*');
     case 2
      handles.obj.monocytes=1;
      set(handles.t5,'Visible','off');
     case 3
      handles.obj.monocytes=2;
      set(handles.t5,'Visible','off');
     case 4
      handles.obj.monocytes=3;
      set(handles.t5,'Visible','off');
     otherwise
 end  

set(handles.popMonocytes, 'UserData', handles.obj.monocytes);
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popMonocytes contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popMonocytes


% --- Executes during object creation, after setting all properties.
function popMonocytes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popMonocytes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popEosinophils.
function popEosinophils_Callback(hObject, eventdata, handles)
% hObject    handle to popEosinophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popEosinophils,'Value')
     case 1
     set(handles.t6,'Visible','on');
     set(handles.t6,'String','*');
     case 2
      handles.obj.eosinophils=1;
      set(handles.t6,'Visible','off');
     case 3
      handles.obj.eosinophils=2;
      set(handles.t6,'Visible','off');
    otherwise        
 end  
set(handles.popEosinophils, 'UserData', handles.obj.eosinophils);
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popEosinophils contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popEosinophils


% --- Executes during object creation, after setting all properties.
function popEosinophils_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popEosinophils (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popOA.
function popOA_Callback(hObject, eventdata, handles)
% hObject    handle to popOA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popOA,'Value')
    case 1
     set(handles.t7,'Visible','on');
     set(handles.t7,'String','*');
    case 2
      handles.obj.oa=1;
      set(handles.t7,'Visible','off');
    case 3
      handles.obj.oa=2;
      set(handles.t7,'Visible','off');
    otherwise        
 end  
set(handles.popOA, 'UserData', handles.obj.oa);
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popOA contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popOA


% --- Executes during object creation, after setting all properties.
function popOA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popOA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popLevel.
function popLevel_Callback(hObject, eventdata, handles)
% hObject    handle to popLevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popLevel,'Value')   
     case 1
     set(handles.t8,'Visible','on');
     set(handles.t8,'String','*');
     case 2
      handles.obj.bcrabl1level=1;
      set(handles.t8,'Visible','off');
     case 3
      handles.obj.bcrabl1level=2;
      set(handles.t8,'Visible','off');
     case 4
      handles.obj.bcrabl1level=3;
      set(handles.t8,'Visible','off');
    otherwise        
 end  
set(handles.popLevel, 'UserData', handles.obj.bcrabl1level);
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popLevel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popLevel


% --- Executes during object creation, after setting all properties.
function popLevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popLevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popType.
function popType_Callback(hObject, eventdata, handles)
% hObject    handle to popType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popType,'Value') 
     case 1
     set(handles.t9,'Visible','on');
     set(handles.t9,'String','*');
    case 2
      handles.obj.bcrabl1transcripttype=1;
      set(handles.t9,'Visible','off');
    case 3
      handles.obj.bcrabl1transcripttype=2;
      set(handles.t9,'Visible','off');
    case 4
      handles.obj.bcrabl1transcripttype=3;
      set(handles.t9,'Visible','off');
    case 5
      handles.obj.bcrabl1transcripttype=4;
      set(handles.t9,'Visible','off');
    otherwise         
 end  
set(handles.popType, 'UserData', handles.obj.bcrabl1transcripttype);
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popType


% --- Executes during object creation, after setting all properties.
function popType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.uibuttongroup2,'SelectedObject');
selectedModel=get(s,'String');
switch selectedModel
    case 'Model D'
        set(handles.Recommendation,'String',' ');
        set(handles.ErrorMsg,'String',' ');
        set(handles.popAge,'Enable','on');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','on');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','off');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
    case 'Model E'
        set(handles.Recommendation,'String',' ');
        set(handles.ErrorMsg,'String',' ');
        set(handles.popAge,'Enable','on');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','on');
        set(handles.popOA,'Enable','on');
        set(handles.popLevel,'Enable','on');
        set(handles.popType,'Enable','on');
    case 'Model F'
        
        set(handles.Recommendation,'String',' ');
        set(handles.ErrorMsg,'String',' ');
        set(handles.popAge,'Enable','off');
        set(handles.popGender,'Enable','on');
        set(handles.popSpleen,'Enable','on');
        set(handles.popBlast,'Enable','on');
        set(handles.popMonocytes,'Enable','off');
        set(handles.popEosinophils,'Enable','off');
        set(handles.popOA,'Enable','on');
        set(handles.popLevel,'Enable','off');
        set(handles.popType,'Enable','off');
        
end
guidata(hObject,handles);
