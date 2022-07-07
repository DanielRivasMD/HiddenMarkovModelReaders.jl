####################################################################################################

"""

    setup(ɒ::A{N, 2})
    where A <: Array
    where N <: Number

# Description
Initiate hidden Markov model object.


See also: [`process!`](@ref), [`HMM`](@ref), [`HMMParams`](@ref)
"""
function setup(ɒ::A{N, 2}) where A <: Array where N <: Number
  hmm = HMM([zeros(size(ɒ, 2))], [zeros(size(ɒ, 1) + 1)], Array{Int32}(undef, 0))
  reset!(hmm)
  return hmm
end

####################################################################################################
