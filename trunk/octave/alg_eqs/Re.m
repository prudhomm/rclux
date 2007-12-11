# -*- Mode: octave -*-
function Rey = Re (v, D, nu )

  ## usage:  Rey = Re (v, D, nu)
  ##
  ##  calculates the Reynols number
  Rey=v.*D./nu;
endfunction
