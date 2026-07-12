(far-field-compactification)=
# Compactifying the Far Field

A direct compactification of the physical Helmholtz field is not useful. The reason is familiar to anyone who has solved high-frequency Helmholtz problems: oscillations matter.

Consider the outgoing one-dimensional wave

$$
U(r)=e^{ikr}.
$$

If we compactify the radius by

$$
r=\frac{\rho}{1-\rho},\qquad 0\le \rho<1,
$$

then

$$
U(\rho)=\exp\left(ik\frac{\rho}{1-\rho}\right).
$$

The local compactified wavenumber is

$$
\left|\partial_\rho\left(k\frac{\rho}{1-\rho}\right)\right|
=\frac{k}{(1-\rho)^2},
$$

which diverges at $\rho=1$. A finite physical wavelength has been compressed into an infinite number of oscillations in a finite coordinate interval. The same singularity appears in the operator. With

$$
G(\rho)=\frac{d\rho}{dr}=(1-\rho)^2,
\qquad \partial_r=G\partial_\rho,
$$

the compactified equation $U_{rr}+k^2U=0$ becomes, after division by $G$,

$$
\partial_\rho\left(G\partial_\rho U\right)
+\frac{k^2}{G}U=0.
$$

The coefficient $k^2/G$ blows up at the compactified boundary. Pure spatial compactification has turned the exterior problem into an infinite-resolution problem.

## The Far-Field Amplitude

The outgoing solution is not arbitrary near infinity. It has the form

$$
U(r,\omega)
\sim
r^{-m}e^{ikr}U_\infty(\omega),
\qquad
m=\frac{d-1}{2}.
$$

Instead of compactifying $U$, define a bulk extension of the far-field amplitude,

$$
u(r,\omega)
=r^m e^{-ikr}U(r,\omega).
$$

Then

$$
\lim_{r\to\infty}u(r,\omega)=U_\infty(\omega).
$$

This is the central frequency-domain idea. We do not compactify the oscillatory physical field. We first remove the outgoing oscillation $e^{ikr}$ and the radiative decay $r^{-m}$, and then compactify the resulting amplitude. The far field becomes the trace of the transformed unknown.

## Characteristic Baseline and Infinite Elements

The scaling

$$
U=r^{-m}e^{ikr}u_{\rm char}
$$

is standard in methods that build the outgoing asymptotics into an exterior approximation space. In particular, conjugated infinite elements extract the same leading spherical decay and phase before approximating the remaining amplitude; see [Gerdes](https://doi.org/10.1016/S0045-7825(97)00186-2) and [Astley's review](https://doi.org/10.1002/1097-0207(20001110)49:7%3C951::AID-NME989%3E3.0.CO;2-T). The characteristic compactification in this book starts from this familiar normalization and maps the infinite radial interval to a finite one. Infinity then becomes an actual mesh boundary on which $u_{\rm char}=U_\infty$.

This exact scaling is the clean reference case, but applying it globally is not always the most convenient construction for a general obstacle. The layer method keeps the coordinates and unknown unchanged near the scatterer and asks only that the transformation approach the characteristic scaling asymptotically. The height function introduced below provides precisely this freedom.

## Generalized Bulk Extension

For computations it is useful to allow more flexible transformations. We write

$$
r=\frac{\rho}{\Omega(\rho)},
$$

where $\Omega>0$ in the computational interior and $\Omega=0$ at the compactified boundary. We also replace the phase $r$ by a phase function $h(r)$. The transformed unknown $u$ is defined by

$$
U(r(\rho),\omega)
=\Omega(\rho)^m e^{ikh(r(\rho))}u(\rho,\omega).
$$

Equivalently,

$$
u(\rho,\omega)
=\Omega(\rho)^{-m}e^{-ikh(r(\rho))}U(r(\rho),\omega).
$$

If the compactified boundary is $\rho=S$, then $r=\rho/\Omega$ implies the normalization

$$
\lim_{r\to\infty}r\Omega=S.
$$

For the constant-coefficient outgoing phase used here, a definite far-field trace additionally requires

$$
h(r)=r+h_0+o(1),
\qquad r\to\infty,
$$

for some constant $h_0$. The boundary normalization is then

$$
u\big|_{\rho=S}
=S^{-m}e^{-ikh_0}U_\infty.
$$

Thus $u$ is a regular finite-element unknown and its boundary trace gives the far field through a known constant.

The characteristic disk example later introduces the bounded rescaling $u_{\rm char}=\rho^m u$. Because its special choice is $h=r$, this recovers the exact spherical amplitude above and simplifies the strong form. This extra factor is not needed for the layer or Poincaré weak-form examples.

This is the practitioner-facing entry point to hyperboloidal compactification in the frequency domain. The spacetime interpretation explains where $\Omega$ and $h$ come from geometrically, but the finite-element method can first be understood as a compactification of a suitable far-field extension.
