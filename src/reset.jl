####################################################################################################

"Reset hidden Markov model object."
function reset!(self::HMM)
  self.model = [χ .= [0; repeat(-1:-1, length(self.model[1]) - 1)] for χ = self.model]
end

####################################################################################################
