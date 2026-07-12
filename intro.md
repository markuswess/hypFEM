# Hyperboloidal compactification in NGSolve

by **M. Wess**,
*Institute of Analysis and Scientific Computing, TU Wien* 

and **A. Zenginoglu**,
*Institute for Physical Science and Technology, University of Maryland*

---


This book is designed to provide an introduction and examples to the implementation of the hyperboloidal compactification technique in the high-order finite element library [NGSolve](https://ngsolve.org).


```{card}
**Introduction**
^^^^
Hyperboloidal compactification provides a framework for the numerical treatment of wave propagation problems on unbounded domains. By introducing hyperboloidal time slices together with a compactification of the spatial coordinates, future null infinity is mapped to a finite computational boundary while preserving the causal structure of outgoing waves. At the continuous level this avoids an artificial truncation boundary and its associated reflection model; a discretization still has the usual finite-element, geometry, interface, and quadrature errors. No absorbing boundary condition or perfectly matched layer is required.

The method admits both time-domain and frequency-domain formulations. In the time domain, hyperboloidal compactification transforms hyperbolic evolution equations into systems posed on a finite spatial domain on which outgoing radiation can be evolved through the compactified boundary. In the frequency domain, the same geometric transformation yields a compactified formulation in which the radiation condition is selected by the transformed finite-energy space. This provides a unified route to high-order discretizations on bounded computational domains while maintaining the correct outgoing asymptotics.
```



```{note}
This book is an executable introduction and implementation companion for readers who already know the finite-element treatment of Helmholtz or wave equations. It records the transformations, assumptions, weak forms, and NGSolve implementation choices needed to reproduce the examples. For the complete derivation, analysis, comparisons with related exterior-domain methods, and broader numerical study, see the preprint {cite}`wesszenginoglu2026`.

The implementation developed here focuses on a homogeneous radiative end and should not be read as a universal treatment of unbounded domains. Homogeneity is not fundamental—adapted conformal constructions can also treat structured long-range media—but waveguides, periodic structures, and other modal ends require substantially different ideas. The {doc}`limitations` chapter separates restrictions of the present implementation from structural open problems.
```


---

## Table of Contents
```{tableofcontents}
```


---

## References
```{bibliography}
:all:
```
