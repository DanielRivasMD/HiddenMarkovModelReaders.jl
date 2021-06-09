title: 'Hidden Readers: A Julia implementation of a Hidden Markov Model for signal processing'
tags:
  - Julia
  - signal processing
  - machine learning
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

Data and signal processing is a demanding task that calls for novel and efficient methodology. 

Unsupervised hypothesis generation and learning from data directly offers a tremendous value due to its scalability nature. Furthermore, unlike for supervised learning, no labeled data is required.



# Statement of need

HiddenReaders is a Julia implementation of a Hidden Markov model combined with a Hypothesis Generator. While its initial purpose was to find repeteated patterns in the one-dimensional time-domain, such as EEGs, EKGs, audio, or Internet traffic data, the method is also applicable for discrete time series, and potentially multi-dimensional data streams, such as videos or surveillance. Hidden Reader's implementation provides a convinient API to create a hidden Markov model and update its state as well as collect the traceback.

Using Parameters, the user can control all of the parameters of the model in a user friendly way.

We selected Julia as the language for implementation, both due to Julia's just-in-time (JIT) LLVM compiler (REF) and efficinet artificial intelligence implementation, e.g., Flux [@Innes:2018], as well as due to Julia's user friendliness. As such, HiddenReaders can be easily incorporated into any data processing pipelines. 


# Introduction
Hidden Markov Models[1] were invented in the 1960's for solving the problem of back-tracing the inner mechanisms of processes that could not be observed directly.  


# Citations
1. Baum, L. E.; Petrie, T. (1966). "Statistical Inference for Probabilistic Functions of Finite State Markov Chains". The Annals of Mathematical Statistics. 37 (6): 1554–1563. 

# Acknowledgements


# References

