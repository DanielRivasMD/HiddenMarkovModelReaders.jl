################################################################################

begin
  include("reset.jl")
end;

################################################################################

"""
    setup(v::Array{Float64, 2};
    penalty = 200.)

Initiate Hidden Markov Model
"""
function setup(v::Array{Float64, 2}; penalty = 200.)
  # mPen = 200.
  noIter = 1
  hmm = HMM([zeros(size(v, 2)) for i in 1:noIter], [zeros(size(v, 1) + 1) for i in 1:noIter])
  reset!(hmm)
  return (penalty, hmm)
end

################################################################################
