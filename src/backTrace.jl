################################################################################

"Backtrace on hidden Markov model object."
function backTrace(self::HMM)
  state = 0
  min = self.model[1][end]

  for ι ∈ eachindex(self.model)
    if self.model[ι][end] <= min
      state = ι
      min = self.model[ι][end]
    end

    self.traceback = fill(-1, size(self.model[1], 1))

    for ι ∈ reverse(eachindex(self.model[1]))
      vlocal = min
      global sig = -1

      for ε ∈ eachindex(self.model)
        dob = self.model[ε][ι]
        if dob <= vlocal
          vlocal = dob
          sig = ε
        end
      end

      self.traceback[ι] = state
      state = sig

    end

    self.traceback = self.traceback[1:end - 1]
  end
end

################################################################################
