################################################################################

@testset "Setup" begin

  # read file into hidden Markov model
  include("data/readfile.jl")

  @test hmm.dataM == [zeros(size(v, 2))]
  @test hmm.tbM == [[0.0; repeat([-1.0], size(v, 1))]]

end

################################################################################
