% compute time required to cross the whole cylinder based on a Poiseuille 
% profile 
function t = poiseuilleBasedTimeComputation(x)

% constants
g=9.81;
Pout= 11;
Pin=3*0.96;
rho=998.2;
mu=0.001003;
nu=mu/rho;

Q = 2e-3/60;
L=[20*1e-3, 118*1e-3, 50*1e-3];
D=[4*1e-3 , 10*1e-3 , 4*1e-3];

% D = x(1:3)';
% L(2) = x(4);
% Q = x(5);
% Pin = x(5);

Deltap = Pout - Pin;

vmax = 2*Q/(pi*x^2);
t = -L(2) / vmax;