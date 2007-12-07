# -*- Mode: octave -*-
function f = colebrook_white (epsilon,D,Re,x0)

  ## usage:  f = colebrook_white (epsilon)
  ##
  ## The Colebrook-White equation is used to iteratively
  ## solve for the Darcy-Weisbach friction factor f.
  ##
  ##         For Free Surface Flow:
  ##
  ##     \frac{1}{\sqrt{f}} = -2 \log (\frac{e}{12R} +
  ##     \frac{2.51}{Re\sqrt{f}})
  ##
  ##         For Full Flow (Closed Conduit):
  ##
  ## (1) \frac{1}{\sqrt{f}} = -2 \log (\frac{e}{14.8R} +
  ##     \frac{2.51}{Re\sqrt{f}})
  ##
  ## Where f is a function of:
  ##
  ##     * roughness height, e (m, ft)
  ##     * hydraulic diameter, D (m, ft)
  ##     * Reynolds number Re (unitless)
  ## now we solve for the nonlinear equation F(f) = 0
  ## where F is defined by (1) above
  # colebrook_white_fun=inline(['1./sqrt(x)+2.*' ...
                      # 'log(epsilon./(14.8*D/2)+' ...
                      # '2.51./(Re*sqrt(x)))'],'x');
  
  
  # Two possible mistakes: 
  # 1. log10 instead of log
  # 2. The formula as it appears in my course notes is not the same as here!!
  colebrook_white_fun=inline(['1./sqrt(x)+2.*' ...
                      'log10(epsilon./(3.71*D)+' ...
                      '2.51./(Re*sqrt(x)))'],'x');
  f=fsolve(colebrook_white_fun,x0);
endfunction