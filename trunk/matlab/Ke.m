%   return the hydraulic resistance of an expansion fitting
function [K,beta] = Ke (d1, d2)

  beta = d2/d1;
  K = (1-beta^2)^2/beta^4;

