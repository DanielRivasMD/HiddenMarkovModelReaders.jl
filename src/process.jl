################################################################################

"""
    process(self::HMM, d::Array{T, 2}, splitSw::Bool;
    params::HMMParams) where T <: Number

# Description
Process hidden Markov model object.
Meant as an iterative mutating function, perform several steps:
  - reset model traceback.
  - feed frames into model data.
  - update model.
  - generate hypothesized new states.


See also: [`setup`](@ref), [`HMM`](@ref), [`HMMParams`](@ref)
"""
function process!(self::HMM, d::Array{T, 2}, splitSw::Bool; params::HMMParams) where T <: Number

  # reset
  reset!(self)

  # feed frame
  for ι ∈ axes(d, 1)
    feed!(self, ι, d, params = params)
  end

  # backtrace
  τ = backTrace(self)

  divider = fill(1, size(self.data, 1))
  orig = deepcopy(self.data)
  pp = StructArrays.StructArray{ScorePair}(undef, 0)

  # update model
  mdist = zeros(Float64, size(self.data))
  mcount = zeros(Float64, size(self.data))

  for ι ∈ axes(d, 1)
    self.data[τ[ι]] .+= d[ι, :]
    divider[τ[ι]] += 1
    pair = ScorePair(params.distance(orig[τ[ι]], d[ι, :]), ι)

    mdist[τ[ι]] += pair.score
    mcount[τ[ι]] += 1

    push!(pp, pair)
  end

  scores = sort(pp.score, rev = true)
  ixs = map(χ -> findall(χ .== pp.score), scores)
  pp = pp[vcat(ixs...)]

  for ι ∈ eachindex(self.data)
    self.data[ι] /= divider[ι]
  end

  if params.verbosity
    for ε ∈ eachindex(self.data)
      @info "Print state $(ε)"
      for ι ∈ eachindex(self.data[ε])
        println(round(self.data[ε][ι]; digits = 3))
      end
    end
  end

  sortHMM!(self)

  if !splitSw
    return τ, self.data
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

  extra = fill(0, size(self.data[1], 1))

  count = 1
  for ι ∈ eachindex(pp)
    if τ[pp[ι].index] != toSplit
      continue
    end
    extra += d[pp[ι].index, :]
    count += 1
    if count >= half
      break
    end
  end

  extra ./= (count - 1)

  push!(self.data, extra)

  push!(self.tb, fill(0, size(self.tb[1], 1)))

  return τ, self.data

end

################################################################################
