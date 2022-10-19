function varargout = SETUP_UAVSIM(varargin)
% SETUP_UAVSIM MATLAB code for SETUP_UAVSIM.fig
%      SETUP_UAVSIM, by itself, creates a new SETUP_UAVSIM or raises the existing
%      singleton*.
%
%      H = SETUP_UAVSIM returns the handle to a new SETUP_UAVSIM or the handle to
%      the existing singleton*.
%
%      SETUP_UAVSIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SETUP_UAVSIM.M with the given input arguments.
%
%      SETUP_UAVSIM('Property','Value',...) creates a new SETUP_UAVSIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SETUP_UAVSIM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SETUP_UAVSIM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SETUP_UAVSIM

% Last Modified by GUIDE v2.5 19-May-2015 21:15:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SETUP_UAVSIM_OpeningFcn, ...
                   'gui_OutputFcn',  @SETUP_UAVSIM_OutputFcn, ...
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


% --- Executes just before SETUP_UAVSIM is made visible.
function SETUP_UAVSIM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SETUP_UAVSIM (see VARARGIN)

% Choose default command line output for SETUP_UAVSIM
handles.output = hObject;

% *** Set init setup for SETUP_UAVSIM
handles = set_initsetup(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SETUP_UAVSIM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SETUP_UAVSIM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1_1 as text
%        str2double(get(hObject,'String')) returns contents of edit1_1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1_2 as text
%        str2double(get(hObject,'String')) returns contents of edit1_2 as a double


% --- Executes during object creation, after setting all properties.
function edit1_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1_3 as text
%        str2double(get(hObject,'String')) returns contents of edit1_3 as a double


% --- Executes during object creation, after setting all properties.
function edit1_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit1_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1_4 as text
%        str2double(get(hObject,'String')) returns contents of edit1_4 as a double


% --- Executes during object creation, after setting all properties.
function edit1_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edNOP_Callback(hObject, eventdata, handles)
% hObject    handle to edNOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edNOP as text
%        str2double(get(hObject,'String')) returns contents of edNOP as a double


% --- Executes during object creation, after setting all properties.
function edNOP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edNOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbSetWaypoint.
function pbSetWaypoint_Callback(hObject, eventdata, handles)
% hObject    handle to pbSetWaypoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *** Call cb_setwaypoint function for waypoint selection
cb_setwaypoint(handles)


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_1 as text
%        str2double(get(hObject,'String')) returns contents of edit2_1 as a double


% --- Executes during object creation, after setting all properties.
function edit2_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_2 as text
%        str2double(get(hObject,'String')) returns contents of edit2_2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_3 as text
%        str2double(get(hObject,'String')) returns contents of edit2_3 as a double


% --- Executes during object creation, after setting all properties.
function edit2_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_4 as text
%        str2double(get(hObject,'String')) returns contents of edit2_4 as a double


% --- Executes during object creation, after setting all properties.
function edit2_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_1 as text
%        str2double(get(hObject,'String')) returns contents of edit3_1 as a double


% --- Executes during object creation, after setting all properties.
function edit3_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_2 as text
%        str2double(get(hObject,'String')) returns contents of edit3_2 as a double


% --- Executes during object creation, after setting all properties.
function edit3_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_3 as text
%        str2double(get(hObject,'String')) returns contents of edit3_3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_4 as text
%        str2double(get(hObject,'String')) returns contents of edit3_4 as a double


% --- Executes during object creation, after setting all properties.
function edit3_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_1 as text
%        str2double(get(hObject,'String')) returns contents of edit4_1 as a double


% --- Executes during object creation, after setting all properties.
function edit4_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_2 as text
%        str2double(get(hObject,'String')) returns contents of edit4_2 as a double


% --- Executes during object creation, after setting all properties.
function edit4_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_3 as text
%        str2double(get(hObject,'String')) returns contents of edit4_3 as a double


% --- Executes during object creation, after setting all properties.
function edit4_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_4 as text
%        str2double(get(hObject,'String')) returns contents of edit4_4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit5_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5_1 as text
%        str2double(get(hObject,'String')) returns contents of edit5_1 as a double


% --- Executes during object creation, after setting all properties.
function edit5_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit5_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5_2 as text
%        str2double(get(hObject,'String')) returns contents of edit5_2 as a double


% --- Executes during object creation, after setting all properties.
function edit5_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit5_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5_3 as text
%        str2double(get(hObject,'String')) returns contents of edit5_3 as a double


% --- Executes during object creation, after setting all properties.
function edit5_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit5_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5_4 as text
%        str2double(get(hObject,'String')) returns contents of edit5_4 as a double


% --- Executes during object creation, after setting all properties.
function edit5_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit6_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6_1 as text
%        str2double(get(hObject,'String')) returns contents of edit6_1 as a double


% --- Executes during object creation, after setting all properties.
function edit6_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit6_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6_2 as text
%        str2double(get(hObject,'String')) returns contents of edit6_2 as a double


% --- Executes during object creation, after setting all properties.
function edit6_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit6_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6_3 as text
%        str2double(get(hObject,'String')) returns contents of edit6_3 as a double


% --- Executes during object creation, after setting all properties.
function edit6_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit6_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6_4 as text
%        str2double(get(hObject,'String')) returns contents of edit6_4 as a double


% --- Executes during object creation, after setting all properties.
function edit6_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit7_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7_1 as text
%        str2double(get(hObject,'String')) returns contents of edit7_1 as a double


% --- Executes during object creation, after setting all properties.
function edit7_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit7_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7_2 as text
%        str2double(get(hObject,'String')) returns contents of edit7_2 as a double


% --- Executes during object creation, after setting all properties.
function edit7_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit7_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7_3 as text
%        str2double(get(hObject,'String')) returns contents of edit7_3 as a double


% --- Executes during object creation, after setting all properties.
function edit7_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit7_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7_4 as text
%        str2double(get(hObject,'String')) returns contents of edit7_4 as a double


% --- Executes during object creation, after setting all properties.
function edit7_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit8_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8_1 as text
%        str2double(get(hObject,'String')) returns contents of edit8_1 as a double


% --- Executes during object creation, after setting all properties.
function edit8_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit8_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8_2 as text
%        str2double(get(hObject,'String')) returns contents of edit8_2 as a double


% --- Executes during object creation, after setting all properties.
function edit8_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit8_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8_3 as text
%        str2double(get(hObject,'String')) returns contents of edit8_3 as a double


% --- Executes during object creation, after setting all properties.
function edit8_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit8_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8_4 as text
%        str2double(get(hObject,'String')) returns contents of edit8_4 as a double


% --- Executes during object creation, after setting all properties.
function edit8_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit9_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9_1 as text
%        str2double(get(hObject,'String')) returns contents of edit9_1 as a double


% --- Executes during object creation, after setting all properties.
function edit9_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit9_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9_2 as text
%        str2double(get(hObject,'String')) returns contents of edit9_2 as a double


% --- Executes during object creation, after setting all properties.
function edit9_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit9_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9_3 as text
%        str2double(get(hObject,'String')) returns contents of edit9_3 as a double


% --- Executes during object creation, after setting all properties.
function edit9_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit9_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9_4 as text
%        str2double(get(hObject,'String')) returns contents of edit9_4 as a double


% --- Executes during object creation, after setting all properties.
function edit9_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit10_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10_1 as text
%        str2double(get(hObject,'String')) returns contents of edit10_1 as a double


% --- Executes during object creation, after setting all properties.
function edit10_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit10_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10_2 as text
%        str2double(get(hObject,'String')) returns contents of edit10_2 as a double


% --- Executes during object creation, after setting all properties.
function edit10_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit10_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10_3 as text
%        str2double(get(hObject,'String')) returns contents of edit10_3 as a double


% --- Executes during object creation, after setting all properties.
function edit10_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit10_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10_4 as text
%        str2double(get(hObject,'String')) returns contents of edit10_4 as a double


% --- Executes during object creation, after setting all properties.
function edit10_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbSave.
function pbSave_Callback(hObject, eventdata, handles)
% hObject    handle to pbSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *** Call cb_savewaypoint to save the selected waypoints
cb_savewaypoint(handles);


% --- Executes on button press in pbReset.
function pbReset_Callback(hObject, eventdata, handles)
% hObject    handle to pbReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *** Reset the map and other object to initial state
cb_setupreset(handles);


% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in pbTwoDim.
function pbTwoDim_Callback(hObject, eventdata, handles)
% hObject    handle to pbTwoDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *** Call cb_set2view
handles = cb_set2view(handles);

% *** Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbThreeDim.
function pbThreeDim_Callback(hObject, eventdata, handles)
% hObject    handle to pbThreeDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *** Call cb_set3view function
handles = cb_set3view(handles);

% Update handles structure
guidata(hObject, handles);


% --- Executes on slider movement.
function slHorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to slHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% *** Call cb_slhorizontal()
cb_slhorizontal(handles);



% az = get(hObject,'Value');
% el = get(handles.slHorizontal,'Value');
% set(handles.edHorAngle,'String',num2str(az));
% axes(handles.axMapSetup);
% view(az,el);

% --- Executes during object creation, after setting all properties.
function slHorizontal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slVertical_Callback(hObject, eventdata, handles)
% hObject    handle to slVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% *** Call cb_slvertical()
cb_slvertical(handles);


% --- Executes during object creation, after setting all properties.
function slVertical_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edVerAngle_Callback(hObject, eventdata, handles)
% hObject    handle to edVerAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edVerAngle as text
%        str2double(get(hObject,'String')) returns contents of edVerAngle as a double


% --- Executes during object creation, after setting all properties.
function edVerAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edVerAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edHorAngle_Callback(hObject, eventdata, handles)
% hObject    handle to edHorAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edHorAngle as text
%        str2double(get(hObject,'String')) returns contents of edHorAngle as a double


% --- Executes during object creation, after setting all properties.
function edHorAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edHorAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
