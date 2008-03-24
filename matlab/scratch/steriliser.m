function varargout = steriliser(varargin)
% STERILISER M-file for steriliser.fig
%      STERILISER, by itself, creates a new STERILISER or raises the existing
%      singleton*.
%
%      H = STERILISER returns the handle to a new STERILISER or the handle to
%      the existing singleton*.
%
%      STERILISER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STERILISER.M with the given input arguments.
%
%      STERILISER('Property','Value',...) creates a new STERILISER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before steriliser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to steriliser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help steriliser

% Last Modified by GUIDE v2.5 19-Mar-2008 13:35:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @steriliser_OpeningFcn, ...
                   'gui_OutputFcn',  @steriliser_OutputFcn, ...
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


% --- Executes just before steriliser is made visible.
function steriliser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to steriliser (see VARARGIN)

% Choose default command line output for steriliser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes steriliser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = steriliser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function geometry_Callback(hObject, eventdata, handles)
% hObject    handle to geometry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function radiation_Callback(hObject, eventdata, handles)
% hObject    handle to radiation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function algebraic_case_Callback(hObject, eventdata, handles)
% hObject    handle to algebraic_case (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function oneD_case_Callback(hObject, eventdata, handles)
% hObject    handle to oneD_case (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function twoD_case_Callback(hObject, eventdata, handles)
% hObject    handle to twoD_case (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function aglebraic_case_g_Callback(hObject, eventdata, handles)
% hObject    handle to aglebraic_case_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function smallRadius_Callback(hObject, eventdata, handles)
% hObject    handle to smallRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of smallRadius as text
%        str2double(get(hObject,'String')) returns contents of smallRadius as a double
r = str2double(get(handles.smallRadius,'String'));
R = str2double(get(handles.bigRadius,'String'));
L= str2double(get(handles.length,'String'));
len = [20,L,50];
% X = [0, 20, 20, L+20, L+20, L+40];
X = [0, len(1), len(1), L+len(1), L+len(1), L+len(1)+len(3)];
Y = [ r, r, R, R, r, r];
cla(handles.axes1)
line(X,Y)
line(X,-Y)
% --- Executes during object creation, after setting all properties.
function smallRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smallRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bigRadius_Callback(hObject, eventdata, handles)
% hObject    handle to bigRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bigRadius as text
%        str2double(get(hObject,'String')) returns contents of bigRadius as a double
r = str2double(get(handles.smallRadius,'String'));
R = str2double(get(handles.bigRadius,'String'));
L= str2double(get(handles.length,'String'));
len = [20,L,50];
% X = [0, 20, 20, L+20, L+20, L+40];
X = [0, len(1), len(1), L+len(1), L+len(1), L+len(1)+len(3)];
Y = [ r, r, R, R, r, r];
cla(handles.axes1)
line(X,Y)
line(X,-Y)

% --- Executes during object creation, after setting all properties.
function bigRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bigRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double
% length = str2double(get(hObject,'String'))
r = str2double(get(handles.smallRadius,'String'));
R = str2double(get(handles.bigRadius,'String'));
L= str2double(get(handles.length,'String'));
len = [20,L,50];
% X = [0, 20, 20, L+20, L+20, L+40];
X = [0, len(1), len(1), L+len(1), L+len(1), L+len(1)+len(3)];
Y = [ r, r, R, R, r, r];
cla(handles.axes1)
line(X,Y)
line(X,-Y)

% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in compute.
function compute_Callback(hObject, eventdata, handles)
% hObject    handle to compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% disp(eventdata)
disp(handles)



% --------------------------------------------------------------------
function poiseuille_profile_Callback(hObject, eventdata, handles)
% hObject    handle to poiseuille_profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
epsilon = 1e-6*ones(1,3);
Pin = 2e5;
Pout= 101325;
dp = Pin - Pout;
L = str2double(get(handles.length,'String'));
R = str2double(get(handles.bigRadius,'String'));
r = str2double(get(handles.smallRadius,'String'));
rho=998.2;
mu=0.001003;
% nu=mu/rho;
viscosity = mu/rho;%1.005e-6 kinematic viscosity for a temparature of 20 degrees
% n = [10 20 10];
n = 10;
m = 50;
l = 20;
Q = 2e-3/60;%m^3/s
vm = 1e6*Q./(pi*[r, R, r].^2);%m/s
len = [20,L,50]*1e-3;
Len = [20,L,50];
X = [0, Len(1), Len(1), L+Len(1), L+Len(1), L+Len(1)+Len(3)];
Y = [ r, r, R, R, r, r];
cla(handles.axes1)
line(X,Y)
line(X,-Y)
D=2e-3*[r, R, r];
f = friction(epsilon, vm, D, viscosity);
deltap = 0.5*rho*f.*len.* vm.^2./D
x1=linspace(0,Len(1),n);
y1=linspace(0,r,l);
x2=linspace(Len(1)+5,L+Len(1)-10,n);
y2=linspace(0,R,m);
x3=linspace(L+Len(1),Len(1)+L+Len(3),n);
y3=linspace(0,r,l);
%u = zeros(n,m);
% [X,Y] = meshgrid(x,y);
% ur = 0.25*dp*(y'.^2 - r^2)/viscosity/L;
% uR = 0.25*dp*(y'.^2 - R^2)/viscosity/L;
% ur = 2*Q*(-y'.^2 + R^2)/viscosity/L;
% uR = 0.25*dp*(R^2-y'.^2)/viscosity/L;
hold on
u = 0.001*0.25*deltap(1)*(r^2-y1'.^2)/viscosity/Len(1);
u = u * ones(1,n);
u = 20.*u;
quiver(x1,y1,u,zeros(l,n));
u = 0.001*0.25*deltap(2)*(R^2-y2'.^2)/viscosity/Len(2);
u = u * ones(1,n);
quiver(x2,y2,u,zeros(m,n));
u = 0.001*0.25*deltap(3)*(r^2-y3'.^2)/viscosity/Len(3);
u = u * ones(1,n);
quiver(x3,y3,u,zeros(l,n));
% sum(deltap)+Kc(R,r,pi)+Ke(R,r)
% dp



% --------------------------------------------------------------------
function coupling_Callback(hObject, eventdata, handles)
% hObject    handle to coupling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function flowconcentration_Callback(hObject, eventdata, handles)
% hObject    handle to flowconcentration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

epsilon = 1e-6*ones(1,3);
Pin = 2e5;
Pout= 101325;
dp = Pin - Pout;
L = str2double(get(handles.length,'String'));
R = str2double(get(handles.bigRadius,'String'));
r = str2double(get(handles.smallRadius,'String'));
rho=998.2;
mu=0.001003;
% nu=mu/rho;
viscosity = mu/rho;%1.005e-6 kinematic viscosity for a temparature of 20 degrees
% n = [10 20 10];
n = 10;
m = 50;
Q = 2e-3/60;%m^3/s
vm = 1e6*Q./(pi*[r, R, r].^2);%m/s
len = [20,L,50]*1e-3;
Len = [20,L,50];
X = [0, Len(1), Len(1), L+Len(1), L+Len(1), L+Len(1)+Len(3)];
Y = [ r, r, R, R, r, r];
cla(handles.axes1)
line(X,Y)
line(X,-Y)
D=2e-3*[r, R, r];
f = friction(epsilon, vm, D, viscosity);
deltap = 0.5*rho*f.*len.* vm.^2./D
x=linspace(Len(1),L+Len(1),n);
y=linspace(0,R,m);
% simulation sur 3 secondes
T = 100;
t = linspace(0,3,T);
dx = x(2) - x(1);
dy = y(2) - y(1);
dt = t(2) - t(1);
A = zeros(n,n);
u = 0.001*0.25*deltap(2)*(R^2-y'.^2)/viscosity/Len(2);
c0 = 0.1;
k=0.000284;
I0=40000;
alpha = 0.005;

c = zeros(m,n);
for j = 1:m
%     A = (-0.5*u(j)/dx)*diag(ones(n-2,1),-1)+ (1/dt + k*I0*exp(-alpha*(R-j*dy)*rho))*diag(ones(n-1,1)) + (0.5*u(j)/dx)*diag(ones(n-2,1),1);
    A = (-0.5*u(j)/dx)*diag(ones(n-1,1),-1)+ (1/dt + k*I0*exp(-alpha*(R-j*dy)*rho))*diag(ones(n,1)) + (0.5*u(j)/dx)*diag(ones(n-1,1),1);
    A(1,1:2) = [1/dt, 0];
    A(n,n-1:n) = [0, 1/dt];
    cn = c0*ones(n,1);
    cn(n) = 0;
    for t = 1:T
        c(j,:) = A\(cn/dt);
        cn = c(j,:)';
    end
    
end
% A
hold on
colorbar
% shading interp
% fill(x,y,c');
surf(x,y,c);
% u = u * ones(1,n);
% quiver(x,y,c,zeros(m,n));
% --------------------------------------------------------------------
function oneDcase_Callback(hObject, eventdata, handles)
% hObject    handle to oneDcase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


