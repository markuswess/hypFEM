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

All three notebooks use polynomial degree $p=8$ and approximately 8,000 degrees of freedom. One representative clean execution on the development machine gave:

| compactification | degrees of freedom | relative far-field $L^2$ error | mesh, assembly, solve | notebook after imports |
| --- | ---: | ---: | ---: | ---: |
| characteristic | 8,300 | $4.055\times10^{-8}$ | 0.220 s | 0.686 s |
| Poincaré | 8,128 | $5.615\times10^{-8}$ | 0.251 s | 0.744 s |
| exterior layer | 8,712 | $3.176\times10^{-8}$ | 0.262 s | 2.280 s |

At this computational budget all three errors are of the same order. The layer is slightly more accurate in this run, but also has about five percent more unknowns; differences this small should not be interpreted as a universal ordering. Its practical advantage is that the transformation is the identity near the obstacle and therefore applies without changing the physical formulation around a general scatterer. This is one resolved comparison point, not a convergence theorem; the individual notebooks expose `maxh` and `order` for $h$- and $p$-studies.

The timings are machine-dependent and exclude Python imports and kernel startup. They show that the finite-element work itself is inexpensive at this scale. In that layer run, evaluating the explicit Fourier--Bessel reference on the physical region took 1.398 seconds, about 5.3 times the numerical solve. The more expensive projection of that reference throughout the compactified layer and its second visualization are therefore disabled.

## Time-domain and DG examples

The trapping-square notebooks use the same physical geometry to show radiation leaving through the compactified layer while a component remains in the open cavity. The conforming notebook introduces the time-domain problem. Its DG companion then imposes the sound-soft wall weakly and makes the otherwise hidden face structure explicit. In particular, it distinguishes the full conformal spatial flux from the skew skeleton coupling required by the mixed time-space derivative. The DG example has 7,450 unknowns; on the reference run, assembly and factorization take about 1.3 seconds and 300 Newmark steps take about 9.7 seconds.

```{contents}
:local:
```


```{tableofcontents}
```
