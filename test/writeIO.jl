####################################################################################################

@testset verbose = true "Write" begin

  ####################################################################################################

  # testing
  @testset "Write Hidden Markov model" begin

    ####################################################################################################

    # empty dict
    toWriteDc = Dict{String, HMM}("Test1" => HMM(Array{AbstractFloat}(undef, 0), [[1., 2., 3.]], [1, 2, 3]))

    # write
    writeHMM("out/hmm_", toWriteDc)

    # testing
    @test isfile("out/hmm_Test1_model.csv") == true
    @test isfile("out/hmm_Test1_traceback.csv") == true

    ####################################################################################################

  end

  ####################################################################################################

  # testing
  @testset "Read Hidden Markov model" begin

    ####################################################################################################

    # read
    readModel = readdlm("out/hmm_Test1_model.csv")
    readTraceback = readdlm("out/hmm_Test1_traceback.csv")

    # paired values
    testModel = Array{Any, 2}(undef, 4, 1)
    testModel[:, 1] .= ["S1"; 1; 2; 3]

    testTraceback = Array{Any, 2}(undef, 4, 1)
    testTraceback[:, 1] .= ["Test1"; 1.; 2.; 3.]

    # testing
    @test readModel == testModel
    @test readTraceback == testTraceback

    ####################################################################################################

  end

  ####################################################################################################

end

####################################################################################################
