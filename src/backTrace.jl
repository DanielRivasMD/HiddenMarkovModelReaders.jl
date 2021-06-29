################################################################################

"Backtrace on hidden Markov model object"
function backTrace(self::HMM)
  state = 0
  min = self.tb[1][end]

  for ι ∈ eachindex(self.tb)
    if self.tb[ι][end] <= min
      state = ι
      min = self.tb[ι][end]
    end

    tb = fill(-1, size(self.tb[1], 1))

    for ι ∈ reverse(eachindex(self.tb[1]))
      vlocal = min
      global sig = -1

      for ε ∈ eachindex(self.tb)
        dob = self.tb[ε][ι]
        if dob <= vlocal
          vlocal = dob
          sig = ε
        end
      end

      tb[ι] = state
      state = sig

    end

    tb = tb[1:end - 1]

    return tb
  end
end

################################################################################
