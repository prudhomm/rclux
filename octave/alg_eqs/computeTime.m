## computeTime

## Author: mahmoud <mahmoud@MAHMOUDCOMPUTER>
## 
## 2007-12-08 mahmoud <mahmoud@MAHMOUDCOMPUTER>
## * Initial revision
# chdir d:
# cd 'M2P'
# loading the package optim to use minimisation functions provided in this package

function t = computeTime(x)
  
  
  # constants
  g=9.81;
  Pout= 11;
  rho=998.2;
  mu=0.001003;
  nu=mu/rho; # mu/rho
  L=[20*1e-3, 118*1e-3, 50*1e-3];
  
  
  D = x(1:3)';
  L(2) = x(4);
  Q = x(5);
  Pin = x(6);
  
  
  Deltap = Pout - Pin;
  
  S = (pi.*(D.^2))./4; # sections of the pipes
  V=Q./S; # Average velocity in each pipe
  Reynolds = Re(V,D,nu);
  F=swamee_jain(zeros(1,3),D,Reynolds);

  # pipes and fittings
  p_f = ( sum(F.*L./D)+ ...
         Ke(D(1),D(2))+ ... # expansion
         Kc(D(2),D(3),pi));  # contraction

  ## The equation can also be written in terms of pressure loss:
  #Deltap = rho * g * h_f
  v = sqrt((2*Deltap)/ (rho*p_f));
  # time required to fully cross the pipe
  # t = -length / v; 
  t = -L(2) / v; 
  
endfunction

