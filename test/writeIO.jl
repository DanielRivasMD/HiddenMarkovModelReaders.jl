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
    @test isfile("out/hmm_Test1_states.csv") == true
    @test isfile("out/hmm_Test1_traceb.csv") == true

    ####################################################################################################

  end

  ####################################################################################################

  # testing
  @testset "Read Hidden Markov model" begin

    ####################################################################################################

    # read
    readStates = readdlm("out/hmm_Test1_states.csv")
    readTraceb = readdlm("out/hmm_Test1_traceb.csv")

    # paired values
    testStates = Array{Any, 2}(undef, 4, 1)
    testStates[:, 1] .= ["Test1"; 1; 2; 3]

    testTraceb = Array{Any, 2}(undef, 4, 1)
    testTraceb[:, 1] .= ["S1"; 1.; 2.; 3.]

    # testing
    @test readStates == testStates
    @test readTraceb == testTraceb

    ####################################################################################################

  end

  ####################################################################################################

end

####################################################################################################
