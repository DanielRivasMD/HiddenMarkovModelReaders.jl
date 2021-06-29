################################################################################

"Feed on hidden Markov model object"
function feed!(self::HMM, frame::Int64, d::Array{Float64, 2}; params::HMMParams)
  for ι ∈ eachindex(self.tb)
    plus = euclDist(self.data[ι], d[frame, :])
    for ε ∈ eachindex(self.tb)
      lpen = copy(params.penalty)
      if (ε == ι) lpen = 0 end
      if self.tb[ε][frame + 1] < 0. || self.tb[ι][frame] + plus + lpen < self.tb[ε][frame + 1]
        self.tb[ε][frame + 1] = self.tb[ι][frame] + plus + lpen
      end
    end
  end
end

################################################################################
