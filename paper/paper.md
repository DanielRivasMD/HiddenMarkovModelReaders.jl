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

HiddenMarkovModelReaders, a Julia implementation of a Hidden Markov model combined with a Hypothesis Generator. While its initial intent was to find repeteated patterns in the one-dimensional time-domain applicable to biomedical or general purpose signals, such as EEGs, EKGs, audio, or Internet traffic data, the method is also applicable for discrete time series, and potentially multi-dimensional data streams, such as videos or surveillance. HiddenMarkovModelReaders provides a convinient API to create a hidden Markov model and update its states as well as collect the tracebacks as well as use it as a stand-alone application or coupled with other Julia utilities, e.g., Flux.

# Statement of need

We selected Julia as the language for implementation, both due to Julia's just-in-time (JIT) LLVM compiler (REF) and efficient artificial intelligence libraries, e.g., Flux [@RN1], as well as due to Julia's user friendliness. As such, HiddenMarkovModelReaders can be easily incorporated into any data processing pipelines.

Hidden Markov Models (HMMs) were invented in the 1960's for solving the problem of back-tracing the inner mechanisms of processes that could not be observed directly [@RN3]. In combination with Gaussian Mixture Models [@RN4], HMMs later became the backbone of signal processing tasks such as automated speech recognition. While HMMs have mostly been used for solving problems in which supervised or semi-supervised training was possible, there were also algorithms that combined HMMs with neural networks to learn in a completely unsupervised manner, e.g. Saguaro [@RN2].

Here, we present a framework written in Julia for easy-to-use, yet efficient experimentation. Julia's general user friendliness makes this software available to people a wide range of programming expertise. At the same time, the JIT LLVM compiler ensures that applications scale gracefully with larger amounts of data. Given efficient libraries of machine learning and artificial intelligence algorithms in Julia, HiddenMarkovModelReaders is yet another contribution to the growing set of automation algorithms and implementations.

# Software Repository

The software is available as source code from https://github.com/DanielRivasMD/HiddenMarkovModelReaders/ under the MIT license.

# Acknowledgements

<!-- TODO: acknowledge not author contributors -->

# References
