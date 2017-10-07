
function varargout = driver_brain(varargin)
% DRIVER_BRAIN MATLAB code for driver_brain.fig
%      DRIVER_BRAIN, by itself, creates a new DRIVER_BRAIN or raises the existing
%      singleton*.
%
%      H = DRIVER_BRAIN returns the handle to a new DRIVER_BRAIN or the handle to
%      the existing singleton*.
%
%      DRIVER_BRAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRIVER_BRAIN.M with the given input arguments.
%
%      DRIVER_BRAIN('Property','Value',...) creates a new DRIVER_BRAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before driver_brain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to driver_brain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help driver_brain

% Last Modified by GUIDE v2.5 22-Feb-2017 22:41:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @driver_brain_OpeningFcn, ...
    'gui_OutputFcn',  @driver_brain_OutputFcn, ...
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


% --- Executes just before driver_brain is made visible.
function driver_brain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to driver_brain (see VARARGIN)

% Choose default command line output for driver_brain
handles.output = hObject;
handles.a=arduino('com9');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes driver_brain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = driver_brain_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on key press with focus on figure1 and none of its controls.
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in switchkeybord.
function switchkeybord_Callback(hObject, eventdata, handles)
% hObject    handle to switchkeybord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = gcf;
while 1
    val=double(get(f,'CurrentCharacter'));
    
    %28 => leftArrow  29 => rightArrow  30 => upArrow  31 => downArrow%
    if val== 28
        %         handles.a.digitalWrite(2,0)
        %         handles.a.digitalWrite(3,0)
        %         handles.a.digitalWrite(4,0)
        %         handles.a.digitalWrite(5,0)
        %
        %    handles.a.digitalWrite(3,1)
        %    handles.a.digitalWrite(3,0)
        handles.a.digitalWrite(4,1)
        handles.a.digitalWrite(5,0)
        pause(.3)
        set(f,'CurrentCharacter','0');
    end
    
    if val==29
        %       handles.a.digitalWrite(2,0)
        %       handles.a.digitalWrite(3,0)
        %       handles.a.digitalWrite(4,0)
        %       handles.a.digitalWrite(5,0)
        
        %       handles.a.digitalWrite(2,0)
        %       handles.a.digitalWrite(3,1)
        handles.a.digitalWrite(4,0)
        handles.a.digitalWrite(5,1)
        pause(.3);
        set(f,'CurrentCharacter','0');
        
    end
    if val == 0
        handles.a.digitalWrite(5,0)
        handles.a.digitalWrite(4,0)
    end
    if val==30
        %         handles.a.digitalWrite(2,0)
        %         handles.a.digitalWrite(3,0)
        %         handles.a.digitalWrite(4,0)
        %         handles.a.digitalWrite(5,0)
        %
        handles.a.digitalWrite(2,0)
        handles.a.digitalWrite(3,1)
        % handles.a.digitalWrite(4,1)
        % handles.a.digitalWrite(5,0)
        pause(.3);
    end
    
    if val==31
        %         handles.a.digitalWrite(2,0)
        %         handles.a.digitalWrite(3,0)
        %         handles.a.digitalWrite(4,0)
        %         handles.a.digitalWrite(5,0)
        
        handles.a.digitalWrite(2,1)
        handles.a.digitalWrite(3,0)
        % handles.a.digitalWrite(4,0)
        % handles.a.digitalWrite(5,1)
        pause(.3);
    end
    
    if val==120
        %         handles.a.digitalWrite(2,0)
        %         handles.a.digitalWrite(3,0)
        handles.a.digitalWrite(4,0)
        handles.a.digitalWrite(5,0)
        
        
    end
    
    
    handles.a.digitalWrite(4,0)
    handles.a.digitalWrite(5,0)
    pause(.0001);
    %
end

guidata(hObject, handles);


% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,0)

handles.a.digitalWrite(2,1)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,1)
handles.a.digitalWrite(5,0)

guidata(hObject, handles);


% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,0)

handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,1)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,1)
guidata(hObject, handles);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,0)

