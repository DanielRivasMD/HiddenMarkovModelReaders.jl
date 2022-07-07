####################################################################################################

"Feed on hidden Markov model object."
function feed!(self::HMM, frame::Int64, d::Array{Float64, 2}; params::HMMParams)
  for ι ∈ eachindex(self.model)
    plus = euclDist(self.data[ι], d[frame, :])
    for ε ∈ eachindex(self.model)
      lpen = copy(params.penalty)
      if (ε == ι) lpen = 0 end
      if self.model[ε][frame + 1] < 0. || self.model[ι][frame] + plus + lpen < self.model[ε][frame + 1]
        self.model[ε][frame + 1] = self.model[ι][frame] + plus + lpen
      end
    end
  end
end

####################################################################################################
