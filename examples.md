(examples)=
# Examples

The examples proceed from the exact characteristic scaling to the generalized layer construction. The characteristic circle is the compactified analogue of the standard far-field scaling used by conjugated infinite elements. The Poincaré circle displays the hyperboloidal geometry globally. The layer examples then preserve ordinary physical coordinates near general obstacles and transform only the exterior.

(circle-benchmark)=
## Common Circle Benchmark

The three circle notebooks change the compactification while keeping the physical problem fixed. The obstacle is the unit disk, $k=6$, and the incident direction is $a=(1,0)$. Following the notation of {ref}`exterior-scattering`, $U^{\rm inc}=e^{ikx}$ is the incident field, $U$ is the outgoing scattered field, $U^{\rm tot}=U^{\rm inc}+U$ is the total field, and $U_\infty$ is the far-field pattern. Lowercase $u$ is reserved for a transformed finite-element unknown; the characteristic normalization is distinguished as $u_{\rm char}$.

The notebooks use the same truncated Fourier--Bessel reference,

$$
U_\infty^{(N)}(\theta)
=\sqrt{\frac{2}{\pi k}}e^{-i\pi/4}
\sum_{n=-N}^{N}
\left(-\frac{J_n(k)}{H_n^{(1)}(k)}\right)e^{in\theta},
\qquad N=35.
$$

What changes between notebooks is the transformed unknown and therefore the normalization that converts its outer trace into $U_{\infty,h}$.

| construction | transformed field | data on the obstacle | far-field extraction |
| --- | --- | --- | --- |
| characteristic disk | $U=(\Omega/\rho)^{1/2}e^{ikr}u_{\rm char}$ | $u_{\rm char}=-r^{1/2}e^{-ikr}U^{\rm inc}$ | $U_{\infty,h}=u_{\rm char}|_{\rho=1}$ |
| Poincaré disk | $U=\Omega^{1/2}e^{ikh}u$ | $u=-\Omega^{-1/2}e^{-ikh}U^{\rm inc}$ | $U_{\infty,h}=u|_{\rho=1}$ |
| exterior layer | $U=\Omega^{1/2}e^{ikh}u$ in the layer and $u=U$ inside | $u=-U^{\rm inc}$ | $U_{\infty,h}=\sqrt{R_{\rm out}}e^{-ikR_{\rm out}}u|_{\rho=R_{\rm out}}$ |

The two global disk constructions transform the obstacle data because compactification reaches the obstacle. The layer leaves both the coordinates and the scattered field unchanged there. In every case the compactified outer boundary is part of the transformed problem; no extra absorbing condition is imposed on it.

All three notebooks use polynomial degree $p=8$ and approximately 8,000 degrees of freedom. One representative clean execution on the development machine gave:

| compactification | degrees of freedom | relative far-field $L^2$ error | mesh, assembly, solve | notebook after imports |
| --- | ---: | ---: | ---: | ---: |
| characteristic | 8,300 | $4.055\times10^{-8}$ | 0.214 s | 0.874 s |
| Poincaré | 8,128 | $5.615\times10^{-8}$ | 0.250 s | 0.743 s |
| exterior layer | 8,712 | $3.176\times10^{-8}$ | 0.236 s | 2.309 s |

At this computational budget all three errors are of the same order. The layer is slightly more accurate in this run, but also has about five percent more unknowns; differences this small should not be interpreted as a universal ordering. Its practical advantage is that the transformation is the identity near the obstacle and therefore applies without changing the physical formulation around a general scatterer. This is one resolved comparison point, not a convergence theorem; the individual notebooks expose `maxh` and `order` for $h$- and $p$-studies.

For scattering resolution, the benchmark has nondimensional frequency $ka=6$, where $a=1$ is the obstacle radius. The three values of `maxh` live in different compactified coordinate systems and therefore cannot be compared as physical element diameters. A useful local indicator is $kh_{\rm phys}/p$ in the unchanged region or, for a global map, after multiplying the compactified mesh scale by $dr/d\rho$ near the obstacle. The notebooks report this nominal near-obstacle quantity alongside the DOF count. It is a resolution diagnostic, not an error estimator.

The timings are machine-dependent and exclude Python imports and kernel startup. They show that the finite-element work itself is inexpensive at this scale. In that layer run, evaluating the explicit Fourier--Bessel reference on the physical region took 1.355 seconds, about 5.7 times the numerical solve. The more expensive projection of that reference throughout the compactified layer and its second visualization are therefore disabled.

## Time-domain and DG examples

The trapping-square notebooks use the same open-cavity geometry class to show radiation leaving through the compactified layer while a component remains in the cavity. The frequency-domain notebook centers the cavity, whereas the two time-domain notebooks use the same shifted cavity and mesh construction. The conforming notebook introduces the time-domain problem. Its DG companion then imposes the sound-soft wall weakly and makes the otherwise hidden face structure explicit. In particular, it distinguishes the full conformal spatial flux from the skew skeleton coupling required by the mixed time-space derivative. The DG example uses a shorter drive and final time than the conforming demonstration to keep its cost modest; it is a structural companion, not a pointwise DG--CG comparison. It has 7,450 unknowns; on the reference run, assembly and factorization take about 1.3 seconds and 300 Newmark steps take about 9.7 seconds.

```{contents}
:local:
```


```{tableofcontents}
```
