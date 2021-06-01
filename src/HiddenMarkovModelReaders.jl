################################################################################

module HiddenMarkovModelReaders

################################################################################

# dependencies
using StructArrays
using Parameters

################################################################################

# exports
export setup!
export process!
# hidden Markov model object & parameters
export HMM, HMMParams

# distance functions
export euclDist, bhattDist

################################################################################

# hidden markov model object
include("struct.jl")

# methods
include("reset.jl")
include("feed.jl")
include("backTrace.jl")
include("sort.jl")

# distances
include("distance.jl")

# setup
include("setup.jl")

# process
include("process.jl")

################################################################################

end

################################################################################
