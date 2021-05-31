################################################################################

"sort hidden Markov model by amplitude"
function sortHMM!(self::HMM)

  ampVc = map(amplitude, self.dataM)
  sortedAmpVc = sort(ampVc)
  ampIxVc = map(sortedAmpVc) do y
   findall(x -> x == y, ampVc)
  end
  templ = Array{Array{T, 1}, 1}() where T <: Number

  for i in ampIxVc
    push!(templ, self.dataM[i[1]])
  end
  self.dataM = templ
end

################################################################################
