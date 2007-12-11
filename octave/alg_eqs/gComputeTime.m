function grad = gComputeTime(x)
  
  # constants
  g=9.81;
  Pout= 11;
  rho=998.2;
  mu=0.001003;
  nu=mu/rho; # mu/rho
  L=[20*1e-3, 118*1e-3, 50*1e-3];

  D = x(1:3)';
  length = x(4);
  Q = x(5);
  Pin = x(6);
  Deltap = Pout - Pin;
  L(2) = length;
  
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
  
  dtdD1 = length*sqrt(rho)*(evalTermR(Reynolds(1)) + 4*D(1)*(D(1)^2 - D(2)^2)/D(2)^4) / sqrt((2*Deltap))/2/sqrt(p_f);
  dtdD2 = length*sqrt(rho)*(evalTermR(Reynolds(2)) - 4*(D(1)^2 - D(2)^2)/D(2)^5 + 0.5*(1/D(3) + D(3)/D(2)^2)) / sqrt((2*Deltap))/2/sqrt(p_f);
  dtdD3 = length*sqrt(rho)*(evalTermR(Reynolds(3)) + 0.5*(D(2)/D(3)^2 + 1/D(2))) / sqrt((2*Deltap))/2/sqrt(p_f);
  dtdQ  = 0.45* length*sqrt(rho)*sum(evalTermQ(Reynolds))* Q^(2.8) / sqrt((2*Deltap))/2/sqrt(p_f);
  dtdL  = 1/v;
  dtdP  = length*sqrt(rho*p_f)/ (-Deltap^(1.5));
  grad = [dtdD1; dtdD2; dtdD3; dtdL; dtdQ; dtdP];
  # grad = [dtdD1; dtdD2; dtdD3];
endfunction