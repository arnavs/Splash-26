# Audit of quantitative claims: X16580 slides

Covers every number in the **active** frames of `actual-content.tex` (Sections 1 and 2), as of 2026-11-21.
Commented-out frames (CP-1, enrichment, Section 3) are listed briefly at the end.

**How this was checked.** I recomputed the nuclear numbers from atomic masses with `periodictable` 2.1.0, which ships NIST
*Atomic Weights and Isotopic Compositions* (AME-based masses). I used CODATA 2018 constants
(u = 931.494 MeV, m(¹H) = 1.007825 u, mₙ = 1.008665 u, mₚ = 1.007276 u, mₑ = 0.000549 u).
Binding energy is B = Z·m(¹H) + N·mₙ − M(atom). Historical and weapons numbers come from the course readings in `../materials/`
where possible (Rhodes, the Sakharov reprint) and from the local FAS snapshot. Other references are standard ones, but I
couldn't open them from the sandbox (the network is gated), so the URLs are from memory. Spot-check any you plan to put on a slide.

Legend: ✅ checks out · ⚠️ defensible but worth a tweak · ❌ wrong, fix it

---

## Summary of problems

| # | Where | Issue | Suggested fix |
|---|---|---|---|
| 1 | Binding curve, `actual-content.tex:203`, point `(184,7.930)` | ❌ No A = 184 nuclide has 7.930 MeV. W-184, the natural one (30.6%), is **8.005**; Os-184 is 7.989. 7.930 matches Re-192 or Os-194, so it's probably a transcription slip. It makes a fake dip next to Pt-195. | Change to `(184,8.005)` |
| 2 | Chain reaction, `:562–566` | ❌ The slide says k ≈ 1.7, then "about 80 generations → 10²⁴". 80 generations gives 10²⁴ only at k = 2 (2⁸⁰ ≈ 1.2×10²⁴). At k = 1.7, 80 generations gives only ≈ 3×10¹⁸, and reaching 10²⁴ takes ≈ 104. The note's "1.7⁸⁰ and 2⁸⁰ are both astronomically large" hides a factor of a million. | Say "about **100** generations" (still ~1 µs at 10 ns each), or keep 80 and add "if each one doubles". |
| 3 | Binding-curve note, `:228–229` | ⚠️ "Fragments ≈ 8.5 MeV/nucleon, gain ≈ 0.9 × 235 ≈ 200 MeV". Actual values: Ba-141 is 8.326 and Kr-92 is 8.513, a nucleon-weighted average of **8.40**. That gives a gain of ≈ 0.81 MeV × 235 ≈ 190 MeV. The exact Q for this channel is 173 MeV, which the next frame's note already uses. | "≈ 8.4 MeV/nucleon … ≈ 0.8 MeV × 235 ≈ 190 MeV, ~200 with the fragments' later decays" |
| 4 | Hiroshima yield, `:249, 295, 730` | ⚠️ The deck says ~15 kt. The course reading (Rhodes) says **12.5 kt** (PDF pp. 510, 748). Current DOE/LANL figure: ~15 kt. The DS02 dosimetry reassessment: ~16 kt. A student reading Rhodes will see a different number. The paperclip punchline holds at any of these (0.58–0.75 g). | Add to the note: "Rhodes gives 12.5 kt; modern estimates 15–16 kt." |
| 5 | Hiroshima deaths, `:734` | ⚠️ "70,000–140,000 by the end of 1945". 70k is closer to the immediate death toll. Rhodes: 140,000 by end of 1945 (PDF p. 771). RERF: 90,000–166,000 within 2–4 months. | "~90,000–166,000 by the end of 1945 (RERF); Rhodes: 140,000" |
| 6 | Tsar Bomba note, `:803–804` | ⚠️ "~10,000 eventual **deaths** per megaton". The Sakharov reprint (`materials/sgs01sakharov.pdf`, von Hippel's intro) says 10,000 people who would "suffer cancers, genetic disorders, and other ill effects", i.e. "deaths **and other health injuries**". The same source also uses **58 Mt** for Tsar Bomba. | "~10,000 deaths and serious illnesses per megaton". You could mention that 50 vs 58 Mt are both quoted. |
| 7 | The atom, `:94` | ⚠️ The nucleus/atom diameter ratio is ~1/10,000 (uranium) to ~1/60,000 (hydrogen), so 1/100,000 is the top of the range. A 1 cm pea in a ~100 m stadium is 1/10,000, so the analogy and the number disagree by 10×. | "~1/10,000 to 1/100,000", or keep the pea-and-stadium analogy and drop the number |
| 8 | Energy chart label, `:275, 286` | ⚠️ The bar is labeled "Hydrogen fusion" but uses the **D–T** value (3.4×10⁸ MJ/kg). Fusing ordinary hydrogen (4 ¹H → ⁴He, as in the Sun) gives ≈ 6.4×10⁸. The note says D–T, so it's consistent, but a sharp student might ask. | Optional: label it "Heavy-hydrogen fusion" |
| 9 | Iron peak, `:209–213` | ⚠️ Known, and already commented in the source. Ni-62 (8.7945) > Fe-58 (8.7922) > Fe-56 (8.7903) per nucleon. "Iron: the most tightly bound" is the usual shorthand. Fe-56 does have the lowest *mass per nucleon*, which is the version that matches the mass-defect story. | Fine as is. If asked: "nickel-62 by a hair". |

Everything else checks out (details below).

---

## 1. Binding-energy-per-nucleon curve (`actual-content.tex:180–231`)

**Source of the plotted values:** the comment says "AME2020, rounded". Reference: M. Wang et al., *The AME 2020 atomic mass
evaluation (II)*, Chinese Physics C **45**, 030003 (2021). Table: https://www-nds.iaea.org/amdc/ame2020/mass_1.mas20.txt.
I recomputed each point from NIST masses, and they agree with AME2020 to well under 0.001 MeV.

**Which isotope each point is.** The slide only shows the mass number A, so I matched each plotted value against every
nuclide with that A. Each one matches a single isotope, almost always the most abundant one.

| A | Plotted (MeV) | Isotope | Recomputed | | A | Plotted | Isotope | Recomputed |
|---|---|---|---|---|---|---|---|---|
| 1 | 0 | H-1 | 0 | | 52 | 8.776 | Cr-52 | 8.776 ✅ |
| 2 | 1.112 | H-2 (deuterium) | 1.112 ✅ | | 56 | 8.790 | **Fe-56** | 8.790 ✅ |
| 3 | 2.573 | **He-3** (not tritium, 2.827) | 2.573 ✅ | | 62 | 8.795 | **Ni-62** | 8.795 ✅ |
| 4 | 7.074 | He-4 | 7.074 ✅ | | 64 | 8.736 | Zn-64 | 8.736 ✅ |
| 6 | 5.332 | Li-6 | 5.332 ✅ | | 84 | 8.717 | Kr-84 | 8.717 ✅ |
| 7 | 5.606 | Li-7 | 5.606 ✅ | | 90 | 8.710 | Zr-90 | 8.710 ✅ |
| 9 | 6.463 | Be-9 | 6.463 ✅ | | 98 | 8.635 | Mo-98 | 8.635 ✅ |
| 11 | 6.928 | B-11 | 6.928 ✅ | | 120 | 8.505 | Sn-120 | 8.504 ✅ |
| 12 | 7.680 | C-12 | 7.680 ✅ | | 132 | 8.428 | Xe-132 | 8.428 ✅ |
| 14 | 7.476 | N-14 | 7.476 ✅ | | 138 | 8.393 | Ba-138 | 8.393 ✅ |
| 16 | 7.976 | O-16 | 7.976 ✅ | | 142 | 8.346 | Nd-142 | 8.346 ✅ |
| 19 | 7.779 | F-19 | 7.779 ✅ | | 158 | 8.202 | Gd-158 | 8.202 ✅ |
| 20 | 8.032 | Ne-20 | 8.032 ✅ | | 166 | 8.142 | Er-166 | 8.142 ✅ |
| 23 | 8.112 | Na-23 | 8.111 ✅ | | **184** | **7.930** | W-184 | **8.005 ❌** |
| 24 | 8.261 | Mg-24 | 8.261 ✅ | | 195 | 7.927 | Pt-195 | 7.927 ✅ |
| 27 | 8.332 | Al-27 | 8.332 ✅ | | 208 | 7.868 | Pb-208 | 7.867 ✅ |
| 28 | 8.448 | Si-28 | 8.448 ✅ | | 226 | 7.662 | Ra-226 | 7.662 ✅ |
| 32 | 8.493 | S-32 | 8.493 ✅ | | 232 | 7.615 | Th-232 | 7.615 ✅ |
| 40 | 8.551 | Ca-40 | 8.551 ✅ | | 235 | 7.591 | U-235 | 7.591 ✅ |
| 48 | 8.723 | Ti-48 | 8.723 ✅ | | 238 | 7.570 | U-238 | 7.570 ✅ |

Notes:
- A = 3 is helium-3, not tritium. That's fine, but if you point at it while talking about D–T fuel, tritium would be 2.827.
- The plot has no A = 58, so Fe-58 (8.792) isn't shown. That's fine.
- Fragments used in the fission notes: **Ba-141 = 8.326**, **Kr-92 = 8.513**, U-235 = 7.591 MeV/nucleon.

## 2. Helium mass defect (`:175–177`)

| Claim | Check | Source |
|---|---|---|
| Parts 4.0319 u | 2mₚ + 2mₙ = 4.03188 u ✅ | CODATA 2018 (https://physics.nist.gov/cuu/Constants/) |
| He-4 nucleus 4.0015 u | M(⁴He atom) − 2mₑ = 4.00151 u ✅ | AME2020 / NIST |
| 0.75% missing | 0.753% ✅ | computed |
| 28.3 MeV | 28.296 MeV ✅ | computed |
| Sun loses ~4 Mt/s | L☉/c² = 3.828×10²⁶ W ÷ c² = 4.26×10⁹ kg/s ✅ | IAU 2015 Resolution B3 (nominal solar luminosity 3.828×10²⁶ W) |

## 3. Fission energy (`:228–249`, `:542`)

Reaction used throughout: **n + U-235 → Ba-141 + Kr-92 + 3n** (the textbook channel, also in `fig-fission-shrink.tex`).

| Claim | Check | Source |
|---|---|---|
| B(Ba-141) 1174, B(Kr-92) 783, B(U-235) 1784 MeV | 1173.98 / 783.17 / 1783.87 ✅ | AME2020 / NIST |
| Q ≈ 173 MeV ≈ 0.19 u | 173.28 MeV = 0.186 u ✅ (same from the full mass balance) | computed |
| ≈ 1/5 of a nucleon, 0.08% per nucleon | 0.186 u; 0.078% ✅ | computed |
| ~200 MeV per fission "once later decays are included" | ✅ Standard: ~202 MeV total, ~193 MeV recoverable (some goes to neutrinos) | Krane, *Introductory Nuclear Physics* (1988), §13.2; World Nuclear Association, "Physics of Uranium and Nuclear Energy" |
| 1 kg U-235 ≈ 2.6×10²⁴ nuclei | 2.56×10²⁴ ✅ | computed (1000 g / 235.04 g/mol × N_A) |
| ≈ 17–20 kt per kg | 17.0 kt (173 MeV) to 19.6 kt (200 MeV) ✅ | computed. Rhodes quotes Serber's Los Alamos Primer: "one kilogram of U235 was approximately equal to 20,000 tons of TNT" (`materials/rhodes.pdf`, PDF p. 487) |
| ≈ 0.8 g of mass gone per kg | 0.79–0.91 g ✅ | computed |
| A bomb does this ~10²⁴ times | 15 kt ÷ 200 MeV ≈ 2×10²⁴ ✅ | computed |
| Little Boy ~15 kt = 6.3×10¹³ J → 0.7 g | 6.28×10¹³ J → 0.698 g ✅ (but see problem #4 on 15 vs 12.5 kt) | 1 kt ≡ 4.184×10¹² J (NIST SP 811 convention) |
| A paperclip is ~1 g | ✅ A standard #1 clip is ~0.5–1 g | — |
| Fission frees 3 neutrons; 2.4 on average | ✅ ν̄ = 2.43 for thermal U-235 fission | ENDF/B-VIII.0; Krane §13.1 |

## 4. Energy per kilogram (`:263–296`)

| Bar | Value (MJ/kg) | Check | Source |
|---|---|---|---|
| Phone battery | 0.9 | ✅ upper end. Li-ion **cells** ~250 Wh/kg = 0.9 MJ/kg; full phone packs ~0.5–0.7 | Typical 18650/pouch cell datasheets; Battery University BU-107 |
| TNT | 4.2 | ✅ by definition (4.184 MJ/kg). Measured detonation energy is 4.1–4.6 | NIST SP 811 (the ton-of-TNT definition) |
| Coal | 24 | ✅ typical bituminous (range ~15–33 by rank) | US EIA, "Coal explained"; Engineering ToolBox, fuel heating values |
| Gasoline | 46 | ✅ higher heating value 46.4 (lower heating value 43.4) | Hydrogen Analysis Resource Center (h2tools.org), "Lower and Higher Heating Values of Fuels" |
| Uranium fission | 8.2×10⁷ | ✅ 200 MeV × 2.56×10²⁴ per kg = 8.21×10⁷ | computed (§3) |
| "Hydrogen" fusion | 3.4×10⁸ | ✅ for **D–T**: 17.59 MeV per 5.03 u = 3.37×10⁸ (see problem #8) | computed. D–T Q = 17.6 MeV: Krane §14.1 |
| "≈ 20 million × TNT" | 8.2×10⁷ / 4.184 = 1.96×10⁷ ✅ | | computed |
| "< 1 kg fissioned of 64 kg on board" | ✅ 15 kt ÷ 17–20 kt/kg ≈ 0.75–0.9 kg. 64 kg HEU (~80% U-235) | Coster-Mullen, *Atom Bombs* (2012); Atomic Heritage Foundation, "Little Boy and Fat Man" |

## 5. Isotopes and the valley of stability (`:325–378`)

("Islet of stability chart" here means the **valley of stability** frame. The deck has no island-of-stability chart.)

| Claim | Check | Source |
|---|---|---|
| Natural uranium: 7 in 1,000 are U-235 | 0.7204% U-235, 99.2742% U-238 ✅ | IUPAC/CIAAW isotopic abundances; NIST Atomic Weights & Isotopic Compositions |
| Stability band drawn as Z = A / (1.98 + 0.0155 A^{2/3}) | ✅ The standard approximation from the semi-empirical (liquid-drop) mass formula, found by minimizing mass over Z at fixed A. It gives Z = 82.4 at A = 208 and Z = 92.4 at A = 238, so the band lands on lead and uranium. | Krane §3.3 (semi-empirical mass formula); Wikipedia, "Valley of stability" / "Semi-empirical mass formula" |
| Band is a schematic, not data | ⚠️ The band is a formula, not plotted nuclides. If you want real data, plot the ~250 stable nuclides from NuDat 3 (https://www.nndc.bnl.gov/nudat3/). | — |
| Uranium at (Z, N) = (92, 143) and (92, 146) | ✅ U-235 and U-238 | — |
| "Nothing heavier than lead-208 is truly stable" | ✅ Bi-209 alpha-decays, t½ = 2.0×10¹⁹ y | de Marcillac et al., *Nature* **422**, 876 (2003) |

## 6. Half-lives (`:429–447`)

The timeline's x-coordinate is log₁₀(years) + 3. I checked each dot's position against that.

| Isotope | Note | Evaluated value | Dot position | Source |
|---|---|---|---|---|
| I-131 | 8 days | 8.02 d ✅ | 1.34 ✅ | NNDC NuDat 3 / ENSDF |
| Cs-137 | 30 years | 30.08 y ✅ | 4.48 ✅ | NuDat 3 |
| Pu-239 | 24,000 years | 24,110 y ✅ | 7.38 ✅ | NuDat 3 |
| U-238 | 4.5 billion years, "age of the Earth" | 4.468×10⁹ y ✅ (Earth is 4.54×10⁹ y) | 12.65 ✅ | NuDat 3; Dalrymple, *The Age of the Earth* (1991) |
| Tick "a day" | | log₁₀(1/365.25)+3 = 0.44 ✅ | | |

## 7. Forces, the atom, radiation (`:94, 117–118, 470–471, 489`)

| Claim | Check | Source |
|---|---|---|
| Nucleus ~1/100,000 the width of the atom | ⚠️ see problem #7. Nuclear radius 1.2 fm × A^{1/3} (1.7–15 fm diameter) vs atomic diameter ~1–3.5 Å gives 1/10⁴ to 1/6×10⁴ | Krane §3.1 |
| Gravity ~10³⁶ times weaker than the electric force between two protons | Gm²/(ke²) = 8.1×10⁻³⁷, i.e. 1.2×10³⁶ ✅ | computed |
| Strong-force range ~10⁻¹⁵ m | ✅ ~1–2 fm | Krane §4 |
| Decay particle ~1 MeV; chemical bond a few eV; "tens of thousands" of molecules ionized | ✅ ~34 eV per ion pair in air means 1 MeV ≈ 3×10⁴ ionizations | ICRU Report 31 (W-value) |
| Crookes' spinthariscope, 1903 | ✅ | Encyclopaedia Britannica, "spinthariscope" |

## 8. Chain reaction (`:547–576`)

| Claim | Check | Source |
|---|---|---|
| Fissions per generation 1, 2, 3, 5, 9, 16, k ≈ 1.7 | ✅ Matches `fig-chain-reaction.tex` (seed 6). 16/9 = 1.78, (16)^{1/5} = 1.74 | `assets/gen/chain_reaction.py` |
| ~80 generations → ~10²⁴ | ❌ see problem #2. log₂(2.6×10²⁴) = 81, but at k = 1.7 it takes ≈ 104 | computed |
| ~10 ns per generation, so 80 generations < 1 µs | ✅ (1 "shake" = 10 ns). At 104 generations it's ~1 µs, so say "about a microsecond" | Serber, *The Los Alamos Primer* (1943/1992) |

## 9. Section 2 weapons numbers

| Claim | Where | Check | Source |
|---|---|---|---|
| ~12,000 warheads, nine countries; Russia 5,420, US 5,042, China 620, France 370, UK 225, India 190, Pakistan 170, Israel 90, North Korea 60, total ≈ 12,187 | `:633, 640–641` | ✅ matches the local snapshot exactly | FAS, *Status of World Nuclear Forces 2026* (https://fas.org/initiative/status-world-nuclear-forces/), saved as `assets/data/fas-status.html` (page modified 2026-06-09) |
| ~100 US B61 bombs in Europe | `:642` | ✅ FAS table: US deployed non-strategic = 100 | same |
| Trinity ≈ 25 kt | `:691` | ✅ 2021 reassessment: 24.8 ± 2 kt (older figure ~21 kt) | Selby et al., "A New Yield Assessment for the Trinity Nuclear Test, 75 Years Later", *Nuclear Technology* **207** (2021) |
| Trinity photo 0.016 s after detonation | `:687` | ✅ Berlyn Brixner's photo, captioned "0.016 s" | LANL photo archive |
| Fat Man ≈ 21 kt, Nagasaki 9 Aug 1945 | `:691` | ✅ | DOE/NV-209, *United States Nuclear Tests* |
| Hiroshima ~15 kt | `:730` | ⚠️ problem #4 | DOE, *The Manhattan Project: An Interactive History*; Rhodes 12.5 kt |
| Little Boy 64 kg HEU, < 1 kg fissioned | `:734` | ✅ | Coster-Mullen; §4 above |
| 70,000–140,000 killed by end of 1945 | `:734` | ⚠️ problem #5 | RERF FAQ ("How many people died…"); Rhodes PDF p. 771 |
| Castle Bravo 15 Mt, expected 6 Mt, lithium-7 | `:773, 777` | ✅ Predicted 6 Mt (range 4–8); unexpected Li-7 + n → T + α + n | DOE/NV-209; Hansen, *Swords of Armageddon* |
| Bravo = 1,000 Hiroshimas | `:773` | ✅ 15,000/15 | computed |
| Tsar Bomba 50 Mt, 30 Oct 1961, designed for 100 Mt, uranium tamper swapped for lead | `:792, 802–803` | ✅ (some sources say 57–58 Mt) | Adamsky & Smirnov, "Moscow's Biggest Bomb", *Cold War International History Project Bulletin* 4 (1994) |
| ≈ 3,300 Hiroshimas | `:795` | ✅ 50,000/15 = 3,333. With Rhodes' 12.5 kt it would be 4,000 | computed |
| Sakharov ~10,000 per megaton | `:803` | ⚠️ problem #6 | `materials/sgs01sakharov.pdf` |
| Peacekeeper carried 10 warheads | `:869` | ✅ 10 × W87 / Mk-21 | USAF LGM-118A fact sheet |
| Davy Crockett 1961–71, W54, 10–20 t, range 2–4 km | `:870–871` | ✅ M28 ~2 km, M29 ~4 km. W54 yield ~10–20 t | Hansen, *Swords of Armageddon*; US Army Ordnance Museum |
| "≈ 1/1000 of Hiroshima" | `:870` | ✅ 15 t / 15 kt | computed |

---

## Commented-out frames (not audited in depth)

- **CP-1** (`:578–615`): Rhodes' numbers are in `materials/rhodes.pdf`. "57th layer" is on PDF p. 462. "k of 1.0006" and "4.5 minutes at one-half watt" are on PDF p. 466. Use these if the frame comes back.
- **Enrichment** (`:648–661`): "90% for a bomb" ✅ (weapons-grade is ≥ 90% U-235; Little Boy averaged ~80%).
- **First-strike sim** (`:983–1004`): an illustrative model, not a factual claim.
- **Tests / stockpiles charts**: Our World in Data CSVs in `assets/data/`. "2,056 tests" matches the commonly cited total (CTBTO).

## Reproducing the nuclear numbers

```python
import periodictable as pt                     # pip install periodictable  (v2.1.0)
u, mH, mn = 931.49410242, 1.00782503223, 1.00866491595
B = lambda el, A: (el.number*mH + (A-el.number)*mn - el[A].mass) * u   # MeV
B(pt.W,184)/184        # 8.005  (slide has 7.930)
B(pt.Ba,141) + B(pt.Kr,92) - B(pt.U,235)   # 173.3 MeV
```
