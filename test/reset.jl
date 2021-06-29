################################################################################

@testset "Reset" begin

  ################################################################################

  # load small array into hidden Markov model
  include("data/smallArray.jl")

  # reset
  resetedhmm = HiddenMarkovModelReaders.reset!(HMM([zeros(size(x, 2))], [zeros(size(x, 1) + 1)]))

  # testing
  @test resetedhmm == [[0.0; repeat([-1.0], size(x, 1))]]
  @test hmm.data == [zeros(size(x, 2))]
  @test hmm.tb == [[0.0; repeat([-1.0], size(x, 1))]]

  ################################################################################

  # read file into hidden Markov model
  include("data/readfile.jl")

  # reset
  resetedhmm = HiddenMarkovModelReaders.reset!(HMM([zeros(size(v, 2))], [zeros(size(v, 1) + 1)]))

  # testing
  @test resetedhmm == [[0.0; repeat([-1.0], size(v, 1))]]
  @test hmm.data == [zeros(size(v, 2))]
  @test hmm.tb == [[0.0; repeat([-1.0], size(v, 1))]]

  ################################################################################

end

################################################################################
