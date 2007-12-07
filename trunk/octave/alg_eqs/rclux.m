## the volume flow rate Q is given by
# Q = 1/(resist*L)*\Delta p
# Q=2l/min
Q = 2e-3/60; # m^3/s
g=9.81;
v=1;
rho=998.2;
mu=0.001003;
nu=mu/rho; # mu/rho
L=[20*1e-3, 118*1e-3, 50*1e-3];
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
#F=swamee_jain(zeros(1,3),D,Re(v,D,nu))
for i = [1 2 3]
  F(i)=colebrook_white(zeros(1,3),D(i),Re(v,D(i),nu),1);
end
F
# head loss
h_f = ( sum(F.*L./D)+ ...
       Ke(D(1),D(2)) + ... # expansion
       # it apperas to me that we need to call the function Kc with pi instead of zero
       Kc(D(2),D(3),pi) ...  # contraction
       ).*v.^2/(2*g)

## The equation can also be written in terms of pressure loss:
Deltap = rho * g * h_f
