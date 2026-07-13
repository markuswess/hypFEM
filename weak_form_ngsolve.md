(weak-form-ngsolve)=
# Weak Form Used in NGSolve

The finite-element implementation assembles the transformed Helmholtz equation directly on the compactified domain. This page gives the definitions, regularity conditions, and global weak form used in the notebooks. The derivation is given in our [preprint](https://arxiv.org/abs/2606.25130).

The radial map and field rescaling are

$$
r=\frac{\rho}{\Omega(\rho)},
\qquad
U=\Omega^{(d-1)/2}e^{ikh}u.
$$

Define

$$
L=\Omega-\rho\Omega' >0,
\qquad
G=\frac{d\rho}{dr}=\frac{\Omega^2}{L},
\qquad
H=\frac{dh}{dr},
\qquad
M=\frac{1-H^2}{G}.
$$

For the constant-index exterior problem, regularity at the compactified boundary $\rho=S$ requires

$$
H(S)=1,
\qquad
M=\frac{1-H^2}{G}\in L^\infty.
$$

We also assume that the compactification center lies inside the excluded obstacle so $1/\rho$ is bounded on the computational domain.

In two space dimensions set

$$
X=(x,y),
\qquad
\rho=|X|,
\qquad
Q=\frac{XX^T}{\rho^2},
\qquad
P=I-Q.
$$

The compactified spatial coefficient is $GQ+LP$: radial derivatives degenerate with $G\to0$; the angular coefficient $L$ remains bounded. The notebooks use the following choices:

| example | compactification | phase derivative |
| --- | --- | --- |
| hyperboloidal layer | $\Omega=1$ in the interior, linear in the layer | $H=1-G$ in the layer |
| Poincaré disk | $\Omega=(1-\rho^2)/2$ | $H=2\rho/(1+\rho^2)$ |
| characteristic disk | $\Omega=1-\rho$ | $H=1$ |

The characteristic notebook additionally uses the bounded normalization $u_{\rm char}=\rho^{(d-1)/2}u$. This gives the familiar scaling with $r^{(d-1)/2}$ for the far-field amplitude.

Let $u$ be the transformed scattered field and $v$ a test function. For Dirichlet data $g$ on the obstacle, the trial and test spaces are

$$
\mathcal V_g=\{u\in H^1(\mathcal D):u|_{\partial\mathcal O}=g\},
\qquad
\mathcal V_0=\{v\in H^1(\mathcal D):v|_{\partial\mathcal O}=0\}.
$$

The bilinear form is assembled as

$$
a(u,v)
=k^2 m(u,v)+ik\,c(u,v)+s(u,v).
$$

The zero-order or mass form is

$$
m(u,v)=\int_{\mathcal D}M\,u\overline v\,dx.
$$

The transport/outflow form is

$$
\begin{aligned}
c(u,v)= -\int_{\mathcal D}
\frac{H}{\rho}u\,X\cdot\nabla\overline v\,dx
+\int_{\mathcal D}
\frac{H}{\rho}\overline v\,X\cdot\nabla u\,dx +\int_{\mathscr I^+}u\overline v\,ds .
\end{aligned}
$$

The stiffness form is

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
\right]dx -\int_{\mathcal D}
\frac{(\Omega')^2}{4L}u\overline v\,dx .
\end{aligned}
$$

Here $\mathscr I^+$ denotes the compactified outer boundary, more precisely the cut of future null infinity reached by the hyperboloidal slice. No essential or artificial absorbing condition is imposed there. The boundary term in $c(u,v)$ is produced by the phase transformation, and the trace of $u$ on $\mathscr I^+$ is the far-field data up to a known normalization.

The outgoing condition is encoded in the choice of space. For a standard compactification, an incoming branch has compactified radial derivatives of order $1/G$ and is not in $H^1(\mathcal D)$, whereas the transformed outgoing branch has a regular trace.

The three groups in the form have distinct numerical roles:

| form | source in the transformation | numerical role |
| --- | --- | --- |
| $k^2m$ | residual phase speed $(1-H^2)/G$ | bounded Helmholtz mass form |
| $ikc$ | time/phase shift $h$ | nonsymmetric radial transport and the outflow trace at $\mathscr I^+$ |
| $s$ | compactified spatial metric and conformal weight | anisotropic stiffness and lower-order rescaling terms |

This grouping should be preserved in the implementation. It also fixes the time-domain signs: with the convention $e^{-ikt}$, the pencil $k^2M+ikC+K_{\rm Helmholtz}$ corresponds to $M\ddot q+C\dot q-K_{\rm Helmholtz}q=f$.

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
