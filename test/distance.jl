################################################################################

@testset "Distances & Amplitude" begin
  @test distance() == # Euclidean distance
  @test bhattDist() == # Bhattacharyya distance
  @test amplitude() == # amplitude
end

################################################################################
