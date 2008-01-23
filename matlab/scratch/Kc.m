%   return the hydraulic resistance of a contraction fitting

function [K, beta] = Kc (d1, d2, theta)

  beta = d2/d1;
  K = 0.5*(1-beta^2)*sqrt(sin(theta/2))/beta^4;

