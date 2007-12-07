# -*- Mode: octave -*-
function [K,beta] = Ke (d1, d2)

  ## usage:  K = Ke (d1, d2)
  ##
  ## return the hydraulic resistance of an expansion fitting
  ##
  ## The losses through these fitting are generally
  ## evaluated by first obtaining beta = d2 / d1 where
  ## d1 is the diameter of the inflow pipe
  ## and d2 the diameter of the outflow pipe and d1 <= d2
  ##
  ## Units:
  ## - d1, d2 in m
  ## - beta dimensionless
  ## - K dimensionless
  beta = d2/d1;
  # K = (1-beta^2)^2/beta^4;
  
  # another alternative for computing the loss expansion coefficient
  K = (1-beta^2)^2;
endfunction
