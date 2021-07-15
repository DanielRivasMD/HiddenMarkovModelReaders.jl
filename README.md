# HiddenMarkovModelReaders

<!--[![Latest Release](https://img.shields.io/github/release/DanielRivasMD/HiddenMarkovModelReaders.jl.svg)]-->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://DanielRivasMD.github.io/HiddenMarkovModelReaders.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://DanielRivasMD.github.io/HiddenMarkovModelReaders.jl/dev)


 ## Description

A package for creating Hidden Markov Models & hypothesis generation for signal processing.

## Installation

```julia
julia>]
pkg> add HiddenMarkovModelReaders
```

To exit Pkg mode, just backspace. Once the package is installed it can be imported with:

```julia
julia> using HiddenMarkovModelReaders
```

For more information, see the [Pkg documentation](https://docs.julialang.org/en/v1/stdlib/Pkg/).

## Usage

Using `Parameters.jl` and `HMMParams` struct the user can control all of the parameters of the model in a user friendly way.

The `distance` function passed to `HMMParams` struct could either be a function:
- Contained in `HiddenMarkovModelReaders` package, i.e., `euclDist` or `bhattDist`, for Euclidean or Bhattacharyya distances, respectively.
- A user predefined function whose declaration precceds the `HMMParams` strcutor.
- A lambda or anonymous function defined within the struct declaration.

The function must be of the form `function distance(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number`.

```julia
# Hidden Markov model parameters

# Declare all values explicitly
explicitParams = HMMParams(
  penalty                    = 200,
  distance                   = bhattDist,                  # package-defined distance function
  minimumFrequency           = 20,
  verbosity                  = false,
)

# Use default values and use package-defined distance function
defaultParams = HMMParams(
  distance                   = euclDist,                   # package-defined distance function
)

# User-defined distance function
function myDist(arr, h)
  return (arr .- h) .^ 2
end

# Use prefined distance function
myfunctionParams = HMMParams(
  distance                   = myDist,                     # user-predefined distance function
)

# Use lambda distance function within struct declaration
lambdaFunctionParams = HMMParams(
  distance                   = x, y -> (x .- y) .^ 2       # lambda or anonymous distance function
)

```

Initialize a Hidden Markov model object with `setup` function.

```julia
# declare random two-dimensional array
x = rand(10, 5)

# setup Hidden Markov model object
hmm = setup(x)
```

Control the training using `process!` function.

```julia
# create a dictionary to hold results
resultsDc = Dict()

# procces Hidden Markov model with state splitting option
resultsDc[1] = process!(hmm, x, true, params = hmmParams)

# procces Hidden Markov model without state splitting option
resultsDc[2] = process!(hmm, x, false, params = hmmParams)
```

## Citations

If you use HiddenMarkovModelReaders or derivates in your work, please consider citing the code record.

## Contributing and Support

[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

In general contributions should follow [ColPrac](https://github.com/SciML/ColPrac). If you are interested in extending/improving HiddenMarkovModelReaders, head to the [discussions](https://github.com/DanielRivasMD/HiddenMarkovModelReaders/discussions) to reach out. For support with using HiddenMarkovModelReaders, please open an [issue](https://github.com/DanielRivasMD/HiddenMarkovModelReaders/issues/new/) describing the problem and steps to reproduce it.

## License

This package is licensed under the MIT Expat license. See [LICENSE](LICENSE) for more informaiton.

---

**Author's Note**: This package is still under active development and is subject to change.
