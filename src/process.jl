####################################################################################################

"""

    process!(∫::HMM, d::A{N, 2}, ϟ::B;
    params::HMMParams)
    where A <: Array
    where N <: Number
    where B <: Bool

# Description
Process hidden Markov model object.
Meant as an iterative mutating function, perform several steps:
  - reset model traceback.
  - feed frames into model data.
  - update model.
  - generate hypothesized new states.


See also: [`setup`](@ref), [`HMM`](@ref), [`HMMParams`](@ref)
"""
function process!(∫::HMM, ɒ::A{N, 2}, ϟ::B; params::HMMParams) where A <: Array where N <: Number where B <: Bool

  # reset
  reset!(∫)

  # feed frame
  for ι ∈ axes(ɒ, 1)
    feed!(∫, ι, ɒ; params = params)
  end

  # backtrace
  backTrace(∫)

  divider = fill(1, size(∫.data, 1))
  orig = deepcopy(∫.data)
  scorePair = StructArray{ScorePair}(undef, 0)

  # update model
  mdist = zeros(Float64, size(∫.data))
  mcount = zeros(Float64, size(∫.data))

  for ι ∈ axes(d, 1)
    ∫.data[∫.traceback[ι]] .+= d[ι, :]
    divider[∫.traceback[ι]] += 1
    pair = ScorePair(params.distance(orig[∫.traceback[ι]], ɒ[ι, :]), ι)

    mdist[∫.traceback[ι]] += pair.score
    mcount[∫.traceback[ι]] += 1

    push!(scorePair, pair)
  end

  scores = sort(scorePair.score, rev = true)
  ixs = map(χ -> findall(χ .== scorePair.score), scores)
  scorePair = scorePair[vcat(ixs...)]

  # update / normalize models
  for ι ∈ eachindex(∫.data)
    ∫.data[ι] /= divider[ι]
  end

  if params.verbosity
    for ο ∈ eachindex(∫.data)
      @info "Print state $(ο)"
      for ι ∈ eachindex(∫.data[ο])
        println(round(∫.data[ο][ι]; digits = 3))
      end
    end
  end

  sortHMM!(∫)

  if !ϟ
    return
  end

  max = 0.
  toSplit = 1

  for ι ∈ eachindex(mdist)
    if mcount[ι] > params.minimumFrequency
      avdist = mdist[ι] / mcount[ι]
      if avdist > max
        max = avdist
        toSplit = ι
      end
    end
  end

  half = 1 + mcount[toSplit] / 4

  extra = fill(0, size(∫.data[1], 1))

  count = 1
  for ι ∈ eachindex(scorePair)
    if ∫.traceback[scorePair[ι].index] != toSplit
      continue
    end
    extra += d[scorePair[ι].index, :]
    count += 1
    if count >= half
      break
    end
  end

  extra ./= (count - 1)

  push!(∫.data, extra)

  push!(∫.model, fill(0, size(∫.model[1], 1)))

  return

end

####################################################################################################
