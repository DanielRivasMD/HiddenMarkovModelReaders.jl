################################################################################

@testset "Setup Hidden Markov Model" begin
  using DelimitedFiles
  f = readdlm("data/signal.tsv")

  @test setup(f) == (200., )

end

################################################################################
