Pin = 2e5;
Q = 2e-3/60;
L=[20*1e-3, 118*1e-3, 50*1e-3];
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
x0 = [D';L(2);Pin];
[x,fval,exitflag,output] = fminsearch(@computeTime,x0)