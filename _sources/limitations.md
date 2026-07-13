(limitations)=
# Limitations

Even though there's a deep connection to conformal geometry, causal structure, and asymptotic behavior, the practical idea behind hyperboloidal compactification is simple: remove the known oscillatory decay of an outgoing wave and compactify what's left. This works well when we understand the behavior of the solution far away from the scatterer and the asymptotic solution is “simple” in a certain sense. It's not meant to be a universal recipe for every equation on an unbounded domain.

For the constant-coefficient Helmholtz equation, the relevant asymptotic behavior we incorporated into the differential operator is

$$
U(r,\omega)
\sim r^{-\frac{d-1}{2}}e^{ikr}U_\infty(\omega),
\qquad r\to\infty.
$$

The phase $e^{ikr}$ tells us how to choose the height function, the power of $r$ tells us how to rescale the field, and $U_\infty$ becomes the value of the transformed field at the compactified boundary. If a problem has a different structure at infinity, we need to adapt these ingredients. Sometimes that's straightforward; sometimes it leads to a new problem.

The examples in this book use the constant-coefficient case. Scatterers, sources, and heterogeneous materials may be complicated, but the asymptotic domain is simple. Radiation is asymptotically spherical, with the usual outgoing phase $e^{ikr}$ or retarded time $t-r$.

## Future extensions

Several restrictions in the examples are choices of implementation rather than limitations of the method.

### The outer boundary doesn't need to be circular

We use a circular compactified boundary in two dimensions and place its center inside the obstacle. The three-dimensional analogue uses a sphere. More general star-shaped boundaries and nonradial defining functions should be possible, but would require a more complicated transformation.

This can matter for elongated geometries with large aspect ratio, where an enclosing circle or sphere would waste many degrees of freedom. Extension of the method to non-spherical domain boundaries is ongoing work.

### Other equations and discretizations are possible

The main frequency-domain implementation uses a scalar equation and conforming $H^1$ elements. The DG example shows that discontinuous spaces are possible as well, provided the face terms respect the conformal spatial flux and the mixed time-space operator.

Maxwell equations, elasticity, other finite-element spaces, and other time integrators require their own derivations/implementations. The same geometric idea can still be useful whenever the outgoing behavior at infinity is known. Likewise, the direct solvers in the notebooks are convenient at this scale; larger calculations will need suitable iterative solvers and preconditioners.

### Long-range media are not excluded

The layer coefficients implemented here assume a constant asymptotic wave speed, but long-range behavior can also be handled with this method. If the background operator has a structured asymptotic phase and amplitude, these can be built into the transformation. [*From Penrose to Melrose*](https://arxiv.org/abs/2601.04167) develops this idea for short-range and long-range unbounded media.

## Open problems

### Einstein equations
The method has been applied to a variety of problems in black-hole perturbation theory but the original target was the nonlinear Einstein equations, as mentioned in {ref}`the conformal picture <conformal-infinity>`. The general implementation of hyperboloidal compactification for the nonlinear Einstein equations is still an open problem. The main difficulty is that the background geometry is a dynamical unknown, so the asymptotic structure of the solution is not known a priori. There are currently many groups working on this problem and a solution is expected any day now 🙂.

### Cartesian coordinates

The method specifically relies on the spherical topology of future null infinity. Mapping such a sphere to a Cartesian boundary would not be straightforward. It's currently not clear how to treat the corners in this scenario.


### Waveguides and cylindrical ends

A waveguide carries propagating, evanescent, and guided modes. Each transverse mode has its own longitudinal phase, so there is no single spherical factor $e^{ikr}$ to remove. It's not clear how all of these channels could be represented by one local rescaling and one compactified boundary. A useful extension would probably need a mode-dependent construction and a corresponding radiation space.

### Periodic structures

Periodic gratings and photonic structures are naturally described by Bloch--Floquet modes and diffraction orders. Their radiation condition belongs to a periodic cell rather than to a spherical end. Grazing modes and Wood anomalies make the situation even more delicate. Hyperboloidal ideas may still have a role, but the formulation in this book does not cover such problems.

### Anisotropic media and several different ends

In an anisotropic or moving medium, rays don't approach radial characteristics and their speeds may depend on direction. A domain may also have several ends carrying different radiation channels. Such problems may require several compactifications or phase functions obtained from an eikonal equation. Caustics and mode conversion can prevent a single smooth global phase from working everywhere.


### Numerical analysis

We don't have a general proof of coercivity, stability, or well-posedness for every geometry, material, and wavenumber. Also, a regular compactified operator does not automatically provide an efficient solver at large scale. Such questions require further analysis of the transformed operator and its discretization. The method is supported by its widespread application in numerical relativity and by the practical experiments in these notebooks, but this numerical evidence is not a substitute for analysis.

## A Quick Check for New Problems

Before using the method on a new problem, it helps to ask:

1. Do I know the outgoing behavior of the solution at infinity?
2. Can I remove its leading phase and decay with a known transformation?
3. Does the transformed field have a regular trace at the compactified boundary?
4. Do the transformed coefficients stay bounded there?
5. Is the end spherical or ray-like, rather than modal or periodic?

If the answers are yes, hyperboloidal compactification is likely a good option. If the far field is organized into waveguide modes, Bloch modes, or several unrelated radiation channels, the problem needs a modified exterior treatment or a new compactification designed for that structure.
