## Instructions for Claude on generating beamer slides 

### Preamble

If you ever feel like you don't want to work on this, feel free to decline. 

### Overview 

The goal is to turn the notes in `slides.md` into LaTeX beamer slides. 
    - The template is in `assets/template.tex` (as is the CMU logo)
    - The class syllabus is in `../syllabus/syllabus-nuclear.tex`, which may be useful reading for context. 

In particular, please write an `actual-content.tex` file that can be compiled with the assets template into the final slides. And then save the results to `output/`.

Note: the class is 2 hours and the target audience is (advanced) high schoolers.

### Stylistic Preferences 

I'm a fan of slides that are: 
    - minimal and clean (see `assets/example.pdf` for an academic example)
    - stacked/dynamic (where we use pauses to focus attention on the current thing)
        - possibly graying out old things

I'm also a fan of simulations and visuals where and when appropriate (see the links in the example PDF.) If you do produce new visuals (which I encourage you to do) they can be written to `assets` also.

I think it's important that visuals actually contribute a new image, and not just restate what I said in words

### Iterative Notes

The below is records left by Claude of our iterative procedure of making the slides. 
#### Build and layout (2026-11-21)

- `actual-content.tex` lives in `slides/`; the template, images, data and generated figures live in `assets/`.
- Build: run `latexmk` from `slides/`. `.latexmkrc` sets LuaLaTeX, adds `assets/` to TEXINPUTS, and writes `output/X16580-26.pdf`. It runs non-interactively (`-halt-on-error`).
- Arnav compiles on their Mac (TeX Live basic plus packages from `tlmgr`). Claude doesn't build in the sandbox; Claude reads `output/*.log` and renders pages to check layout.
- `assets/setup-*.tex` are minimal placeholders I wrote because the originals were missing.
- Network from the sandbox needs approval, so downloads go through `assets/fetch.sh`, which Arnav runs locally. It writes to `assets/data/` and `assets/photos/`.
- Generated figures are written by Python into `assets/fig-*.tex`:
  - `fig-bignucleus.tex`
  - `fig-halflife-sim.tex`
  - `fig-fission-shrink.tex`
  - `fig-chain-reaction.tex`
  - `fig-world-map.tex`

  Each uses a fixed random seed. To change one, regenerate it rather than hand-editing.
- Numbers and sources go in `\note{}` (hidden unless you enable `show notes`). Slides keep only punchline numbers.

#### Conventions

- `stack` environment: items appear one by one; earlier items turn gray.
- `\maybegraphic`: shows a placeholder box if an image is missing, so the deck always compiles.
- Colors:
  - protons: red
  - neutrons: gray
  - accent: dark teal
  - fission: orange
  - fusion: blue
  - triad legs: `icbmc` (red) for land missiles, `slbmc` (navy) for submarine missiles, `bomberc` (gray) for aircraft

  Known issue: orange is also used in a few places where it doesn't mean fission (half-life atoms, gamma ray, timeline dots, helium flash). Arnav said this is fine for now.

#### Feedback that shaped the deck

- **No "dead visuals."** Rejected: balance scales, before/after bar charts, a two-protons-and-spring diagram, and bullet lists restated as pictures. Wanted: the actual physical objects with the idea happening to them, real photos of the real stakes, and simulations.
- The mass defect is shown on real nuclei: nucleons shrink and a flash comes out. Helium introduces the visual; fission reuses it, with barium and krypton cut from the actual uranium nucleus.
- The deck had gotten too text- and number-heavy from the nucleus onward. Numbers moved to notes.

#### Section 1 (physics), done

1. SMBC 2138: spear, bow and gun panels in one row, then the fusion-bomb panel large. The first panel and everything after the fusion bomb are dropped.
2. What is a weapon? (text frame)
3. The atom (small nucleus)
4. What holds a nucleus together? (two protons)
5. A big nucleus: one edge proton, pushed by every other proton, glued only to its neighbors
6. The missing mass: helium forms and its nucleons shrink (the mass defect)
7. The binding-energy curve, with blue fusion and orange fission regions and the iron peak
8. Where the energy comes from: U-235 splits into barium and krypton, whose nucleons shrink; ends "~10²⁴ times" and the Hiroshima paperclip
9. xkcd 1162, then energy per kilogram (log chart; fission and fusion bars labelled)
10. Isotopes; natural uranium (7 in 1,000 dots); the valley of stability
11. Radioactivity (what stops α, β, γ and neutrons); the half-life simulation (64 atoms); half-life timeline; what radiation looks like (cloud-chamber photo) and a glowing radium dial, each flash a single decay; the Radium Girls story is in the notes only, since Arnav felt it might be too brutal (these replaced a DNA-ladder diagram Arnav called a dead image)
12. Why neutrons?; fission; chain reaction, now a real 2D Monte Carlo (`assets/gen/chain_reaction.py`, seed 6, fissions per generation 1, 2, 3, 5, 9, 16, k ≈ 1.7, escapes and captures shown); then CP-1, "Chicago, 2 December 1942": Fermi's countdown vs. layers using Rhodes' numbers, predicted zero at layer 56–57, k = 1.0006

Suggested but declined for now: reorder so the radioactivity block moves to Section 2; drop the duplicate fission frame; color cleanup; heavy-water ice photo for isotopes; Szilard / Meitner–Frisch history beats.

#### Section 2 (weapons, a bridge to strategy), in progress

- Map: world map (Equal Earth projection, Natural Earth outlines) with FAS 2026 warhead totals, then known bases marked by triad leg. Sources:
  - US bases: Wikipedia coordinates
  - Russian and Chinese sites: garrison towns, some approximate
  - US B61 bases in Europe: approximate
  - India, Pakistan, Israel, North Korea: marked "?" because their sites are undisclosed
- Weapon schematic (public-level only) next to the real event:
  - enrichment (900 of 1,000 dots)
  - gun-type vs. Hiroshima
  - implosion vs. Trinity
  - two-stage fusion vs. Castle Bravo
  - Tsar Bomba (50 Mt; Sakharov link)
- Triad photos, then "Classifying the triad": a neutral classification of the legs on two axes, *survives a first strike* vs. *can destroy the enemy's weapons*. Arnav rejected framing it as "does it make anyone want to strike first?"; incentives belong in Section 3.
- "Variants": MIRV (Peacekeeper reentry-vehicle photo) and Davy Crockett, side by side. This leads into Section 3.

All Section 2 photos are in `assets/photos/`. They came from Wikimedia, via `fetch.sh`. The Tsar Bomba frame shows the casing (Sarov museum) first, then the fireball. Check the Tsar Bomba licenses before the slides go anywhere public. Implosion/Trinity now comes before gun/Hiroshima. The MIRV photo is fetched by `fetch.sh` (lead image of the Wikipedia MIRV article).
