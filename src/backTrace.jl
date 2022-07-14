####################################################################################################

"Backtrace on hidden Markov model object."
function backTrace(∫::HMM)
  state = 0
  min = ∫.model[1][end]

  for ι ∈ eachindex(∫.model)
    if ∫.model[ι][end] <= min
      state = ι
      min = ∫.model[ι][end]
    end

    ∫.traceback = fill(-1, size(∫.model[1], 1))

    for ι ∈ reverse(eachindex(∫.model[1]))
      vlocal = min
      global sig = -1

      for ο ∈ eachindex(∫.model)
        dob = ∫.model[ο][ι]
        if dob <= vlocal
          vlocal = dob
          sig = ο
        end
      end

      ∫.traceback[ι] = state
      state = sig

    end

    ∫.traceback = ∫.traceback[1:end - 1]
  end
end

####################################################################################################
