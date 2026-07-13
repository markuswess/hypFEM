# Hyperboloidal Compactification in NGSolve

by **M. Wess**,
*Institute of Analysis and Scientific Computing, TU Wien*

and **A. Zenginoğlu**,
*Institute for Physical Science and Technology, University of Maryland*

---


This book provides an introduction to the implementation of hyperboloidal compactification in the high-order finite-element library [NGSolve](https://ngsolve.org), together with executable examples.


```{card}
**Introduction**
^^^^
Hyperboloidal compactification provides a framework for the numerical treatment of wave propagation problems on unbounded domains. By introducing hyperboloidal time slices together with a compactification of the spatial coordinates, future null infinity is mapped to a finite computational boundary while preserving the causal structure of outgoing waves. As a result, radiation can leave the computational domain without artificial reflections, eliminating the need for absorbing boundary conditions or perfectly matched layers.

The method admits both time-domain and frequency-domain formulations. In the time domain, hyperboloidal compactification transforms hyperbolic evolution equations into systems posed on a finite spatial domain and supports long-time simulations that directly capture outgoing radiation. In the frequency domain, the same geometric transformation yields a compactified formulation of the equations, in which the radiation condition is selected by the transformed finite-energy space. This provides a unified approach to the numerical solution of scattering and radiation problems, enabling high-order discretizations on bounded computational domains while maintaining the correct asymptotic behavior at infinity.
```



```{note}
This book is an executable introduction and implementation for readers who already know the finite-element treatment of Helmholtz or wave equations. For the complete derivation, analysis, comparisons with PML, and broader numerical study of the hyperboloidal Helmholtz equation, see the [Wess--Zenginoğlu preprint](https://arxiv.org/abs/2606.25130).

The book also includes time-domain examples, which are part of ongoing research and will be updated in the future.
```


---

## Table of contents
```{tableofcontents}
```


---

## Reference

M. Wess and A. Zenginoğlu, [*Finite Elements for Helmholtz Scattering with Infinity as a Computational Boundary*](https://arxiv.org/abs/2606.25130), arXiv:2606.25130 (2026).
