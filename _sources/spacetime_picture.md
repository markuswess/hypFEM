(spacetime-picture)=
# Spacetime Picture

In the previous section, we introduced the method in the frequency domain: extract the standard asymptotic far-field scaling and compactify a suitable bulk extension. In various parts of the description, we mentioned time transformations. You may be wondering: there is no time in the Helmholtz equation, so why do you mention time transformations?

The underlying spacetime picture explains why the phase transformation, spatial compactification, and conformal rescaling fit together. It is also essential for the time-domain implementation, which is how this method was originally constructed and applied.

Consider the standard wave equation

$$
\partial_t^2\phi-\Delta\phi=0,
$$

A time-harmonic field

$$
\phi(t,r,\omega)=e^{-ikt}U(r,\omega)
$$

solves the wave equation when $U$ solves the Helmholtz equation

$$
(\Delta+k^2)U=0.
$$

So we can consider the frequency-domain solution as the spatial part of a time-periodic wave. And here comes the connection to time transformations.

## Time Transformation

Introduce a new time coordinate $\tau$ using a height function $h(r)$ that only depends on the radius:

$$
\tau=t-h(r),
\qquad
t=\tau+h(r),
$$

Then, using the time harmonic ansatz, we have

$$
\phi = e^{-ikt}U
=e^{-ik\tau}{\color{#176de8}{e^{-ikh(r)}U}}.
$$

The highlighted quantity is the phase-transformed Helmholtz field. The regular unknown $u$ used in the rest of the book also includes the conformal factor introduced below. Thus a complex exponential scaling of the Helmholtz unknown is equivalent to a time transformation in the wave equation. That's the connection. To understand where the rest of the transformations come from, we must include a few pointers to mathematical relativity.

(conformal-infinity)=
## Conformal Infinity

What we're doing in this method is to map infinity to the finite boundary of a computational domain. This is the same idea as the conformal compactification used in relativity. The method goes back to the concept of conformal infinity introduced by Penrose in 1963 in his work on [asymptotic properties of spacetime](https://doi.org/10.1103/PhysRevLett.10.66). Penrose demonstrated that infinity in relativity has a geometric structure inherited from the causal structure of spacetime. We have infinity along timelike directions, along spacelike directions, and along null directions. The latter is the relevant one for radiation problems because outgoing (scattered) waves propagate along characteristics to null infinity. Since the causal structure is preserved by conformal rescalings, Penrose could replace asymptotic analysis at infinity by local analysis at the conformal boundary where the conformal factor vanishes. The conformal boundary where outgoing radiation propagates to is called *future null infinity* and denoted by $\mathscr I^+$.

This powerful tool was used heavily to study the large-scale structure of the universe and global properties of the Einstein equations. In particular, Friedrich proved the semi-global, [nonlinear stability of Minkowski spacetime](https://link.springer.com/article/10.1007/BF01205488) by using a hyperboloidal initial-value formulation of Einstein's equations, years before the celebrated global Christodoulou–Klainerman proof. At the dawn of numerical relativity, researchers tried to use conformal compactification to calculate gravitational waves from isolated systems (see [Frauendiener](https://doi.org/10.12942/lrr-2004-1) for a review).

Solving the Einstein equations numerically for generic gravitational waves including null infinity proved very difficult. This problem is still open. When a background metric is given, however, one can construct explicit hyperboloidal coordinates that map null infinity to a computational boundary, as demonstrated in [Zenginoğlu](https://arxiv.org/abs/0712.4333). This is the method that we are employing here for the Helmholtz equation.

The hyperboloidal compactification method consists of three steps. In our context, we can describe them as follows:

- **Time transformation**: Introduce a new time coordinate $\tau=t-h(r)$, where $h(r)$ is a height function that asymptotically approaches $r$.
- **Spatial compactification**: Introduce a new radial coordinate $\rho$ that maps infinity to a finite value and compactify the spatial domain.
- **Conformal rescaling**: Introduce a conformal factor $\Omega$ that vanishes at infinity and write $U=\Omega^m e^{ikh}u$, or equivalently $u=\Omega^{-m}e^{-ikh}U$, to obtain a regular unknown.

In our construction, we use the same function $\Omega$ for the spatial compactification and the conformal rescaling. The transformations are then determined by suitable choice of $\Omega$ and $h$.

For the interested reader, we included two examples that illustrate the spacetime connection for the Helmholtz equation:

- {doc}`examples/frequency_domain_poincare_circle` uses the Poincaré disk to illustrate the connection between hyperboloidal compactification and hyperbolic geometry.
- {doc}`examples/frequency_domain_characteristic_circle` uses a characteristic transformation to illustrate the connection between hyperboloidal compactification and characteristic coordinates.

Next, we show how the Helmholtz equation transforms under these three steps.
