(transformed-operator)=
# Transformed Helmholtz Operator

The transformed unknown is designed so that the outgoing radiation field is regular at the compactified boundary. The differential operator must be transformed as well.

Let

$$
r=\frac{\rho}{\Omega(\rho)},\qquad
L(\rho)=\Omega-\rho\Omega',
$$

so that

$$
G(\rho)=\frac{d\rho}{dr}
=\frac{\Omega^2}{L}.
$$

Let

$$
H(\rho)=\frac{dh}{dr}(r(\rho))
$$

be the derivative of the phase function. In the exterior constant-index case, the important coefficient multiplying the $k^2$ term is

$$
M(\rho)=\frac{1-H^2}{G}.
$$

For a refractive index $n$ pulled back from the physical domain, this is replaced by

$$
M(\rho)=\frac{n^2-H^2}{G}.
$$

The regularity requirement is that $M$ remains bounded at the compactified boundary. For the phase and rescaling used here, the variable-index case requires $n^2-H^2=\mathcal O(G)$. More general short- and long-range backgrounds can be treated by adapting the asymptotic phase and rescaling to the background operator {cite}`zenginoglu2026penrosemelrose`; they should not be inserted unchanged into this particular coefficient formula. Pure spatial compactification of the oscillatory Helmholtz field has $H=0$ and $M=1/G$, so it fails this requirement.

## Cartesian Compactified Form

The NGSolve implementations work in Cartesian coordinates on the compactified mesh. Let

$$
X=(x,y),\qquad
\rho=|X|,\qquad
n=\frac{X}{\rho},
$$

and define the radial and angular projectors

$$
Q=nn^T,\qquad P=I-Q.
$$

The principal second-order part becomes anisotropic:

$$
GQ+LP.
$$

Thus the radial direction degenerates with coefficient $G\to0$, while angular derivatives retain the bounded coefficient $L$. The first-order $ik$-term contains the phase derivative $H$, and the $k^2$-term contains the bounded coefficient $M=(1-H^2)/G$.

The examples in this book use three related choices:

| example | compactification | phase derivative |
| --- | --- | --- |
| hyperboloidal layer | $\Omega=1$ in the interior, linear in the layer | $H=1-G$ in the layer |
| Poincaré disk | $\Omega=(1-\rho^2)/2$ | $H=2\rho/(1+\rho^2)$ |
| characteristic disk | $\Omega=1-\rho$ | $H=1$ |

All three choices implement the same principle: compactify the far-field amplitude, not the original oscillatory field. The characteristic notebook introduces its additional bounded factor $\rho^m$ locally. For the full derivation see {cite}`wesszenginoglu2026`.
