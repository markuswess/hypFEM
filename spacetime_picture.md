(spacetime-picture)=
# Spacetime Origin of the Transformation

The previous pages introduced the method in familiar frequency-domain terms: extract the standard outgoing far-field scaling and compactify the remaining amplitude. The characteristic construction is closely related to conjugated infinite elements. Its spacetime interpretation explains how to generalize that exact scaling into a layer that is the identity near the scatterer.

Start from the wave equation on Minkowski spacetime. In polar coordinates,

$$
ds^2_{\mathbb M}=-dt^2+dr^2+r^2d\omega^2,
$$

where $d\omega^2$ is the metric on the unit sphere, or on the unit circle in two space dimensions. A time-harmonic field

$$
\phi(t,r,\omega)=e^{-ikt}U(r,\omega)
$$

solves the wave equation exactly when $U$ solves the Helmholtz equation

$$
(\Delta+k^2)U=0.
$$

Thus every frequency-domain solution is the spatial part of a time-periodic wave.

## Time Transformation

Introduce a new time coordinate

$$
\tau=t-h(r),
\qquad
t=\tau+h(r),
$$

where $h$ is called the height function. Its radial derivative is

$$
H(r)=\frac{dh}{dr}.
$$

On a surface $\tau=\mathrm{constant}$, the induced radial metric coefficient is

$$
1-H^2.
$$

Therefore $H<1$ gives spacelike hyperboloidal slices, while $H\to1$ means that the slices become asymptotically null. This is the geometric reason the coefficient

$$
\frac{1-H^2}{G}
$$

appears in the transformed Helmholtz operator. Regularity requires $1-H^2=\mathcal O(G)$ as the compactification coefficient $G=d\rho/dr$ goes to zero; the characteristic choice $H=1$ is included as a limiting case.

The link to the frequency-domain transformation is direct. Since $t=\tau+h(r)$,

$$
e^{-ikt}U
=e^{-ik\tau}\left(e^{-ikh(r)}U\right).
$$

After also removing the radiative decay, the compactified Helmholtz unknown is

$$
u(\rho,\omega)
=\Omega(\rho)^{-m}e^{-ikh(r(\rho))}U(r(\rho),\omega),
\qquad
m=\frac{d-1}{2}.
$$

Equivalently,

$$
U(r(\rho),\omega)
=\Omega(\rho)^m e^{ikh(r(\rho))}u(\rho,\omega).
$$

So the factor $e^{-ikh}$ in the Helmholtz implementation is the frequency-domain trace of the time transformation $\tau=t-h(r)$.

## Bondi, Penrose, and Friedrich

Outgoing radial light rays in Minkowski spacetime satisfy

$$
t-r=\mathrm{constant}.
$$

The coordinate

$$
u_B=t-r
$$

is retarded time. Bondi and collaborators used retarded-time coordinates to describe radiation from isolated systems {cite}`bondi1962gravitationalwaves`.

Penrose supplied the geometric picture underlying the present construction {cite}`penrose1963asymptoticproperties,Penrose1965ZeroRestMass`. One introduces an *unphysical* metric $g$ related to the physical metric $\widetilde g$ by

$$
g=\Omega^2\widetilde g.
$$

The conformal factor is positive in the physical spacetime and vanishes at its added boundary, with $d\Omega\ne0$ there. Physical infinity is therefore represented by an ordinary finite boundary of the conformally extended geometry. Future null infinity $\mathscr I^+$ is the component reached by outgoing null rays. The metric rescaling alone is not enough for a wave problem: the radiating field must also be rescaled with its appropriate conformal weight so that it has a regular, nonzero limit at $\mathscr I^+$. In the Helmholtz formulas this is the origin of the factor $\Omega^m$ and of the far field appearing as a boundary trace.

