################################################################################

@testset "Setup" begin

  # read file
  include("readfile.jl")

  # setup hidden Markov model
  hmm = setup(v)

  @test hmm.dataM == [zeros(size(v, 2))]
  @test hmm.tbM == [[0.0; repeat([-1.0], size(v, 1))]]

end

################################################################################
