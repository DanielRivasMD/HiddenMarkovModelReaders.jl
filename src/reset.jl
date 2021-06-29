################################################################################

"Reset hidden Markov model object"
function reset!(self::HMM)
  self.tb = [x .= [0; repeat(-1:-1, length(self.tb[1]) - 1)] for x = self.tb]
end

################################################################################
