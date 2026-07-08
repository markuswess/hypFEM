# Hyperboloidal compactifications in NGSolve

by **A. Zenginoglu**,
*Institute for Physical Science and Technology, University of Maryland*

and **M. Wess**,
*Institute of Analysis and Scientific Computing, TU Wien* 

---


This book is designed to provide an introduction and examples to the implementation of the hyperboloidal compactification technique in the high-order finite element library [NGSolve](https://ngsolve.org).


```{card}
**Introduction**
^^^^
Hyperboloidal compactification provides a framework for the numerical treatment of wave propagation problems on unbounded domains. By introducing hyperboloidal time slices together with a compactification of the spatial coordinates, future null infinity is mapped to a finite computational boundary while preserving the causal structure of outgoing waves. As a result, radiation can leave the computational domain without artificial reflections, eliminating the need for absorbing boundary conditions or perfectly matched layers.

The method admits both time-domain and frequency-domain formulations. In the time domain, hyperboloidal compactification transforms hyperbolic evolution equations into equivalent systems posed on a finite spatial domain, allowing long-time stable simulations that accurately capture outgoing radiation. In the frequency domain, the same geometric transformation yields a compactified formulation of the equations, in which the respective radiation condition is incorporated into the transformed differential operator. This provides a unified approach to the numerical solution of scattering and radiation problems, enabling high-order discretizations on bounded computational domains while maintaining the correct asymptotic behavior at infinity.
```



```{note}
For a full mathematical exposition to the method we refer to the pre print {cite}`wesszenginoglu2026`.
```


---

## Table of Contents
```{tableofcontents}
```


---

## References
```{bibliography}
:filter: docname in docnames
```
