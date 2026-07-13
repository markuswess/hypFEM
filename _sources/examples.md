(examples)=
# Examples

We start with three implementations of sound-soft circle scattering: the characteristic scaling, Poincaré disk, and the hyperboloidal layer. The characteristic circle is the compactified analogue of the standard far-field scaling used by conjugated infinite elements. The Poincaré circle solves the Helmholtz equation in the hyperbolic geometry. The layer example shows how to preserve standard representation near the obstacle and transform only the exterior.

(circle-benchmark)=
## Common Circle Benchmark

The three circle notebooks change the compactification but keep the physical problem fixed. The obstacle is the unit disk, $k=6$, and the incident direction is $a=(1,0)$. Following the notation of {ref}`exterior-scattering`, $U^{\rm inc}=e^{ikx}$ is the incident field, $U$ is the outgoing scattered field, $U^{\rm tot}=U^{\rm inc}+U$ is the total field, and $U_\infty$ is the far-field pattern. Lowercase $u$ is reserved for a transformed finite-element unknown; the characteristic normalization is distinguished as $u_{\rm char}$.

The notebooks use as reference the truncated Fourier--Bessel solution,

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
| characteristic disk | $U=(\Omega/\rho)^{1/2}e^{ikr}u_{\rm char}$ | $u_{\rm char}=-r^{1/2}e^{-ikr}U^{\rm inc}$ | $U_{\infty,h}=\left.u_{\rm char}\right\rvert_{\rho=1}$ |
| Poincaré disk | $U=\Omega^{1/2}e^{ikh}u$ | $u=-\Omega^{-1/2}e^{-ikh}U^{\rm inc}$ | $U_{\infty,h}=\left.u\right\rvert_{\rho=1}$ |
| hyperboloidal layer | $U=\Omega^{1/2}e^{ikh}u$ in the layer and $u=U$ inside | $u=-U^{\rm inc}$ | $U_{\infty,h}=\sqrt{R_{\rm out}}e^{-ikR_{\rm out}}\left.u\right\rvert_{\rho=R_{\rm out}}$ |

The two global disk constructions transform the obstacle data because compactification reaches the obstacle. The layer leaves both the coordinates and the scattered field unchanged there. In every case the compactified outer boundary is part of the transformed problem without extra absorbing conditions.

All three notebooks use polynomial degree $p=8$ and approximately 8,000 degrees of freedom. The table below summarizes the results.

| compactification | degrees of freedom | relative far-field $L^2$ error | setup and solve |
| --- | ---: | ---: | ---: |
| characteristic | 8,300 | $4.055\times10^{-8}$ | 0.214 s |
| Poincaré | 8,128 | $5.615\times10^{-8}$ | 0.250 s |
| hyperboloidal layer | 8,712 | $3.176\times10^{-8}$ | 0.236 s |

The timings are machine-dependent and exclude Python imports and kernel startup. They show that the finite-element work itself is inexpensive at this scale. In the layer notebook, evaluating the explicit Fourier--Bessel near-field reference takes much longer than solving the Helmholtz problem. The three notebooks produce visually indistinguishable results, and the far-field errors are all below $10^{-7}$.

## Time-domain and DG examples

The trapping-square notebooks use an open-cavity geometry to show radiation leaving through the compactified layer with trapped energy in the cavity. The frequency-domain notebook centers the cavity, whereas the two time-domain notebooks use a shifted cavity and mesh construction. The DG implementation imposes the sound-soft wall weakly and distinguishes the full conformal spatial flux from the skew skeleton coupling required by the mixed time-space derivative.

```{contents}
:local:
```


```{tableofcontents}
```
