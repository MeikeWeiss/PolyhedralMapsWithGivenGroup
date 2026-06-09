# Polyhedral Maps of Cubic Graphs with Given Automorphism Groups

Accompanying code for the paper:

> U. Detaille, M. Weiß, R. Akpanya, A. C. Niemeyer,
> *Polyhedral Maps of Cubic Graphs with Given Automorphism Groups*,
> preprint, 2025. [[arXiv link]](#)

---

## Overview

Given a finite group $G$ and a generating set $S$, this repository provides implementations that:

1. **Construct the cubic graph** $D_{G,S}$ whose automorphism group is isomorphic to $G$, based on a modification of Babai's Cayley-graph construction.
2. **Compute a cycle double cover (CDC)** $\mathcal{Z}$ of $D_{G,S}$ that induces a polyhedral map — i.e., any two cycles in $\mathcal{Z}$ intersect in at most one edge.
3. **Verify** that $\mathcal{Z}$ is invariant under the natural action of $\mathrm{Aut}(D_{G,S}) \cong G$.

The main theorem proved in the paper is:

> For any finite group $G$ with generating set $S$, there exists a 3-connected cubic graph $D_{G,S}$ and an $\mathrm{Aut}(D_{G,S})$-invariant CDC $\mathcal{Z}$ of $D_{G,S}$ such that $\mathrm{Aut}(D_{G,S}) \cong G$ and $\mathcal{Z}$ induces a polyhedral map.

---

## Repository Contents

```
.
├── gap/
│   ├── construction.g       # Graph construction D_{G,S}
│   └── cdc.g                # Cycle double cover computation
├── magma/
│   └── construction.m       # Graph construction D_{G,S} in Magma
└── README.md
```

---

## Dependencies

### GAP implementation

- [GAP](https://www.gap-system.org/) (version 4.12 or later)
- [Digraphs package](https://digraphs.github.io/Digraphs/) (version 1.6 or later)

Install the Digraphs package from within GAP:

```gap
gap> InstallPackage("digraphs");
```

### Magma implementation

- [Magma](http://magma.maths.usyd.edu.au/) (version 2.27 or later)

---

## Usage

### GAP

Load GAP and the Digraphs package, then read the construction file:

```gap
gap> LoadPackage("digraphs");
gap> Read("gap/construction.g");
```

**Construct the graph** $D_{G,S}$ for a given group `G` and generating set `S`:

```gap
gap> G := AlternatingGroup(5);
gap> S := [(1,5)(2,4), (1,2,4,3,5), (2,5,3)];
gap> D := BuildGraph(G, S);
```

**Compute the cycle double cover**:

```gap
gap> Read("gap/cdc.g");
gap> Z := ComputeCDC(D, G, S);
```

**Verify the automorphism group and CDC invariance**:

```gap
gap> VerifyAutomorphismGroup(D, G);
gap> VerifyCDCInvariance(D, Z, G);
```

### Magma

```magma
> load "magma/construction.m";
> G := AlternatingGroup(5);
> S := {(1,5)(2,4), (1,2,4,3,5), (2,5,3)};
> D := BuildGraph(G, S);
```

---

## Testing

The implementations have been tested against randomly selected groups of various orders to validate correctness of:

- the graph construction and its vertex/edge counts,
- the isomorphism $\mathrm{Aut}(D_{G,S}) \cong G$,
- the CDC properties (every edge covered exactly twice, pairwise intersections of at most one edge),
- invariance of $\mathcal{Z}$ under $\mathrm{Aut}(D_{G,S})$.

Note: the construction depends on the choice of generating set $S$ **and** the ordering of generators. Different orderings may yield non-isomorphic graphs (see Section 3.1 of the paper for an explicit example with $G = A_5$).

---

## Authors

- **Ugo Detaille** — RWTH Aachen University
- **Meike Weiß** — RWTH Aachen University
- **Reymond Akpanya** — RWTH Aachen University; The University of Sydney
- **Alice C. Niemeyer** — RWTH Aachen University

---

## Acknowledgements

R. Akpanya, M. Weiß and A. C. Niemeyer gratefully acknowledge funding by the Deutsche Forschungsgemeinschaft (DFG, German Research Foundation) within the Collaborative Research Centre CRC/TRR 280 (project ID 417002380). R. Akpanya was further supported by a grant from the Simons Foundation (SFI-MPS-Infrastructure-00008650).

---

## Citation

If you use this code, please cite the accompanying paper:

```bibtex
@article{detaille2025polyhedral,
  author  = {Detaille, Ugo and Wei{\ss}, Meike and Akpanya, Reymond and Niemeyer, Alice C.},
  title   = {Polyhedral Maps of Cubic Graphs with Given Automorphism Groups},
  year    = {2025},
  note    = {Preprint}
}
```

---

## License

[MIT License](LICENSE)
