################################################################################

"Reset hidden Markov model object"
function reset!(self::HMM)
  self.tbM = [x .= [0; repeat(-1:-1, length(self.tbM[1]) - 1)] for x in self.tbM]
  return self.tbM
end

################################################################################