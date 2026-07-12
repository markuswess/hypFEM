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
