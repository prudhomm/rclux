% function computeTime: Computes the time required to cross the whole pipe

function t = computeTime(x)

% constants
% g=9.81;
Pout= 101325;% Pa
rho=998.2;
mu=0.001003;
nu=mu/rho;
v0 = 1;
epsilon = 1e-6*ones(1,3);
L=[20*1e-3, 118*1e-3, 50*1e-3]; 

D = x(1:3)';
L(2) = x(4);
% Q = x(5);
Pin = x(5);

% pressure drop
prssDrop = Pin - Pout;

%   sections of the pipes
S = (pi.*(D.^2))./4;
%   Average velocity in each pipe
% V=Q./S;
% Reynolds = Re(V,D,nu);
% F=swamee_jain(zeros(1,3),D,Reynolds);

%   pipes and fittings
% p_f = ( sum(F.*L./D)+ Ke(D(1),D(2))+ Kc(D(2),D(3),pi)); 
[v, swamee] = computeV(epsilon, L, D, prssDrop, rho, nu, v0) ;
%   The equation can also be written in terms of pressure loss:
% v = sqrt((2*Deltap)/ (rho*p_f));
%   time required to pass through the pipe
%   we consider the opposite so we maximise instead of minimising
t = -L(2) / v;
% x(5) = v*S(3);
%pDrop = 0.5*swamee*rho*(v^2)

% dtdD1 = L(2)*sqrt(rho)*(evalTermR(Reynolds(1)) + 4*D(1)*(D(1)^2 - D(2)^2)/D(2)^4) / sqrt((2*Deltap))/2/sqrt(p_f);
% dtdD2 = L(2)*sqrt(rho)*(evalTermR(Reynolds(2)) - 4*(D(1)^2 - D(2)^2)/D(2)^5 + 0.5*(1/D(3) + D(3)/D(2)^2)) / sqrt((2*Deltap))/2/sqrt(p_f);
% dtdD3 = L(2)*sqrt(rho)*(evalTermR(Reynolds(3)) + 0.5*(D(2)/D(3)^2 + 1/D(2))) / sqrt((2*Deltap))/2/sqrt(p_f);
% dtdQ  = 0.45*L(2)*sqrt(rho)*sum(evalTermQ(Reynolds))* Q^(2.8) / sqrt((2*Deltap))/2/sqrt(p_f);
% dtdL  = 1/v;
% dtdP  = L(2)*sqrt(rho*p_f)/ (-Deltap^(1.5));
% grad = [dtdD1; dtdD2; dtdD3; dtdL; dtdQ; dtdP];