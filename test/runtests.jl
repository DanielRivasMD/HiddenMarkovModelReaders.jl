################################################################################

using HiddenMarkovModelReaders
using Test
using DelimitedFiles

################################################################################

tests = [
  "distance.jl",
  "setup.jl",
  "process.jl",
]

################################################################################

@testset "HiddenMarkovModelReaders.jl" begin

  for tst ∈ tests
    include(tst)
  end

end

################################################################################
