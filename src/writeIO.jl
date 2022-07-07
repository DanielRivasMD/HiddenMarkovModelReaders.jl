####################################################################################################

"""

    writeHMM(hmmDc::Dict{S, HMM}, shParams::Dict{S, Any})
    where S <: String

# Description
Write hidden markov model states and traceback wrapper.


See also: [`reconstructHMM`](@ref)
"""
function writeHMM(hmmDc::Dict{S, HMM}, shParams::Dict{S, Any}) where S <: String
  if haskey(shParams, "outDir") && haskey(shParams, "input")
    return writeHMM(
      string(
        shParams["outDir"],
        "hmm/",
        replace(shParams["input"], ".edf" => "_")
      ),
      hmmDc,
    )
  else
    @error "Variables are not defined in dictionary"
  end
end

####################################################################################################

"""

    writeHMM(filePrefix::S, hmmDc::Dict{S, HMM})
    where S <: String

# Description
Write hidden markov model traceback and model wrapper.


See also: [`reconstructHMM`](@ref)
"""
function writeHMM(filePrefix::S, hmmDc::Dict{S, HMM}) where S <: String
  for (κ, υ) ∈ hmmDc
    filename = string(filePrefix, string(κ))
    writeHMM(string(filename, "_traceback", ".csv"), υ.traceback, κ)
    writeHMM(string(filename, "_model", ".csv"), υ.model)
  end
end

####################################################################################################

"""

    writeHMM(filename::S, hmmTraceback::Vector{I}, channel::S)
    where S <: String
    where I <: Integer

# Description
Write hidden markov traceback states wrapper.


See also: [`reconstructHMM`](@ref)
"""
function writeHMM(filename::S, hmmTraceback::Vector{I}, channel::S) where S <: String where I <: Integer
  CSV.write(filename, shiftHMM(hmmTraceback, channel))
end

"""

    writeHMM(filename::S, hmmModel::Vector{Vector{AF}})
    where S <: String
    where AF <: AbstractFloat

# Description
Write hidden markov model model wrapper.


See also: [`reconstructHMM`](@ref)
"""
function writeHMM(filename::S, hmmModel::Vector{Vector{AF}}) where S <: String where AF <: AbstractFloat
  CSV.write(filename, shiftHMM(hmmModel))
end

####################################################################################################

"reorder hidden markov model states into table to write"
function shiftHMM(hmmTraceback::Vector{I}, channel::S) where I <: Integer where S <: String
  return Tables.table(reshape(hmmTraceback, (length(hmmTraceback), 1)), header = [channel])
end

"reorder hidden markov model traceback vectors into table to write"
function shiftHMM(hmmModel::Vector{Vector{AF}}) where AF <: AbstractFloat
  Ω = Array{Float64, 2}(undef, length(hmmModel[1]), length(hmmModel))
  for (ι, υ) ∈ enumerate(hmmModel)
    Ω[:, ι] = υ
  end
  return Tables.table(Ω, header = [Symbol("S$ο") for ο = 1:size(Ω, 2)])
end

####################################################################################################
