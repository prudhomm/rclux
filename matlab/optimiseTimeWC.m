% Pin = 2e5;
% Q = 2e-3/60;
% L=[20*1e-3, 118*1e-3, 50*1e-3];
% D=[4*1e-3 , 10*1e-3 , 4*1e-3];
% x0 = [D';L(2);Pin];
% lb = [0.002;0.002;0.001;1e-3;Pin];
% ub = [0.008;0.008;0.008;5e-1;2*Pin];
% [x,t,exitflag,output] = fmincon(@computeTime,x0,[],[],[],[],lb,ub)

x0 = 0.5*D(1:2)';
lb = [0.002;0.002];
ub = [0.008;0.008;];
[x,t,exitflag,output] = fmincon(@computeTime,x0,[],[],[],[],lb,ub)