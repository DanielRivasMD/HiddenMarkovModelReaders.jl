################################################################################

"sort hidden Markov model by amplitude"
function sortHMM!(self::HMM)

  ampVc = map(amplitude, self.data)
  sortedAmpVc = sort(ampVc)
  ampIxVc = map(sortedAmpVc) do y
   findall(x -> x == y, ampVc)
  end
  templ = Array{Array{T, 1} where T <: Number, 1}()

  for ι ∈ ampIxVc
    push!(templ, self.data[ι[1]])
  end
  self.data = templ
end

################################################################################
