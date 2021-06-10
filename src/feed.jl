################################################################################

"Feed on hidden Markov model object"
function feed!(self::HMM, frame::Int64, d::Array{Float64, 2}; params::HMMParams)
  for ix in eachindex(self.tbM)
    plus = euclDist(self.dataM[ix], d[frame, :])
    for jx in eachindex(self.tbM)
      lpen = copy(params.pen)
      if (jx == ix) lpen = 0 end
      if self.tbM[jx][frame + 1] < 0. || self.tbM[ix][frame] + plus + lpen < self.tbM[jx][frame + 1]
        self.tbM[jx][frame + 1] = self.tbM[ix][frame] + plus + lpen
      end
    end
  end
end

################################################################################
