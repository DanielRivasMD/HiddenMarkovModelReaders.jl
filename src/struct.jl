####################################################################################################

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
    model::Array: keep model scores
    traceback::Array: collect traceback

See also: [`HMMParams`](@ref), [`setup`](@ref),
"""
mutable struct HMM
  data::Array
  model::Array
  traceback::Array
end

# TODO: write a function signature verifier
"""
Hidden Markov model parameters.

# Fields
    penalty::Float64: penalty on hidden Markov model. Defualt = 200.
    minimumFrequency::Int64: minimun frequency on model state to split during hypothesis generation. Default = 20.
    verbosity::Bool: increase verbosity. Default = false.
    distance::Function: calculate distance. Possible options provided by this package inlcude: `euclDist`, `bhattDist`. Alternatively, a predefined or an anonymous / λ functions with the form `functionDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number` can be passed.

See also: [`HMM`](@ref), [`setup`](@ref), [`euclDist`](@ref), [`bhattDist`](@ref),
"""
@with_kw struct HMMParams
  penalty::Float64           = 200.      # model penalty
  minimumFrequency::Int64    = 20        # minimum frequency for state split
  verbosity::Bool            = false     # verbosity level
  distance::Function         = distance  # distance function
end

####################################################################################################
