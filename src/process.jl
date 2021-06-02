################################################################################

"""
    process(self::HMM, d::Array{T, 2}, splitSw::Bool;
    args) where T <: Number

# Description
Process hidden Markov model object

# Examples
```julia-repl
julia>

```

See also: [`setup!`](@ref), [`HMM`](@ref), [`HMMParams`](@ref)
"""
function process!(self::HMM, d::Array{T, 2}, splitSw::Bool; args) where T <: Number

  # reset
  reset!(self)

  # feed frame
  for ix in axes(d, 1)
    feed!(self, ix, d, args = args)
  end

  # backtrace
  tb = backTrace(self)

  divider = fill(1, size(self.dataM, 1))
  orig = deepcopy(self.dataM)
  pp = StructArrays.StructArray{ScorePair}(undef, 0)

  # update model
  mdist = zeros(Float64, size(self.dataM))
  mcount = zeros(Float64, size(self.dataM))

  for ix in axes(d, 1)
    self.dataM[tb[ix]] .+= d[ix, :]
    divider[tb[ix]] += 1
    pair = ScorePair(args.distance(orig[tb[ix]], d[ix, :]), ix)

    mdist[tb[ix]] += pair.score
    mcount[tb[ix]] += 1

    push!(pp, pair)
  end

  scores = sort(pp.score, rev = true)
  ixs = map(x -> findall(x .== pp.score), scores)
  pp = pp[vcat(ixs...)]

  for ix in eachindex(self.dataM)
    self.dataM[ix] /= divider[ix]
  end

  sortHMM!(self)

  if !splitSw
    return tb, self.dataM
  end

  max = 0.
  toSplit = 1
  minFreq = 20 # hard coded!

  for ix in eachindex(mdist)
    if mcount[ix] > minFreq
      avdist = mdist[ix] / mcount[ix]
      if avdist > max
        max = avdist
        toSplit = ix
      end
    end
  end

  half = 1 + mcount[toSplit] / 4

  extra = fill(0, size(self.dataM[1], 1))

  count = 1
  for ix in eachindex(pp)
    if tb[pp[ix].index] != toSplit
      continue
    end
    extra += d[pp[ix].index, :]
    count += 1
    if count >= half
      break
    end
  end

  extra ./= (count - 1)

  push!(self.dataM, extra)

  push!(self.tbM, fill(0, size(self.tbM[1], 1)))

  return tb, self.dataM

end

################################################################################
