<!-- Title -->
<h1 align="center">
  HiddenMarkovModelReaders
</h1>

<!-- description -->
<p align="center">
  <strong>Hidden Markov model and unsupervised hypothesis generator for signal processing and anomaly detection</strong>
</p>

<!-- Information badges -->
<p align="center">
  <a href="https://www.repostatus.org/#active">
    <img alt="Repo status" src="https://www.repostatus.org/badges/latest/active.svg?style=flat-square" />
  </a>
  <a href="https://mit-license.org">
    <img alt="MIT license" src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square">
  </a>
  <a href="https://DanielRivasMD.github.io/HiddenMarkovModelReaders/stable">
    <img alt="Stable" src="https://img.shields.io/badge/docs-stable-blue.svg">
  </a>
  </a>
  <a href="https://DanielRivasMD.github.io/HiddenMarkovModelReaders/dev">
    <img alt="Dev" src="https://img.shields.io/badge/docs-dev-blue.svg">
  </a>
</p>

<!-- Community -->
<p align="center">
  <a href="https://github.com/DanielRivasMD/HiddenMarkovModelReaders/discussions">
    <img alt="Ask us anything" src="https://img.shields.io/badge/Ask%20us-anything-1abc9c.svg?style=flat-square">
  </a>
  <a href="https://github.com/SciML/ColPrac">
    <img alt="ColPrac: Contributor's Guide on Collaborative Practices for Community Packages" src="https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet?style=flat-square">
  </a>
</p>

<!-- Version and documentation badges -->
<p align="center">
  <a href="https://github.com/DanielRivasMD/HiddenMarkovModelReaders/releases">
    <img alt="GitHub tag (latest SemVer pre-release)" src="https://img.shields.io/github/v/tag/DanielRivasMD/MindReader.jl?include_prereleases&label=latest%20version&logo=github&sort=semver&style=flat-square">
  </a>
</p>

![HiddenMarkovModelReaders](assets/HiddenMarkovModelReaders.png)

 ## Description

**HiddenMarkovModelReaders** is a package for creating Hidden Markov models and unsupervised hypothesis generation for signal processing and anomaly detection.

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
- Contained in **HiddenMarkovModelReaders** package, i.e., `euclideanDistance` or `bhattacharyyaDistance`, for Euclidean or Bhattacharyya distances, respectively.
- A user predefined function whose declaration precceds the `HMMParams` strcutor.
- A lambda or anonymous function defined within the struct declaration.

The function must be of the form `function distance(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number`.

```julia
# Hidden Markov model parameters

# Declare all values explicitly
explicitParams = HMMParams(
  penalty                    = 200,
  distance                   = bhattacharyyaDistance,                  # package-defined distance function
  minimumFrequency           = 20,
  verbosity                  = false,
)

# Use default values and use package-defined distance function
defaultParams = HMMParams(
  distance                   = euclideanDistance,                   # package-defined distance function
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

If you use **HiddenMarkovModelReaders** or derivates in your work, please consider citing the code record.

## Contributing and Support

[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

In general contributions should follow [ColPrac](https://github.com/SciML/ColPrac). If you are interested in extending/improving **HiddenMarkovModelReaders**, head to the [discussions](https://github.com/DanielRivasMD/HiddenMarkovModelReaders/discussions) to reach out. For support with using **HiddenMarkovModelReaders**, please open an [issue](https://github.com/DanielRivasMD/HiddenMarkovModelReaders/issues/new/) describing the problem and steps to reproduce it.

## License

This package is licensed under the MIT Expat license. See [LICENSE](LICENSE) for more informaiton.

---

**Author's Note**: This package is still under active development and is subject to change.
