D=[4*1e-3 , 10*1e-3 , 4*1e-3];
x0 = 0.5*D(2);
% x0(3) = 2;
% lb = [0.002;0.002];
% ub = [0.008;0.008;];
% [x,t,exitflag,output] = fmincon(@func,x0,[],[],[],[],[],[],@mycon)
lb = 0.0075;
ub = 0.015;

[x,t,exitflag,output] = fmincon(@func,x0,[],[],[],[],lb,ub,@mycon);

% %
% 
% close all
% Pin = 2e5;
% Pout= 101325;% Pa
% rho=998.2;
% mu=0.001003;
% nu=mu/rho;
% 
% prssDrop = Pin - Pout;
% v0 = 8;
% epsilon = 1e-6*ones(1,3);
% L=[20*1e-3, 118*1e-3, 50*1e-3]; 
% D=[4*1e-3 , 10*1e-3 , 4*1e-3];
% 
% r = 7.5*1e-3:0.0002:15*1e-3;
% s = size(r,2);
% v = zeros(1,s);
% for i = 1:s
%     D(2) = r(i);
%     v(i) = computeV(epsilon, L, D, prssDrop, rho, nu, v0 );
% end
% plot(r,v)
% Q = 0.25*pi*v*D(3)^2;
% Q = Q * 60000;
% figure
% plot(r,Q)
