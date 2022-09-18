tittle: 'HiddenMarkovModelReaders: A Julia implementation of a Hidden Markov Model and unsupervised hypothesis generation for signal processing'
tags:

- Julia
- signal processing
- machine learning
- unsupervised learning
  authors:
- name: Salvador Daniel Rivas-Carrillo ^[first author]
  orcid: 0000-0002-0143-2687
  affiliation: 1
- name: Manfred G. Grabherr ^[corresponding author]
  orcid: 0000-0001-8792-6508
  affiliation: 1
  affiliations:
- name: Department of Medical Biochemistry and Microbiology, Uppsala University
  index: 1
  date: 07 June 2021
  bibliography: paper.bib

---

# Summary

The amount of data generated every day grows exponentially as technological innovations arise. However, processing and classifying such stream of information in a human expert-dependent manner, that is supervised, is costly and time-consuming. Thus, unsupervised methods to automate data and signal processing offer promising alternatives for efficiency and scalability.

Here, we present a Julia implementation of a Hidden Markov Model and unsupervised hypothesis generation for signal processing, the `HiddenMarkovModelReaders` package. The initial intend was to find repeat patterns in the one-dimensional time-domain applicable to biomedical or general purpose signals, such as electroencephalograms, electrocardiograms, audio, or internet traffic data. Nevertheless, the algorithm of `HiddenMarkovModelReaders` is also applicable for discrete time series, and potentially multidimensional data streams, such as videos or surveillance. The package `HiddenMarkovModelReaders` presents a friendly API to create a hidden Markov model, to manipulate model parameters, such as distance function, penalties, among others, to update the model states and to collect the hypothesized states.

# Statement of need

Hidden Markov Models (HMMs) were invented in the 1960's for solving the problem of back-tracing the inner mechanisms of processes that could not be observed directly [@RN1]. In combination with Gaussian Mixture Models [@RN2], HMMs later became the backbone of signal processing tasks such as automated speech recognition. While HMMs have mostly been used for solving problems in which supervised or semi-supervised training was possible, there were also algorithms that combined HMMs with neural networks to learn in a completely unsupervised manner, e.g. Saguaro [@RN3], MRHMMs [@RN4], and other applications on phylogenetic inference [@RN5].

We selected Julia as the language for implementation due to Julia's just-in-time (JIT) LLVM compiler [@RN6], as well as due to Julia's user-friendliness, and efficient artificial intelligence libraries, e.g., Flux [@RN7], LIBSVM [@RN8], Clustering [@RN9], DecisionTree [@RN10], MultivariateStats [@RN11], NearestNeighbors [@RN12]. The `HiddenMarkovModelReaders` framework is easy-to-use, yet efficient for experimentation, with a functional aspect and multiple dispatch capabilities inherited from the language. Thus, `HiddenMarkovModelReaders` package can be easily incorporated into any data processing pipelines or used as a stand-alone application.

Julia's general user-friendliness renders this software available to people different levels of programming expertise. At the same time, the JIT LLVM compiler ensures that applications scale with larger amounts of data. Given efficient libraries of machine learning and artificial intelligence algorithms in Julia, `HiddenMarkovModelReaders` is a valuable contribution to the growing set of automation algorithms and implementations.

# Description

The package `HiddenMarkovModelReaders` exposes APIs to declare the basic settings: the `HMMParams` struct, where the transition `penalty` for the model, the `distance` function to use, and the `verbosity` level can be defined. Also, this package allows to create and manipulate the Hidden Markov model `HMM`, where `data` records incoming data, `model` updates the model, and `traceback` collects the traceback. The package `HiddenMarkovModelReaders` harbors two built-in distance functions `euclDist` and `bhattDist` for the Euclidean and Bhattacharyya distances, respectively. Additionally, user-provided distance functions can be easily integrated by declaration prior to the parameters definition, or during initialization of `HMMParams` struct as a _lambda_ or anonymous function.

The package `HiddenMarkovModelReaders` API provides two main functions: `setup` and `process!` for a simple workflow. The `setup` function initializes the empty instance of the `HMM` structure with the data proper dimensions. Adhering to Julia's convention, the `process!` is a mutating function that is used to update the model in an iterative manner. Processing is done as follows:

- Reset the traceback of the `HMM` struct.
- Feed, via dynamic programming, new data into the model by calculating the distance between the incoming data and the model.
- Set the minimum traceback and calculating the state.
- Update the model by adding incoming data and calculating distance defined by the `distance` setting.
- Sort the states of the `HMM` by overall amplitude of its feature vectors.

# Example

```julia
# declare parameters and use lambda distance function
# default values could also be used instead
hmmParams = HMMParams(
  penalty                    = 200,
  minimumFrequency           = 20,
  verbosity                  = false,
  distance                   = x, y -> (x .- y) .^ 2
)

# declare random two-dimensional array
x = rand(10, 5)

# setup Hidden Markov model object
hmm = setup(x)

# create a dictionary to hold results
resultsDc = Dict()

# procces Hidden Markov model with state splitting option
resultsDc[1] = process!(hmm, x, true, params = hmmParams)

# procces Hidden Markov model without state splitting option
resultsDc[2] = process!(hmm, x, false, params = hmmParams)
```


# Software Repository

The software is available as source code from https://github.com/DanielRivasMD/HiddenMarkovModelReaders.jl under the MIT license.

# Acknowledgements

The authors acknowledge the helpful comments and continuous support from Jan Komorowski.

# References
