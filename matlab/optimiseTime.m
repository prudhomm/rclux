Pin = 3*0.98692;
Q = 2e-3/60;
L=[20*1e-3, 118*1e-3, 50*1e-3];
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
x0 = [D';L(2);Pin];
% 
% [x,fval,exitflag,output] = fminsearch(@computeTime,x0)
% 
Pmin = 2*0.98692;
% lb = [0.001;0.001;0.001;1e-3;2*Q;Pmin];
% ub = [0.008;0.008;0.008;5e-1;4*Q;2*Pmin];
lb = [0.001;0.001;0.001;1e-3;Pmin];
ub = [0.008;0.008;0.008;5e-1;2*Pmin];
[x,t,exitflag,output] = fmincon(@computeTime,x0,[],[],[],[],lb,ub)