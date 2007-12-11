# -*- Mode: octave -*-
function [K, beta] = Kc (d1, d2, theta)

  ## usage:  K = Kc (d1, d2, theta)
  ##
  ## return the hydraulic resistance of a contraction fitting
  ##
  ## The losses through these fitting are generally
  ## evaluated by first obtaining ? = d2 / d1 where
  ## d1 is the diameter of the inflow pipe and d2 the
  ## diameter of the outflow pipe and d1 >= d2
  ##
  ## Units:
  ## - d1, d2 in m
  ## - theta in radian
  ## - K dimensionless
  beta = d2/d1;
  K = 0.5*(1-beta^2)*sqrt(sin(theta/2))/beta^4;
  # another alternative for computing the loss contraction coefficient
  # K = 0.42*(1-1/beta^2); 
endfunction