handles.a.digitalWrite(2,1)
% handles.a.digitalWrite(3,0)
% handles.a.digitalWrite(4,0)
% handles.a.digitalWrite(5,1)
guidata(hObject, handles);


% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,0)

% handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,1)
% handles.a.digitalWrite(4,1)
% handles.a.digitalWrite(5,0)
guidata(hObject, handles);


% --- Executes on key press with focus on pushbutton3 and none of its controls.
function pushbutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)




function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output as text
%        str2double(get(hObject,'String')) returns contents of output as a double


% --- Executes during object creation, after setting all properties.
function output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on output and none of its controls.
function output_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
estring ='sfsd';
set(handles.output, 'String', estring);





% --- Executes during object creation, after setting all properties.
function comport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in connecttoarduino.
function connecttoarduino_Callback(hObject, eventdata, handles)
% hObject    handle to connecttoarduino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
com=get(handles.comport,'String');
set(handles.output1,'String',com);

pin1=get(handles.PIN_1, 'Value');
set(handles.output1,'String',pin1);
if pin1
    handles.a.pinMode(2,'output');
end

pin2=get(handles.PIN_2, 'Value');
set(handles.output1,'String',pin2);
if pin2
    handles.a.pinMode(3,'output');
end

pin3=get(handles.PIN_3, 'Value');
set(handles.output1,'String',pin3);
if pin3
    handles.a.pinMode(4,'output');
end

pin4=get(handles.PIN_4, 'Value');
set(handles.output1,'String',pin4);
if pin4
    handles.a.pinMode(5,'output');
end

pin5=get(handles.PIN_5, 'Value');
set(handles.output1,'String',pin5);
if pin5
    handles.a.pinMode(6,'output');
    
end
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,1)
handles.a.digitalWrite(4,1)
handles.a.digitalWrite(5,0)
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function PIN_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PIN_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PIN_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PIN_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PIN_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PIN_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PIN_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PIN_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PIN_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PIN_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in breaks.
function breaks_Callback(hObject, eventdata, handles)
% hObject    handle to breaks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a.digitalWrite(2,0)
handles.a.digitalWrite(3,0)
handles.a.digitalWrite(4,0)
handles.a.digitalWrite(5,0)

guidata(hObject, handles);


% --- Executes on button press in PIN_1.
function PIN_1_Callback(hObject, eventdata, handles)
% hObject    handle to PIN_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PIN_1


% --- Executes on button press in PIN_2.
function PIN_2_Callback(hObject, eventdata, handles)
% hObject    handle to PIN_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PIN_2


% --- Executes on button press in PIN_3.
function PIN_3_Callback(hObject, eventdata, handles)
% hObject    handle to PIN_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PIN_3


% --- Executes on button press in PIN_4.
function PIN_4_Callback(hObject, eventdata, handles)
% hObject    handle to PIN_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PIN_4


% --- Executes on button press in PIN_5.
function PIN_5_Callback(hObject, eventdata, handles)
% hObject    handle to PIN_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PIN_5


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'http://192.168.43.1/snapshot.jpg';
ss = imread(url);
preview(ss);


% --- Executes on key release with focus on figure1 and none of its controls.
function figure1_KeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
switch(eventdata.Key)
    case 'leftarrow'
        handles.a.digitalWrite(4,0)
    case 'rightarrow'
        handles.a.digitalWrite(5,0)
    case 'uparrow'
        handles.a.digitalWrite(3,0)
    case 'downarrow'
        handles.a.digitalWrite(2,0)
        
end

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)


switch(eventdata.Key)
    case 'leftarrow'
        handles.a.digitalWrite(4,1)
        handles.a.digitalWrite(5,0)
    case 'rightarrow'
        handles.a.digitalWrite(4,0)
        handles.a.digitalWrite(5,1)
    case 'uparrow'
        handles.a.digitalWrite(2,0)
        handles.a.digitalWrite(3,1)
    case 'downarrow'
        handles.a.digitalWrite(2,1)
        handles.a.digitalWrite(3,0)
end
% --------------------------------------------------------------------
