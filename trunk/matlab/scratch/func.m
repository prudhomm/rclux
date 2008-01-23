function myfunc = func( x )
%FUNC Summary of this function goes here
%   Detailed explanation goes here

%%

x
Pin = 2e5;
Pout= 101325;% Pa
rho=998.2;
mu=0.001003;
nu=mu/rho;
v0 = 3;
epsilon = 1e-6*ones(1,3);
L=[20*1e-3, 118*1e-3, 50*1e-3]; 
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
Diam = D;
Diam(2) = 2*x;
% pressure drop
prssDrop = Pin - Pout;
v = computeV(epsilon, L, Diam, prssDrop, rho, nu, v0) 
% x(3) = v;

myfunc = -L(2) / v;
