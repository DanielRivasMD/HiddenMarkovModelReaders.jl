################################################################################

@testset "Setup" begin

  ################################################################################

  # load small array into hidden Markov model
  include("data/smallArray.jl")

  # testing
  @test hmm.data == [zeros(size(x, 2))]
  @test hmm.tb == [[0.0; repeat([-1.0], size(x, 1))]]

  ################################################################################

  # read file into hidden Markov model
  include("data/readfile.jl")

  # testing
  @test hmm.data == [zeros(size(v, 2))]
  @test hmm.tb == [[0.0; repeat([-1.0], size(v, 1))]]

  ################################################################################

end

################################################################################
