# -*- Mode: octave -*-
function f = swamee_jain (epsilon,D,Re)

  ## usage:  f = SwameeJain (epsilon,D,Re)
  ##
  ## The Swamee-Jain equation is used to
  ## solve directly for the Darcy-Weisbach friction
  ## factor f for a full-flowing circular pipe.
  ## It is an approximation of the implicit
  ## Colebrook-White equation.
  ##
  ##    f = \frac{0.25}{[log (\frac{\epsilon}{3.7D} +
  ##    \frac{5.74}{Re^{0.9}})]^2}
  ##
  ## Where f is a function of:
  ##
  ##    * roughness height, ? (m, ft)
  ##    * pipe diameter, D (m, ft)
  ##    * Reynolds number, Re (unitless).
  ##
  ## The equation was found to match the Colebrook-White
  ## equation within  1.0% for
  ## 10-6 < epsilon/D < 10-2 and 5000 < Re < 1e8.

  #f = 0.25./(log(epsilon./(3.7*D)+5.74./(Re.^(0.9))).^2); 
  
  # A possible mistake, it's a logarithm base 10 and not a natural logarithm.
  f = 0.25./(log10(epsilon./(3.7*D)+5.74./(Re.^(0.9))).^2);
endfunction
