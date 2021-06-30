################################################################################

using HiddenMarkovModelReaders
using Test
using DelimitedFiles

################################################################################

tests = [

  # private functions
  "reset.jl",
  "feed.jl",
  "backTrace.jl",
  "sort.jl",

  # export functions
  "distance.jl",

  "setup.jl",

  "process.jl",

]

################################################################################

@testset verbose = true "Hidden Markov Model Readers" begin

  for tst ∈ tests
    include(tst)
  end

end

################################################################################
