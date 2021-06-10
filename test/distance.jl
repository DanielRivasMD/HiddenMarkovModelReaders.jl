################################################################################

@testset "Euclidean distance" begin
  @test euclDist(collect(1:10), fill(5, 10)) == 9.219544457292887
end

@testset "Bhattacharyya distance" begin
  @test bhattDist(collect(1:10), fill(5, 10)) == -3.936532135073928
end

@testset "Amplitude" begin
  @test HiddenMarkovModelReaders.amplitude(collect(1:10)) == 19.621416870348583
end

################################################################################
