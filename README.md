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
├── graphD.g     # GAP: graph construction D_{G,S}
├── cycles.g     # GAP: cycle double cover (loads graphD.g automatically)
├── graphD.m     # Magma: graph construction D_{G,S}
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

> **Note on generator ordering:** The generating set `S` must be passed as an **ordered list**, not a set. The construction depends on the ordering — different orderings may produce non-isomorphic graphs (see Section 3.1 of the paper for an explicit example with $G = A_5$).

---

### GAP — Graph Construction

Load the Digraphs package and the construction file:

```gap
gap> LoadPackage("Digraphs");;
gap> Read("graphD.g");
```

**With an explicit generating set** (returns a `Digraph` object):

```gap
gap> G := AlternatingGroup(5);
gap> S := [(1,5)(2,4), (1,2,4,3,5), (2,5,3)];
gap> D := graphDMakerWithGenerators(G, S);
```

**With an automatically computed minimal generating set** (uses GAP's `MinimalGeneratingSet`):

```gap
gap> D := graphDMakerWithoutGenerators(G);
```

---

### GAP — Cycle Double Cover

Loading `cycles.g` also loads `graphD.g` automatically:

```gap
gap> LoadPackage("Digraphs");;
gap> Read("cycles.g");
```

**Compute the CDC** (returns a list of vertex-label cycles):

```gap
gap> G := AlternatingGroup(5);
gap> S := [(1,5)(2,4), (1,2,4,3,5), (2,5,3)];

gap> Z := make1CutCDCWithGenerators(G, S);      # explicit generating set
gap> Z := make1CutCDCWithoutGenerators(G);      # uses MinimalGeneratingSet
```

**Compute the CDC as permutation tuples** (compatible with the [SimplicialSurfaces](https://github.com/gap-packages/SimplicialSurfaces) package):

```gap
gap> Z := make1CutCDCAsTuplesWithGenerators(G, S);   # explicit generating set
gap> Z := make1CutCDCAsTuplesWithoutGenerators(G);   # uses MinimalGeneratingSet
```

---

### Magma — Graph Construction

Attach the file and call the construction function:

```magma
> Attach("graphD.m");
> G := AlternatingGroup(5);
> S := [(1,5)(2,4), (1,2,4,3,5), (2,5,3)];
> D := graphDMakerWithGenerators(G, S);
```

The function returns an undirected `GrphUnd` graph object.

---

## Testing

The implementations have been tested against randomly selected groups of various orders to validate:

- the graph construction and its vertex/edge counts,
- the isomorphism $\mathrm{Aut}(D_{G,S}) \cong G$,
- the CDC properties (every edge covered exactly twice, pairwise cycle intersections of at most one edge),
- invariance of $\mathcal{Z}$ under $\mathrm{Aut}(D_{G,S})$.

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
