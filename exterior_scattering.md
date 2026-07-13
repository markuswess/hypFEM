(exterior-scattering)=
# Exterior Scattering Problem

We consider the standard exterior Helmholtz scattering problem. Let
$\mathcal O\subset\mathbb R^d$, $d=2,3$, be a bounded scatterer with boundary
$\Gamma=\partial\mathcal O$, and let $D = \mathbb R^d\setminus \overline{\mathcal O}$. For a sound-soft obstacle, we write the total field as $U^{\rm tot}=U^{\rm inc}+U$, where $U^{\rm inc}$ is a prescribed incident wave and $U$ is the scattered field. In the simplest constant-index case,

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

The scattering problem requires a boundary condition at infinity. The scattered field must be outgoing, which is expressed by the Sommerfeld radiation condition

$$
\lim_{r\to\infty}
r^{\frac{d-1}{2}}
\left(\partial_r U - ikU\right)=0,
\qquad r=|x|.
$$

An outgoing scattered field has the asymptotic expansion

$$
U(r,\omega)
=r^{-\frac{d-1}{2}}e^{ikr}U_\infty(\omega)
+\mathcal O\left(r^{-\frac{d+1}{2}}\right),
\qquad \omega=\frac{x}{|x|}.
$$

The function $U_\infty$ is the far-field pattern. In conventional finite-element calculations, one solves for the scattered field $U(r,\omega)$, and the domain is truncated at a finite radius. The artificially introduced boundary requires an approximate absorbing boundary condition, a Dirichlet-to-Neumann map, or a perfectly matched layer.

Our approach is to **directly solve the unbounded problem** for a suitably extended far-field variable by compactifying the exterior domain to a finite computational domain. The numerical solution gives both the near field around $\mathcal O$ and $U_\infty$ at the outer mesh boundary.

To put our approach in context, the main exterior-domain strategies differ in where they place the boundary and how they select the outgoing solution:

| method | computational exterior | outgoing condition | access to $U_\infty$ |
| --- | --- | --- | --- |
| absorbing boundary condition | truncated at a finite boundary | local approximation on that boundary | postprocessing from finite-radius data |
| perfectly matched layer | truncated after a complex absorbing layer | decay through coordinate stretching plus an outer termination | postprocessing from the interior physical region |
| Dirichlet-to-Neumann map | truncated at a finite boundary | exact or truncated nonlocal boundary operator | available from the boundary expansion |
| infinite elements | unbounded elements attached to a finite interface | outgoing asymptotics built into the exterior approximation space | available from exterior expansion coefficients |
| hyperboloidal compactification | infinity is a finite mesh boundary | incoming fields are excluded by regularity of the transformed unknown | boundary trace of the transformed solution |
