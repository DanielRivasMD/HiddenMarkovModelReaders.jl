################################################################################

"""
Keep track of scores & indexes

# Fields
    score::Float64: score
    index::Int64: index

See also: [`HMM`](@ref)
"""
struct ScorePair
  score::Float64
  index::Int64
end

"""
Hidden Markov model object

# Fields
    dataM::Array: hold data
    tbM::Array: collect traceback

See also: [`ScorePair`](@ref)
"""
mutable struct HMM
  dataM::Array
  tbM::Array
end

@with_kw struct HMMParams
  pen::Float64                 = 200.      # penalty
  distance::Function           = distance  # distance function
end

################################################################################
