# loading the package optimisation
pkg load optim

# initial value
Pin0 = 3*0.98692;
Q0 = 2e-3/60; # m^3/s
L0=[20*1e-3, 118*1e-3, 50*1e-3];
D0=[4*1e-3 , 10*1e-3 , 4*1e-3];
x0 = [D0';L0(2);Q0;Pin0];
# x0 = D0';
# x = x0;

# global variables 
# Reynolds = ones(1,3);
# F = ones(1,3);
# L = L0;
# p_f = 1;

[xopt, obj, info, iter, nf, lambda] = sqp(x0, @computeTime, @gComputeTime, [])