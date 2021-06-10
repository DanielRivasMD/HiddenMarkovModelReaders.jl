################################################################################

using HiddenMarkovModelReaders
using Test
using DelimitedFiles

################################################################################

tests = [
  "distance.jl",
  "setup.jl",
  "process.jl",
  "reset.jl",
]

################################################################################

@testset verbose = true "Hidden Markov Model Readers" begin

  for tst ∈ tests
    include(tst)
  end

end

################################################################################
