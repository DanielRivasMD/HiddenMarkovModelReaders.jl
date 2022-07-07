################################################################################

module HiddenMarkovModelReaders

################################################################################

# dependencies
using StructArrays
using Parameters

################################################################################

# hidden Markov model functions
export setup, process!

# hidden Markov model object & parameters
export HMM, HMMParams

# distance functions
export euclDist, bhattDist

# amplitude
export amplitude

# IO
export reconstructHMM
export writeHMM

################################################################################

# load functions
begin

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

  # IO
  include("readIO.jl")
  include("writeIO.jl")

end;

################################################################################

end

################################################################################
