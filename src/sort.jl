####################################################################################################

"sort hidden Markov model by amplitude."
function sortHMM!(∫::HMM)

  # calculate amplitude
  ampVc = map(amplitude, ∫.data)

  # sort
  sortedAmpVc = sort(ampVc)

  # find indexes
  ampIxVc = map(sortedAmpVc) do μ
    findall(χ -> χ == μ, ampVc)
  end

  # preallocate
  templ = Array{Array{Number, 1}, 1}()

  # iterate on index vector
  for ι ∈ ampIxVc
    push!(templ, ∫.data[ι[1]])
  end

  # return
  ∫.data = templ
end

####################################################################################################
