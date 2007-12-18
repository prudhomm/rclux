function v = computeV( epsilon, L, D, prssDrop, rho, nu, v0 )
%COMPUTEV Summary of this function goes here
%   Detailed explanation goes here
swameeJain = '(';
for i = 1:size(D,2)
    swameeJain = strcat(swameeJain,'+', num2str(L(i)./D(i)),'*0.25./(log10(',num2str(epsilon(i)),'./(3.7*',num2str(D(i)),')+5.74./((v.*',num2str(D(i)./nu),')^(0.9))).^2)');
end
expr = strcat(swameeJain,'+',num2str(Ke(D(1),D(2))+ Kc(D(2),D(3),pi)),')','.*',num2str(rho),'.*v^2./2',num2str(-prssDrop));
% swameeJain = strcat('0.25./(log10(',num2str(epsilon),'./(3.7*',num2str(D),')+5.74./((v.*',num2str(D./nu),')^(0.9))).^2)');
% expr = strcat('(sum(',swameeJain,'.*',num2str(L./D),')+',num2str(Ke(D(1),D(2))+ Kc(D(2),D(3),pi)),')','.*',num2str(rho),'.*v^2./2',num2str(-prssDrop));
time_fun=inline(expr,'v');
v=fsolve(time_fun,v0);
