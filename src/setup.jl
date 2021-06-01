################################################################################

"""
    setup(v::Array{T, 2};
    penalty = 200.) where <: Number

Initiate hidden Markov model object
"""
function setup!(v::Array{T, 2}; penalty = 200.) where T <: Number
  # mPen = 200.
  noIter = 1
  hmm = HMM([zeros(size(v, 2)) for i in 1:noIter], [zeros(size(v, 1) + 1) for i in 1:noIter])
  reset!(hmm)
  return (penalty, hmm)
end

################################################################################
