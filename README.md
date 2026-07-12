# Hyperboloidal compactification in NGSolve

An executable introduction to finite-element Helmholtz and wave problems with infinity as a computational boundary.

Published book: <https://markuswess.github.io/hypFEM>

## Local build

The notebooks require Python 3.12 and NGSolve. A tested environment can be created with

```bash
conda create -n hypfem python=3.12
conda activate hypfem
python -m pip install -r requirements.txt
```

Build with the execution cache:

```bash
make
```

For review, publication, or continuous integration, use a clean build that executes every notebook from the current source:

```bash
make full
```

The HTML entry point is `_build/html/index.html`. The clean build is the reproducibility check: a normal cached build can legitimately reuse results from an earlier execution.

After committing and pushing the reviewed source branch, publish the clean build with:

```bash
./publish.sh
```

The script stops if the clean execution fails and only then updates the `gh-pages` branch.

## Numerical conventions

- Time dependence is `exp(-i k t)`, so `exp(i k r)` is outgoing.
- Frequency-domain notebooks solve for the physical scattered field with boundary data `-U_inc`.
- The main weak form uses `U = Omega^((d-1)/2) exp(i k h) u`.
- The characteristic benchmark additionally uses the bounded standard far-field scaling `u_char = rho^((d-1)/2) u`.
