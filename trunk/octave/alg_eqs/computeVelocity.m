## the volume flow rate Q is given by
# Q = 1/(resist*L)*\Delta p
# Q=2l/min
Q = 2e-3/60; # m^3/s
g=9.81;
Pin = 3*1e5;
Pout= 11;
Deltap = Pin - Pout;
rho=998.2;
mu=0.001003;
nu=mu/rho; # mu/rho
L=[20*1e-3, 118*1e-3, 50*1e-3];
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
S = (pi.*(D.^2))./4; # sections of the pipes
V=Q./S; # Average velocity in each pipe
F=swamee_jain(zeros(1,3),D,Re(V,D,nu))

# pipes and fittings
p_f = ( sum(F.*L./D)+ ...
       Ke(D(1),D(2)) + ... # expansion
       Kc(D(2),D(3),pi))  # contraction

## The equation can also be written in terms of pressure loss:
#Deltap = rho * g * h_f
v = sqrt((2*Deltap)/ (rho*p_f))
# vsquared = (2.*Deltap)./ (rho.*p_f)
