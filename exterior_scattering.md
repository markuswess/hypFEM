(exterior-scattering)=
# Exterior Scattering Problem

The examples in this book start from the standard exterior Helmholtz scattering problem. Let
$\mathcal O\subset\mathbb R^d$, $d=2,3$, be a bounded scatterer with boundary
$\Gamma=\partial\mathcal O$, and let

$$
D = \mathbb R^d\setminus \overline{\mathcal O}.
$$

For a sound-soft obstacle, the total field is written as

$$
U^{\rm tot}=U^{\rm inc}+U,
$$

where $U^{\rm inc}$ is a prescribed incident wave and $U$ is the scattered field. In the simplest constant-index case,

$$
(\Delta+k^2)U=0 \qquad \text{in }D,
$$

with the boundary condition

$$
U=-U^{\rm inc}\qquad \text{on }\Gamma.
$$

For a plane wave incident from direction $a\in\mathbb S^{d-1}$,

$$
U^{\rm inc}(x)=e^{ik a\cdot x}.
$$

The missing condition is imposed at infinity. The scattered field must be outgoing, which is expressed by the Sommerfeld radiation condition

$$
\lim_{r\to\infty}
r^{\frac{d-1}{2}}
\left(\partial_r U - ikU\right)=0,
\qquad r=|x|.
$$

Equivalently, an outgoing scattered field has the asymptotic expansion

$$
U(r,\omega)
=r^{-\frac{d-1}{2}}e^{ikr}U_\infty(\omega)
+\mathcal O\left(r^{-\frac{d+1}{2}}\right),
\qquad \omega=\frac{x}{|x|}.
$$

The function $U_\infty$ is the far-field pattern. In conventional finite-element calculations the domain is truncated at a finite radius and one adds an approximate absorbing boundary condition, a Dirichlet-to-Neumann map, or a perfectly matched layer. The compactified approach used here has a different goal:

$$
\text{make the far field itself a finite-element boundary trace.}
$$

The numerical solution should therefore give both the near field around $\mathcal O$ and $U_\infty$ at the outer mesh boundary.

For orientation, the main exterior-domain strategies differ in where they place infinity and how they select the outgoing solution:

| method | computational exterior | outgoing condition | access to $U_\infty$ |
| --- | --- | --- | --- |
| absorbing boundary condition | truncated at a finite boundary | local approximation on that boundary | postprocessing from finite-radius data |
| perfectly matched layer | truncated after a complex absorbing layer | decay through coordinate stretching plus an outer termination | postprocessing from the unchanged physical region |
| Dirichlet-to-Neumann map | truncated at a compatible finite boundary | exact or truncated nonlocal boundary operator | available from the boundary expansion |
| infinite elements | unbounded elements attached to a finite interface | outgoing asymptotics built into the exterior approximation space | available from exterior expansion coefficients |
| hyperboloidal compactification | infinity is a finite mesh boundary | incoming fields are excluded by regularity of the transformed unknown | boundary trace of the transformed solution |

This table describes structural differences, not a universal ranking. Accuracy and cost depend on frequency, geometry, discretization, solver, and on how each exterior treatment is tuned. The characteristic construction below is particularly close to conjugated infinite elements; the layer construction turns the same asymptotic normalization into a local finite-domain formulation that is unchanged near the scatterer.
