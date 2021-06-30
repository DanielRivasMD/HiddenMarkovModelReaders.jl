################################################################################

"""
Keep track of scores & indexes.

# Fields
    score::Float64: score
    index::Int64: index

See also: [`HMM`](@ref), [`HMMParams`](@ref)
"""
struct ScorePair
  score::Float64
  index::Int64
end

"""
Hidden Markov model object.

# Fields
    data::Array: hold data
    tb::Array: collect traceback

See also: [`HMMParams`](@ref), [`setup!`](@ref),
"""
mutable struct HMM
  data::Array
  tb::Array
end

# TODO: write a function signature verifier
"""
Hidden Markov model parameters.

# Fields
    penalty::Float64: penalty for hidden Markov model.
    distance::Function: function to calculate distance. Possible options provided by this package inlcude: `euclDist`, `bhattDist`. Alternatively, a predefined or an anonymous / λ function with the form `functionDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number` can be passed.
    minimumFrequency::Int64: minimun frequency for model stat to split during hypothesis generation.
    verbosity::Bool: increase verbosity.

See also: [`HMM`](@ref), [`setup!`](@ref), [`euclDist`](@ref), [`bhattDist`](@ref),
"""
@with_kw struct HMMParams
  penalty::Float64           = 200.      # model penalty
  distance::Function         = distance  # distance function
  minimumFrequency::Int64    = 20        # minimum frequency for state split
  verbosity::Bool            = false     # verbosity level
end

################################################################################
