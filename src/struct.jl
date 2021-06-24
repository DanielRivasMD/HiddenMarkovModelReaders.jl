################################################################################

"""
Keep track of scores & indexes

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
Hidden Markov model object

# Fields
    dataM::Array: hold data
    tbM::Array: collect traceback

See also: [`HMMParams`](@ref), [`setup!`](@ref),
"""
mutable struct HMM
  dataM::Array
  tbM::Array
end

"""
Hidden Markov model parameters

# Fields
    pen::Float64: penalty for hidden Markov model
    distance::Function: function used to calculate distance. Possible options inlcude: `euclDist`, `bhattDist`.

See also: [`HMM`](@ref), [`setup!`](@ref), [`euclDist`](@ref), [`bhattDist`](@ref),
"""
@with_kw struct HMMParams
  penalty::Float64           = 200.      # model penalty
  distance::Function         = distance  # distance function
  minimumFrequency::Int64    = 20        # minimum frequency for state split
  verbosity::Bool            = false     # verbosity level
end

################################################################################
