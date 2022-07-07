####################################################################################################

@testset "Reset" begin

  ####################################################################################################

  # load small array into hidden Markov model
  include("data/smallArray.jl")

  # reset
  resthmm = HiddenMarkovModelReaders.reset!(HMM([zeros(size(ɒ, 2))], [zeros(size(ɒ, 1) + 1)], Array{Int32}(undef, 0)))

  # testing
  @test resthmm == [[0.0; repeat([-1.0], size(ɒ, 1))]]
  @test hmm.data == [zeros(size(ɒ, 2))]
  @test hmm.model == [[0.0; repeat([-1.0], size(ɒ, 1))]]

  ####################################################################################################

  # read file into hidden Markov model
  include("data/readfile.jl")

  # reset
  resthmm = HiddenMarkovModelReaders.reset!(HMM([zeros(size(ɒ, 2))], [zeros(size(ɒ, 1) + 1)], Array{Int32}(undef, 0)))

  # testing
  @test resthmm == [[0.0; repeat([-1.0], size(ɒ, 1))]]
  @test hmm.data == [zeros(size(ɒ, 2))]
  @test hmm.model == [[0.0; repeat([-1.0], size(ɒ, 1))]]

  ####################################################################################################

end

####################################################################################################
