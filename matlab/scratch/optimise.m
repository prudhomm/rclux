clear
clc
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
x0 = 0.5*D(2);
% x0(3) = 2;
% lb = [0.002;0.002];
% ub = [0.008;0.008;];
% [x,t,exitflag,output] = fmincon(@func,x0,[],[],[],[],[],[],@mycon)
lb = 0.001;
ub = 0.05;
A = -1;
options = optimset('Display','iter','GradObj','on');
% [x,t,exitflag,output] = fmincon(@func,x0,[],[],[],[],lb,ub,@mycon,options);
x = fminunc(@func,x0,options);
%%
Pin = 2e5;
Pout= 101325;% Pa
rho=998.2;
mu=0.001003;
nu=mu/rho;
k = 0.000284;
I = 40;
c0 = 1;

prssDrop = Pin - Pout;
v0 = 3;
epsilon = 1e-6*ones(1,3);
L=[20*1e-3, 118*1e-3, 50*1e-3]; 
D=[4*1e-3 , 10*1e-3 , 4*1e-3];
r1 = 2*1e-3:0.0002:6*1e-3;
r2 = 5*1e-3:0.0002:15*1e-3;
% R = 5*1e-3:0.0002:15*1e-3;
% [R1,R2] = meshgrid(r1,r2);
% s = size(R,2);
s1 = size(r1,2);
s2 = size(r2,2);
v = zeros(s1,s2);
% size(v)
minConcentration = 1;
tmin=0;
for i = 1:s1
    D(2) = r1(i);
    for m = 1:s2
%     m  = 0;
%     while m<s2-3
%         m=m+1;
        D(1) = r2(m);
        v(i,m) = computeV(epsilon, L, D, prssDrop, rho, nu, v0 );
        t = L(2) ./ v(i,m);
        concentration = c0*exp(-k*I*t);
        Q = 60000*0.25*pi*v(i,m)*D(3)^2;
        if Q>2 && minConcentration > concentration %&& t>tmin
            %indexBest = [i,m];
            rb = i;
            Rb = m;
            vBest = v(i,m);
            minConcentration = concentration;
        end
    %dmyfunc = 2*L(2)*k*I*myfunc/pi/x^3;
    end
end
t = L(2) ./ vBest;%(indexBest(1),indexBest(2));
concentration = c0*exp(-k*I*t);
Q = 60000*0.25*pi*v*D(3)^2;
optimalradius =[r1(rb);r2(Rb)]
%% figure
% subplot(1,2,1)
[R1,R2] = meshgrid(r1,r2);
plot3(R1,R2,Q')
title 'Debit fonction de R l/mn';
%%
figure
tt = linspace(0,t,20);
ct =c0*exp(-k*I*tt);
plot(tt,ct)
title 'Concentration fonction de temps';
% subplot(1,2,2)
% plot(R,concentration)
% title 'Concentration fonction de R';
%%
minTime = 4*log(10)/k/I

%%
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
