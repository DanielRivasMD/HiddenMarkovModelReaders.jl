####################################################################################################

@testset verbose = true "Distance" begin

  ####################################################################################################

  # testing
  @testset "Euclidean distance" begin
    @test euclideanDistance(collect(1:10), fill(5, 10)) == 9.219544457292887
    @test euclideanDistance(collect(1:10), fill(7, 10)) == 10.246950765959598
    @test euclideanDistance(collect(1:10), fill(1, 10)) == 16.881943016134134
  end

  ####################################################################################################

  # testing
  @testset "Bhattacharyya distance" begin
    @test bhattacharyyaDistance(collect(1:10), fill(5, 10)) == -3.936532135073928
    @test bhattacharyyaDistance(collect(1:10), fill(7, 10)) == -4.101741743301577
    @test bhattacharyyaDistance(collect(1:10), fill(1, 10)) == -3.1556496448455857
  end

  ####################################################################################################

  # testing
  @testset "Amplitude" begin
    @test HiddenMarkovModelReaders.amplitude(collect(1:10)) == 19.621416870348583
  end

  ####################################################################################################

end

####################################################################################################
