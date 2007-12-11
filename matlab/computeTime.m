% function computeTime: Computes the time required to cross the whole pipe
%

function t = computeTime(x)

% constants
g=9.81;
Pout= 11;
% Pin=3*0.96;
rho=998.2;
mu=0.001003;
nu=mu/rho;

Q = 2e-3/60;
L=[20*1e-3, 118*1e-3, 50*1e-3];
% D=[4*1e-3 , 10*1e-3 , 4*1e-3];

D = x(1:3)';
L(2) = x(4);
% Q = x(5);
Pin = x(5);

Deltap = Pout - Pin;

%   # sections of the pipes
S = (pi.*(D.^2))./4;
%   # Average velocity in each pipe
V=Q./S;
Reynolds = Re(V,D,nu);
F=swamee_jain(zeros(1,3),D,Reynolds);

%   # pipes and fittings
p_f = ( sum(F.*L./D)+ Ke(D(1),D(2))+ Kc(D(2),D(3),pi));

%   ## The equation can also be written in terms of pressure loss:
%   #Deltap = rho * g * h_f
v = sqrt((2*Deltap)/ (rho*p_f));
%   # time required to pass through the pipe
%   # t = -length / v;
t = -L(2) / v;

% end function