################################################################################

"""
    setup(v::Array{T, 2}) where <: Number

Initiate hidden Markov model object
"""
function setup!(v::Array{T, 2}) where T <: Number
  noIter = 1
  hmm = HMM([zeros(size(v, 2)) for i in 1:noIter], [zeros(size(v, 1) + 1) for i in 1:noIter])
  reset!(hmm)
  return hmm
end

################################################################################
