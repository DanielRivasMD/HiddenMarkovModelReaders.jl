################################################################################

"""
    setup(v::Array{T, 2}) where <: Number

Initiate hidden Markov model object

See also: [`process!`](@ref), [`HMM`](@ref), [`HMMParams`](@ref)
"""
function setup(v::Array{T, 2}) where T <: Number
  hmm = HMM([zeros(size(v, 2))], [zeros(size(v, 1) + 1)])
  reset!(hmm)
  return hmm
end

################################################################################
