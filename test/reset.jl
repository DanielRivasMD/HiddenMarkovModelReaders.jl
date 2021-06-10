################################################################################

@testset "Reset" begin

  # read file
  include("readfile.jl")

  # setup hidden Markov model
  resetedhmm = HiddenMarkovModelReaders.reset!(HMM([zeros(size(v, 2))], [zeros(size(v, 1) + 1)]))

  @test resetedhmm == [[0.0; repeat([-1.0], size(v, 1))]]

end

################################################################################