Friedrich turned this conformal viewpoint into a regular hyperbolic evolution framework for Einstein's equations {cite}`friedrich1983cauchy`. His conformal field equations and hyperboloidal initial-value problem demonstrated that suitably rescaled evolution variables can include null infinity in the computational domain without treating it as an artificial outer boundary. The scalar hyperboloidal method used here is far simpler, but it follows the same structural lesson: choose slices that reach $\mathscr I^+$, compactify them, and rescale the field and equations so their coefficients remain regular there.

The compactified Helmholtz method is the frequency-domain version of this picture. We do not place an artificial boundary at a large finite physical radius. Instead, we transform the field so that outgoing radiation has a regular limit at the conformal boundary. The far-field pattern is then a boundary trace at $\mathscr I^+$.

## Poincaré Disk Example

The {doc}`examples/frequency_domain_poincare_circle` uses the hyperboloid

$$
t^2-r^2=1,\qquad t>0.
$$

On this surface,

$$
t=h(r)=\sqrt{1+r^2},
\qquad
H=\frac{dh}{dr}=\frac{r}{\sqrt{1+r^2}}.
$$

The radial compactification is

$$
r=\frac{2\rho}{1-\rho^2},
\qquad
\Omega(\rho)=\frac{1-\rho^2}{2}.
$$

In compactified coordinates this gives

$$
H(\rho)=\frac{2\rho}{1+\rho^2},
\qquad
\frac{1-H^2}{G}=\frac{2}{1+\rho^2}.
$$

That last expression is the bounded `mu` coefficient used in the notebook. The Poincaré disk is therefore not just a spatial remapping of the exterior domain. It is the frequency-domain implementation of a hyperboloidal slice of Minkowski spacetime, compactified so that its asymptotic boundary is at $\rho=1$.

This example is pedagogically useful because the same disk also appears in hyperbolic geometry. The Euclidean boundary of the Poincaré disk is infinitely far away in the hyperbolic metric, while for waves it represents the finite location of null infinity after compactification.

## Characteristic Baseline

The {doc}`examples/frequency_domain_characteristic_circle` takes the limiting choice

$$
h(r)=r,
\qquad
H=1.
$$

Then

$$
\tau=t-r
$$

is exactly retarded time. The constant-$\tau$ surfaces are outgoing null characteristics rather than spacelike hyperboloids. In the frequency domain this choice is very clean:

$$
\frac{1-H^2}{G}=0.
$$

The large $k^2$ volume term is cancelled completely. For an outgoing field

$$
U(r,\theta)\sim r^{-1/2}e^{ikr}U_\infty(\theta),
$$

the transformed unknown

$$
u=\sqrt r\,e^{-ikr}U
$$

has the limit

$$
u\big|_{\rho=1}=U_\infty.
$$

The numerical unknown is therefore already the slowly varying outgoing radiation field transported along outgoing characteristics to future null infinity. In frequency-domain language this is the standard far-field scaling used by conjugated infinite elements; in spacetime language it follows outgoing radiation along retarded-time characteristics. The characteristic notebook implements this baseline before the layer examples generalize it. It gives a high-accuracy benchmark, although a controlled comparison of compactifications must use the same mesh, polynomial order, quadrature, and linear solver before attributing an error difference to the characteristic choice itself.

## From the Characteristic Baseline to Hyperboloidal Layers

The layer examples use the same idea in a form that is convenient for general obstacles. The exact choice $h=r$ is relaxed to a height function that vanishes in the interior and becomes asymptotically characteristic. The transformation is consequently the identity near the scatterer, so physical boundary data are imposed in the usual way. Only the exterior layer is compactified, with $H=dh/dr$ chosen so that $H\to1$ and $(1-H^2)/G$ remains bounded as $G\to0$.

The Poincaré and characteristic disk examples are global constructions for a centered circle, so the connections with hyperboloids, retarded time, infinite-element scaling, and null infinity are visible directly in the formulas. The layer construction retains their asymptotic behavior while providing the practical finite-element version for less symmetric geometries.
