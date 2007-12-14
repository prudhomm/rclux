function f = swamee_jain (epsilon,D,Re)

%   The Swamee-Jain equation is used to solve directly for the 
%   Darcy-Weisbach friction factor f for a full-flowing circular pipe.
%   It is an approximation of the implicit Colebrook-White equation.

f = 0.25./(log10(epsilon./(3.7*D)+5.74./(Re.^(0.9))).^2);

