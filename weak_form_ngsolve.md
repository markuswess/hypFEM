(weak-form-ngsolve)=
# Weak Form Used in NGSolve

The finite-element implementation assembles the transformed Helmholtz equation directly on the compactified domain. This page records the global weak form for the book's main rescaling,

$$
U=\Omega^{(d-1)/2}e^{ikh}u.
$$

Assume that the compactification center lies inside the excluded obstacle, $L>0$ on the layer, $H$ extends to the outer boundary $\rho=S$, and

$$
H(S)=1,
\qquad
\frac{1-H^2}{G}\in L^\infty.
$$

The first assumption keeps $1/\rho$ bounded on the computational domain, while the last two make the transformed coefficients regular at infinity.

Let $u$ be the transformed scattered field and $v$ a test function. For Dirichlet data $g$ on the obstacle, the trial and test spaces are

$$
\mathcal V_g=\{u\in H^1(\mathcal D):u|_{\partial\mathcal O}=g\},
\qquad
\mathcal V_0=\{v\in H^1(\mathcal D):v|_{\partial\mathcal O}=0\}.
$$

In two space dimensions set

$$
X=(x,y),\qquad
\rho=|X|,\qquad
Q=\frac{XX^T}{\rho^2},\qquad
P=I-Q.
$$

The compactification coefficients are

$$
L=\Omega-\rho\Omega',
\qquad
G=\frac{\Omega^2}{L},
\qquad
M=\frac{1-H^2}{G}.
$$

The bilinear form is assembled as

$$
a(u,v)
=k^2 m(u,v)+ik\,c(u,v)+s(u,v).
$$

The mass term is

$$
m(u,v)=\int_{\mathcal D}M\,u\overline v\,dx.
$$

The transport term is

$$
\begin{aligned}
c(u,v)={}&
-\int_{\mathcal D}
\frac{H}{\rho}u\,X\cdot\nabla\overline v\,dx
+\int_{\mathcal D}
\frac{H}{\rho}\overline v\,X\cdot\nabla u\,dx \\
&+\int_{\Gamma_\infty}u\overline v\,ds .
\end{aligned}
$$

The stiffness and conformal-rescaling terms are

$$
\begin{aligned}
s(u,v)={}&
-\int_{\mathcal D}
\nabla u\cdot (GQ+LP)\nabla\overline v\,dx \\
&-\int_{\mathcal D}
\frac{\Omega\Omega'}{2L\rho}
\left[
(X\cdot\nabla u)\overline v
+(X\cdot\nabla\overline v)u
\right]dx \\
&-\int_{\mathcal D}
\frac{(\Omega')^2}{4L}u\overline v\,dx .
\end{aligned}
$$

Here $\Gamma_\infty$ is the compactified outer boundary. No essential or artificial absorbing condition is imposed there. The boundary term in $c(u,v)$ is produced by the phase transformation, and the trace of $u$ on $\Gamma_\infty$ is the far-field data up to the known normalization.

The outgoing condition is also encoded in the choice of space. An incoming factor produces compactified radial derivatives of order $1/G$ and is not in $H^1(\mathcal D)$ for a standard simple-zero compactification. The $H^1$ trial space therefore excludes the incoming branch. This establishes consistency and boundedness of the displayed form; it should not be confused with a general coercivity or well-posedness theorem for every geometry and wavenumber.

In NGSolve notation this appears as:

```python
radial = CF((x, y))
Pi = OuterProduct(radial, radial) / rho**2
Pi_perp = Id(2) - Pi

mass = M * u * v * dx(...)

transport = (
    -H / rho * u * InnerProduct(radial, grad(v)) * dx(...)
    + H / rho * v * InnerProduct(radial, grad(u)) * dx(...)
    + u * v * ds("scri")
)

stiffness = (
    -grad(u) * ((G * Pi + L * Pi_perp) * grad(v)) * dx(...)
    - Omega / L / (2 * rho) * DOmega
      * InnerProduct(grad(u), radial) * v * dx(...)
    - Omega / L / (2 * rho) * DOmega
      * InnerProduct(grad(v), radial) * u * dx(...)
    - 1 / L / 4 * DOmega**2 * u * v * dx(...)
)

A = BilinearForm(k**2 * mass + 1j * k * transport + stiffness).Assemble().mat
```

Some notebooks call the outer boundary `"outer"` rather than `"scri"`. The role is the same: it is the finite mesh boundary representing infinity.

## Boundary Data

For a sound-soft obstacle, the physical scattered field satisfies

$$
U=-U^{\rm inc}\qquad \text{on }\Gamma.
$$

If the compactification and phase transform are the identity near the obstacle, this is imposed exactly as in a standard Helmholtz FEM code:

```python
boundary_data = -exp(1j * k * direction_dot_x)
gfu.Set(boundary_data, definedon=mesh.Boundaries("scatterer"))
```

If the compactification reaches the obstacle, the boundary data must be transformed with the same rule as the unknown:

$$
u=-\Omega^{-1/2}e^{-ikh}U^{\rm inc}
\qquad (d=2).
$$

This is the formula used by the Poincaré example. The characteristic example locally introduces $u_{\rm char}=\rho^{1/2}u$ and therefore imposes

$$
u_{\rm char}=-r^{1/2}e^{-ikh}U^{\rm inc}
\qquad (d=2).
$$

The layer example is the identity near the obstacle and can impose the usual scattered-field data there.
