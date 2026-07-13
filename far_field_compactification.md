(far-field-compactification)=
# Compactifying the Far Field

The unknown $U(r,\omega)$ oscillates infinitely many times on an infinite domain. Therefore, a direct compactification of the Helmholtz equation doesn't work. It simply translates the infinite domain problem into an infinite resolution problem.

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

The coefficient $k^2/G$ blows up at the compactified boundary.

The main quantity of interest in the unbounded-domain problem is the far field. We should therefore be able to compactify a suitable bulk extension of the far-field amplitude.

## The far-field amplitude

The outgoing solution near infinity has the form

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

This scaling is indeed standard in methods that build the outgoing asymptotics into an exterior approximation space. Conjugated infinite elements extract the same leading spherical decay and phase before approximating the remaining amplitude (see reviews [Gerdes](https://doi.org/10.1016/S0045-7825(97)00186-2) and [Astley](https://doi.org/10.1002/1097-0207(20001110)49:7%3C951::AID-NME989%3E3.0.CO;2-T)). It turns out that this scaling corresponds to using characteristic coordinates in the time domain.

This choice is not always the most convenient one for a general obstacle. It also changes the nature of the wave equation in the time domain. Since the transformation needs to approach the characteristic scaling only asymptotically, we can generalize the phase by introducing a height function $h(r)$ and define the bulk-extended far-field variable through a rescaling like this:

$$
u(r,\omega)
=r^m e^{-ik h(r)}U(r,\omega).
$$

The height function $h(r)$ asymptotically approaches $r$.

This is the central frequency-domain idea, first introduced in the context of black-hole perturbation theory (see [Zenginoğlu](https://arxiv.org/abs/1102.2451)). We don't compactify the oscillatory field. We first remove the outgoing oscillation $e^{ikr}$ and the radiative decay $r^{-m}$, and then compactify the resulting bulk extension of the far field. The far-field is then obtained directly as the trace of the transformed unknown.

## Bulk extension of the far field

It's useful to allow more flexible transformations that combine the phase scaling (which corresponds to a time transformation), the amplitude scaling (which corresponds to a conformal transformation), and the spatial compactification. For the spatial compactification, we write

$$
r=\frac{\rho}{\Omega(\rho)},
$$

where $\Omega>0$ in the computational interior and $\Omega=0$ at the compactified boundary. We define the transformed unknown $u$ by

$$
u(\rho,\omega)
=\Omega(\rho)^{-m}e^{-ikh(r(\rho))}U(r(\rho),\omega).
$$

If the compactified boundary is at $\rho=S$, then $r=\rho/\Omega$ implies

$$
\lim_{r\to\infty}r\Omega=S.
$$

As mentioned above, the height function $h(r)$ should asymptotically approach $r$:

$$
h(r)=r+h_0+o(1),
\qquad r\to\infty,
$$

for some constant $h_0$. The boundary normalization is then

$$
u\big|_{\rho=S}
=S^{-m}e^{-ikh_0}U_\infty.
$$

Thus $u$ is a regular unknown and its boundary trace gives the far field through a known constant.

This is the essence of hyperboloidal compactification in frequency domain. A deeper, geometric understanding of $\Omega$ and $h$ comes from the spacetime interpretation, but the finite-element method can first be understood as a compactification of a suitable bulk extension of the far field.
