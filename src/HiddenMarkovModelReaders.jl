################################################################################

module HiddenMarkovModelReaders

################################################################################

# dependencies
using StructArrays

################################################################################

# exports
export setup!
export process!

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
