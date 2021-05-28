using HiddenMarkovModelReaders
using Test

@testset "HiddenMarkovModelReaders.jl" begin
  @testset "Distances & Amplitude" begin
    @test distance() == # Euclidean distance
    @test bhattDist() == # Bhattacharyya distance
    @test amplitude() == # amplitude
  end

  @testset "Setup Hidden Markov Model" begin
    using DelimitedFiles
    f = readdlm("signal.tsv")

    @test setup(f) == (200., )

  end

  @testset "Process Hidden Markov Model" begin


    @test process()
  end
end
