title: 'HiddenMarkovModelReaders: A Julia implementation of a Hidden Markov Model and unsupervised hypothesis generation for signal processing'
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
- name: Deparment of Medical Biochemistry and Microbiology, Uppsala University
  index: 1
  date: 07 June 2021
  bibliography: paper.bib

---

# Summary

The amount of data generated everyday grows exponentially as technological innovations and further methods for connectivity arise. However, processing and classifying such stream of information in a human expert-dependent manner, that is supervised, is costly and time consuming. Thus, unsupervised methods to automate data and signal processing offer a promising alternatives for efficiency and scalability.

`HiddenMarkovModelReaders` offers an alternative to address this problem with a Julia implementation of a Hidden Markov model combined with a Hypothesis Generator. While its initial intent was to find repeteated patterns in the one-dimensional time-domain applicable to biomedical or general purpose signals, such as electroencephalograms, electrocardiograms, audio, or internet traffic data, the method is also applicable for discrete time series, and potentially multi-dimensional data streams, such as videos or surveillance. `HiddenMarkovModelReaders` provides a convinient API to create a hidden Markov model, manipulate model parameters, update its states and collect the traceback.

# Statement of need

Hidden Markov Models (HMMs) were invented in the 1960's for solving the problem of back-tracing the inner mechanisms of processes that could not be observed directly [@RN3]. In combination with Gaussian Mixture Models [@RN4], HMMs later became the backbone of signal processing tasks such as automated speech recognition. While HMMs have mostly been used for solving problems in which supervised or semi-supervised training was possible, there were also algorithms that combined HMMs with neural networks to learn in a completely unsupervised manner, e.g. Saguaro [@RN2].

We selected Julia as the language for implementation due to Julia's just-in-time (JIT) LLVM compiler and efficient artificial intelligence libraries, e.g., Flux [@RN1], as well as due to Julia's user friendliness. `HiddenMarkovModelReaders` framework is for easy-to-use, yet efficient experimentation, with a functional aspect and multiple dispatch capabilities inhereted from the language. Thus, `HiddenMarkovModelReaders` can be easily incorporated into any data processing pipelines or used as a stand-alone application.

Julia's general user friendliness makes this software available to people a wide range of programming expertise. At the same time, the JIT LLVM compiler ensures that applications scale gracefully with larger amounts of data. Given efficient libraries of machine learning and artificial intelligence algorithms in Julia, `HiddenMarkovModelReaders` is yet another contribution to the growing set of automation algorithms and implementations.

# Description

`HiddenMarkovModelReaders` offers APIs to declare the basic settings: the `HMMParams` struct, where the tranistion `penalty` for the model, the `distance` function to use, and the `verbosity` level can be defined. Also, it allows for creating and manipulating the Hidden Markov model `HMM`, where `data` carries the data, `model` collects the model,  and `traceback` receives the traceback. `HiddenMarkovModelReaders` provides two built-in distance functions `euclDist` and `bhattDist` for the Euclidean and Bhattacharyya distances, respectively. Additional user-provided distance functions are easily integrated by declaration prior to the parameters are defined or during initialization of `HMMParams` struct as a lambda or anonymous function.

`HiddenMarkovModelReaders` API offers two main functions: `setup` and `process!` for a straght-forward workflow. The `setup` function initializes an empty instance of the `HMM` structure, while `process!` is a mutating function that is used in an iterative manner. Processing is done in the following manner:

- First, reseting the traceback of the `HMM` struct.
- Feeding, via dynamic programming, new data into the model by calculating the distance beetwen the incoming data and the model.
- Next, seeting the minimum traceback and calculating the state.
- Updating the model by adding incoming data and calculating distance defined by the `distance` setting.
- Finally, sorting the states of the `HMM` by overall amplitude of its feature vectors.

# Software Repository

The software is available as source code from https://github.com/DanielRivasMD/HiddenMarkovModelReaders/ under the MIT license.

# Acknowledgements

<!-- TODO: acknowledge not author contributors -->

# References
