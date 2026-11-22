# Source audit: X16580 slides (files + qualitative claims)

Written 2026-11-22. This is a companion to `audit.md`, which covers the **numbers**. This file covers:

- **Part A:** every file that ends up on a slide, and the human source behind it.
- **Part B:** every qualitative (non-numeric) claim on the active frames, with the source.
- **Part C:** corrections to `audit.md`.

Scope: only the active frames of `actual-content.tex` (Sections 1 and 2). Assets that only commented-out frames use are listed at the end of Part A.

**How each source was checked** (the "Checked" column):

| Tag | Meaning |
|---|---|
| **local** | I opened the file in this repo and confirmed the quote or value. I give PDF page numbers, which are what a PDF viewer shows; Rhodes' printed page numbers are offset by about 26 (printed p. 461 is PDF p. 487). |
| **web** | The page was fetched on 2026-11-22 and the quote confirmed. |
| **viewed** | I looked at the image and it shows what the slide says. |
| **regen** | I re-ran the generator in a scratch directory and the output was byte-identical. |
| **memory** | A standard reference I did *not* open. The citation is from memory, so check it before relying on it. |

Legend: ✅ fine · ⚠️ defensible, consider a tweak · ❌ wrong, fix it

---

## Summary of new problems

| # | Where | Issue | Suggested fix |
|---|---|---|---|
| A1 | `actual-content.tex:868` (MIRV note) | ❌ The note says the MIRV image is a "Peacekeeper test, reentry vehicles streaking into Kwajalein (long exposure)". `photos/mirv.jpg` is actually a **painted cutaway of the MX missile with red W87 reentry vehicles and a silo** (Commons `W87_MX_Missile_schematic.jpg`, from Hansen, *Swords of Armageddon*). | Change the note to "MX/Peacekeeper cutaway: ~10 W87 reentry vehicles under the nose shroud (DoD drawing, via Hansen)". Or fetch the Kwajalein photo if you want that image. |
| A2 | `:734` (Hiroshima deaths) | ❌ This is stronger than `audit.md` #5. Rhodes p. 777 (PDF) says "**70,000 died in Nagasaki** by the end of 1945 and 140,000 altogether", and Rhodes p. 771 gives 140,000 for **Hiroshima**. So "70,000–140,000" looks like Nagasaki's number mixed in as the low end. RERF gives 90,000–166,000 for Hiroshima within 2–4 months. | "~90,000–166,000 dead within months (RERF); Rhodes: 140,000 by the end of 1945" |
| A3 | `:786–787` (Tsar Bomba casing) | ⚠️ The caption says "The casing, now in a museum in Sarov", which implies the bomb that was dropped. Commons describes the object as a "body/mock-up of the RDS-202 (similar to AN602 'Tsar Bomba')". Wikipedia: "A Tsar Bomba-type casing on display". The real one was destroyed when it was dropped. | "A casing of the same type, Sarov museum." |
| A4 | `:709` (gun-type diagram) | ⚠️ The drawing fires a **solid** bullet into a **hollow** cup-shaped target. Little Boy did the reverse: a hollow cylinder (the "bullet") was fired onto a solid target. It's a public-level schematic either way, but the geometry is backwards. | Swap the shapes (hollow ring flies onto a solid slug), or leave it and call it generic. |
| A5 | `:480–483` + `photos/radiumdial.jpg` | ⚠️ The Commons page says this 1950s radium clock was photographed **under UV-A light**. The bright, even glow is mostly UV-excited zinc sulfide, not radioluminescence. Seventy-year-old radium dials glow only faintly, because the phosphor burns out. The slide text ("each tiny flash is one atom decaying") is correct. The photo just overstates the brightness. | Add "(photo lit with UV to show the paint)" to the note, or use a spinthariscope image. |
| A6 | `:258` vs `:282–286` | ⚠️ xkcd 1162 labels uranium **76,000,000 MJ/kg**, and the next slide says **8.2×10⁷**. The difference is ~185 vs ~200 MeV per fission. A sharp student will notice the two numbers. | One line in the note: "xkcd uses ~185 MeV/fission; we use 200 MeV." |
| A7 | Generated figures | ⚠️ `CLAUDE.md` says to regenerate figures from their scripts, but only `fig-chain-reaction.tex` (`gen/chain_reaction.py`) and the OWID charts (`make-charts.py`) have scripts in the repo. `fig-bignucleus`, `fig-halflife-sim`, `fig-fission-shrink` and `fig-world-map` have **no generator**, so their sources can't be re-derived. I checked their content by hand (Part A.3), and the world map's sites are recovered in A.4. | Either commit the generators, or update `CLAUDE.md` so these four are known to be hand-maintained. |
| A8 | `:417–418` (half-life) | ⚠️ The slide says each atom "decays at a random moment", but the figure removes **exactly** half at every step (64→32→16→8→4→2). Real decay halves only on average. | "After each half-life, **about** half of what's left is gone." |
| A9 | `:322` (isotopes) | ⚠️ "Chemically identical." This is true enough for uranium, which is the point: chemistry can't separate U-235, which is why enrichment is hard. Hydrogen, though, is the isotope pair on this very slide, and it's the biggest exception: heavy water has measurably different reaction rates and is mildly toxic in bulk. | "Chemically (almost) identical." |
| A10 | `:681` (implosion) | ⚠️ "A ball of plutonium, too spread out." The core is solid metal at normal density. Implosion **compresses** it, which raises the density so fewer neutrons escape. "Spread out" makes it sound like loose powder. | "A ball of plutonium, not dense enough." |
| A11 | `:768` (fusion) | ⚠️ "No upper limit on size" is right as "no *theoretical* limit": you can add stages, and Tsar Bomba was designed for 100 Mt. Real limits are weight and delivery. | "No theoretical upper limit." |
| A12 | `:642` (B61s in Europe) | ⚠️ The local FAS snapshot says "**100–120** B61 bombs … at six-seven bases in five-six countries (… and possibly the United Kingdom)". The note says "~100 … five countries". | "~100–120 … five countries, possibly also the UK (Lakenheath)". |
| A13 | `:777–778` (Castle Bravo) | ⚠️ The "expected 6 Mt" figure is in Wikipedia's lead, but the infobox there says **5 Mt**. Both figures circulate. Wikipedia also appears to mention later work questioning how much lithium-7 contributed. I couldn't read that part verbatim, so treat it as unconfirmed. | Fine as is. If asked: "predicted 5–6 Mt". |

---

## Part A: Files on the slides

### A.1 Images

| File | Slide (`actual-content.tex`) | What it is | Human source | License | Checked |
|---|---|---|---|---|---|
| `assets/smbc-2138-p2…p5.png` (cut from `smbc-2138.png`) | `:44–58` | p2 spear, p3 bow and arrow, p4 gun, p5 fusion bomb ✅ | Zach Weinersmith, *Saturday Morning Breakfast Cereal* #2138, https://www.smbc-comics.com/index.php?db=comics&id=2138 (credited on the slide) | © Weinersmith (classroom use) | viewed (full strip, plus p2 and p5) |
| `assets/xkcd-1162.png` | `:258` | xkcd 1162 "Log Scale" (fuel energy density, uranium off the chart) ✅. See A6. | Randall Munroe, https://xkcd.com/1162/ (credited on the slide) | CC BY-NC 2.5 (xkcd license) | viewed |
| `photos/cloudchamber-alt.jpg` | `:453–457` (left half only) | Expansion cloud chamber. Left: **alpha tracks from an Am-241 source**, with one beta track. Right (cropped off): Sr-90/Y-90 beta tracks. ✅ for "near a radioactive source" | https://commons.wikimedia.org/wiki/File:Particle_Tracks_in_AWAN_Expansion_Cloud_Chamber.jpg, by "Kebuk awan", 28 Sep 2021 | CC BY-SA 4.0: **needs attribution on the slide** | viewed + web. (Which file was saved is inferred from `fetch.sh`'s rule of "first JPEG hit"; the image matches the Commons description.) |
| `photos/radiumdial.jpg` | `:477` | A 1950s radium-dial clock (radium-226 + zinc sulfide), photographed under UV-A. See A5. | https://commons.wikimedia.org/wiki/File:Radium_Dial.jpg, by Arma95, 2010 | CC BY-SA 3.0 / GFDL: **needs attribution** | viewed + web |
| `photos/trinity.jpg` | `:686–687` | Trinity fireball 0.016 s after detonation, 16 July 1945 ✅ (matches the caption) | https://commons.wikimedia.org/wiki/File:Trinity_Test_Fireball_16ms.jpg. Berlyn Brixner / LANL, photo ID PA-98-0520 | Public domain (US gov) | viewed + web |
| `photos/hiroshima.jpg` | `:729–730` | Mushroom cloud over Hiroshima, 6 Aug 1945 ✅ (plate number "58189 A.C.") | https://commons.wikimedia.org/wiki/File:Atomic_cloud_over_Hiroshima.jpg. George R. Caron; NARA NAID 542192, https://catalog.archives.gov/id/542192 | Public domain (USAF) | viewed + web |
| `photos/castlebravo.jpg` | `:772–773` | Bravo, Bikini Atoll, 1 Mar 1954, 15 Mt ✅ | https://commons.wikimedia.org/wiki/File:Castle_Bravo_Blast.jpg. US DOE (no archive ID given) | Public domain (DOE) | viewed + web |
| `photos/tsarbomba-casing.jpg` | `:786–787` | Casing of the same type in the Sarov museum. See A3. | https://commons.wikimedia.org/wiki/File:Tsar_Bomba_Revised.jpg, by Croquant (edited by Hex) | CC BY-SA 3.0 / GFDL: **needs attribution** | viewed + web |
| `photos/tsarbomba.jpg` | `:788–789` | Tsar Bomba fireball, Novaya Zemlya, 30 Oct 1961 ✅ | https://commons.wikimedia.org/wiki/File:Tsar_Bomba_fireball_1961.jpg. Credited to the USSR Ministry of Medium Machine Building / Associated Press | **PD in the US only** ("PD-US-no notice"); may still be copyrighted elsewhere. This settles the `CLAUDE.md` license question for a US classroom. | viewed + web |
| `photos/minuteman.jpg` | `:813` | Minuteman **II** test launch (retired 1990s; today's missile is Minuteman III). Fine for "missiles in silos". | https://commons.wikimedia.org/wiki/File:LGM-30-Minuteman-II.jpg. USAF, 45th Space Wing | Public domain (USAF) | viewed + web |
| `photos/trident.jpg` | `:817` | Trident II (D5) underwater launch, 1989–2005 ✅ | https://commons.wikimedia.org/wiki/File:Trident_II_missile_image.jpg. Lockheed Martin / US Navy | Public domain (US military, per Commons) | viewed + web |
| `photos/b52.jpg` | `:821` | B-52, 307th Bomb Wing (Barksdale), 15 May 2014 ✅ | https://commons.wikimedia.org/wiki/File:B-52_Stratofortress_assigned_to_the_307th_Bomb_Wing_(cropped).jpg. A1C Victor J. Caputo, USAF | Public domain (USAF) | web (identified from the URL in `_search.txt`; not opened) |
| `photos/mirv.jpg` | `:856` | **MX/Peacekeeper cutaway drawing with W87 RVs.** See A1 (❌ the note describes a different image). | https://commons.wikimedia.org/wiki/File:W87_MX_Missile_schematic.jpg. DoD/DOE drawing, via Chuck Hansen, *The Swords of Armageddon* (1995) | Public domain (US military) | viewed + web |
| `photos/davycrockett.jpg` | `:862` | M388 Davy Crockett on its tripod launcher, Aberdeen Proving Ground, March 1961 ✅ | https://commons.wikimedia.org/wiki/File:DavyCrockettBomb.jpg. DoD photo, via Hansen | Public domain (US military) | viewed + web |
| `assets/logo.jpg` | template title page | CMU logo | Carnegie Mellon brand resources (yours) | CMU trademark | not checked |

Three images are CC BY-SA (cloud chamber, radium dial, Tsar Bomba casing) and need a credit line. `\src{}` already exists for this, e.g. `\src{Photo: Kebuk awan, CC BY-SA 4.0, Wikimedia Commons}`.

`photos/_search.txt` is slightly stale. It logs `tsarbomba-cloud.jpg <- Tsar_Bomba_Revised.jpg`, but `fetch.sh` now saves that file as `tsarbomba-casing.jpg`, and the image is the casing. For the search-based downloads (trinity, hiroshima, castlebravo, cloudchamber-alt), the log records the hit list but not which file was saved. The table above ties each one to its Commons page, so this file now serves as the record.

### A.2 Data files

| File | Used by | Human source | Checked |
|---|---|---|---|
| `data/fas-status.html` | Map totals, `:633, 640–643` | Hans M. Kristensen, Matt Korda, Eliana Johns and Mackenzie Knight-Boyle, "Status of World Nuclear Forces 2026", Federation of American Scientists, https://fas.org/initiative/status-world-nuclear-forces/. Quote: "nine countries possessed roughly 12,187 warheads as of the beginning of 2026". | local |
| `data/countries.geojson` | Map outlines | Natural Earth 1:110m Admin-0 countries (public domain), https://www.naturalearthdata.com/, fetched from the `nvkelso/natural-earth-vector` GitHub mirror | local (file present; source from `fetch.sh`) |
| `data/coords-{us,ru,other}.json` | Map markers | Wikipedia coordinates via the MediaWiki API (`fetch.sh` §3). 7 of 31 lookups returned no coordinates (Dombarovsky, Tatishchevo, Yurya, Yasny, Engels-2, Ukrainka, Yumen), so those markers were placed by hand. See A.4. | local |
| `data/owid-*.csv` | Commented-out Section 3 charts only | Our World in Data grapher, whose underlying data is FAS (Kristensen, Korda et al.) | regen |

### A.3 Generated figures (TikZ)

| File | Slide | Source / generator | What I verified |
|---|---|---|---|
| `fig-chain-reaction.tex` | `:551` | `gen/chain_reaction.py 6` | regen: byte-identical, prints `[1, 2, 3, 5, 9, 16]` ✅ |
| `fig-fission-shrink.tex` | `:237` | **no script in repo** | Counted: overlay 1 = 92 p + 143 n + 1 incoming n (U-235 + n). Overlay 2 = Ba 56 p + 85 n, Kr 36 p + 56 n, 3 free n. Matches Ba-141 + Kr-92 + 3n, "same 236 nucleons" ✅ |
| `fig-halflife-sim.tex` | `:414` | **no script** | 64 atoms; survivors 64→32→16→8→4→2, matching the counter at `:422` ✅ (but see A8) |
| `fig-bignucleus.tex` | `:125` | **no script** | 26 protons + 35 neutrons; repulsion lines from the edge proton to all 25 other protons ✅; strong-force lines only to its 3 neighbors ✅ |
| `fig-world-map.tex` | `:630` | **no script** | Markers recovered by inverting the Equal Earth projection (fit residual < 0.005 units ≈ 0.1°). See A.4. |
| Inline: binding-energy curve | `:197–205` | "AME2020, rounded". Wang et al., *Chinese Physics C* 45, 030003 (2021), table https://www-nds.iaea.org/amdc/ame2020/mass_1.mas20.txt | See `audit.md` §1 (one bad point, A = 184) |
| Inline: natural-uranium dots | `:328–338` | IUPAC/CIAAW abundance, 0.72% U-235 | Counted 7 orange dots out of 1,000 ✅ |
| Inline: valley-of-stability band | `:362–363` | Semi-empirical mass formula, Z = A / (1.98 + 0.0155 A^(2/3)); Krane, *Introductory Nuclear Physics* (1988) §3.3 (memory) | `audit.md` §5 |

### A.4 World-map sites (recovered from `fig-world-map.tex`)

These are the coordinates I recovered, matched to the named place. The 🔧 sites were placed by hand because the Wikipedia lookup returned nothing for them. Verify any marker against the FAS *Nuclear Notebook* for that country (Kristensen and Korda, *Bulletin of the Atomic Scientists*, yearly; memory).

| Leg | Recovered lat, lon | Site | Notes |
|---|---|---|---|
| US ICBM | 47.5, −111.3 / 48.3, −101.2 / 41.2, −104.9 | Malmstrom, Minot, F. E. Warren | ✅ Wikipedia coordinates |
| US SLBM | 47.8, −122.7 / 30.8, −81.7 | Kitsap-Bangor, Kings Bay | ✅ |
| US bomber | 48.3, −101.2 / 32.4, −93.6 / 38.8, −93.5 | Minot, Barksdale, Whiteman | ✅ |
| US B61 (Europe) 🔧 | 51.3, 5.7 · 51.6, 5.7 · 50.2, 7.4 · 46.0, 12.8 · 45.5, 10.4 · 37.1, 35.7 | Kleine Brogel (BE), Volkel (NL), Büchel (DE), Aviano (IT), Ghedi (IT), İncirlik (TR) | ✅ within ~0.3°. Lakenheath (UK) not shown (A12). |
| Russia ICBM | 54.1, 36.1 · 51.6, 45.8 🔧 · 57.0, 40.7 · 56.7, 48.3 · 59.1, 49.4 🔧 · 57.9, 60.2 · 54.9, 82.9 · 53.2, 83.8 · 52.4, 104.6 · 55.2, 90.0 · 51.0, 60.1 🔧 | Kozelsk, Tatishchevo, Teykovo, Yoshkar-Ola, Yurya, Nizhny Tagil, Novosibirsk, Barnaul, Irkutsk, Uzhur, Dombarovsky/Yasny | ✅ the 11 RVSN missile divisions, plotted at their garrison towns |
| Russia SLBM | 69.3, 33.8 / 53.0, 158.7 | Gadzhiyevo (Northern Fleet), Vilyuchinsk (Pacific) | ✅ |
| Russia bomber 🔧 | 51.5, 46.4 / 51.3, 129.0 | Engels-2, Ukrainka | ✅ |
| China ICBM | 40.2, 97.1 🔧 · 42.7, 93.9 · 39.7, 109.0 | Yumen, Hami, Hanggin Banner (Ordos) silo fields | ✅ Source: FAS reports on the new silo fields, 2021 (memory). China has other mobile-missile brigades and H-6N bombers that aren't shown. That's fine as long as the slide doesn't claim to be complete. |
| China SLBM | 18.2, 109.9 | Yulin (Hainan) | ✅ |
| UK SLBM | 56.1, −4.5 | HMNB Clyde (Faslane) | ✅ |
| France SLBM / aircraft | 48.3, −4.2 / 48.6, 4.9 · 43.4, 5.1 | Île Longue / Saint-Dizier, Istres | ✅ |
| "?" markers | 21.9, 79.1 · 29.0, 69.2 · 31.5, 35.2 · 40.4, 127.4 | Country placeholders for India, Pakistan, Israel, North Korea | ✅ as placeholders. They're not sites. |

### A.5 Not on the active slides

`photos/{littleboy,fatman,ivymike,cloudchamber-apparatus,schelling,berlin,cuba,arkhipov,petrov,wipp}.*`, `fig-tests.tex`, `fig-stockpiles.tex`, `sims/first-strike.html`, `assets/example.pdf`. Not audited, except that the OWID charts regenerate identically. If Section 3 comes back, note that the OWID stockpile series peaks at **64,452 in 1986**, but `slides.md` says "~70,000". The ~70,000 figure is the older Norris & Kristensen estimate (memory), so pick one.

---

## Part B: Qualitative claims (active frames)

| # | Line | Claim | Verdict | Human source |
|---|---|---|---|---|
| 1 | `:61` | A weapon releases a lot of energy, very quickly, into a small space | Framing, not a factual claim. It's the SMBC joke made serious. | — |
| 2 | `:91–93` | Nucleus of protons and neutrons; electrons far outside; nearly all the mass is in the nucleus | ✅ (>99.9%) | Krane §1–3 (memory); any intro physics text |
| 3 | `:94` | Pea in a football stadium | ⚠️ `audit.md` #7: the analogy is 1/10⁴ and the number is 1/10⁵ | Krane §3.1 (memory) |
| 4 | `:109–113` | Like charges repel; the strong force is much stronger but only reaches nearest neighbors | ✅ short range (~1 fm) and saturation | Krane ch. 4 (memory) |
| 5 | `:128–135` | An edge proton is pushed by every proton but glued only to its neighbors; the bigger the nucleus, the closer the tug-of-war | ✅ This is the liquid-drop picture: Coulomb energy grows ~Z², binding saturates ~A | Krane §3.3, semi-empirical mass formula (memory) |
| 6 | `:171–172` | Bound nucleons weigh less; the missing mass leaves as energy (E = mc²) | ✅ | Krane §3.3; He-4 numbers in `audit.md` §2 |
| 7 | `:176` (note) | Fusion powers the Sun | ✅ (the pp chain; net 4 ¹H → ⁴He) | Any astronomy text (memory) |
| 8 | `:213–222` | Fusion releases energy below iron, fission above; iron most tightly bound | ✅ / ⚠️ `audit.md` #9 (Ni-62) | AME2020 (local recompute in `audit.md`) |
| 9 | `:230` (note) | Chemical reactions are a few eV per bond; every conventional bomb is chemistry | ✅ | Any general-chemistry bond-energy table (memory) |
| 10 | `:239` | Same 236 nucleons, each weighing a little less | ✅ checked against the figure (A.3) | `audit.md` §3 |
| 11 | `:241–242` | A bomb does this ~10²⁴ times; Hiroshima added up is less than a paperclip | ✅ | `audit.md` §3 |
| 12 | `:319–322` | Isotopes: same element, different neutron count; chemically identical, nuclearly very different | ✅ / ⚠️ A9 | Krane §3 (memory) |
| 13 | `:343` | U-235 is "the kind that splits easily" | ✅ It fissions with slow neutrons; U-238 needs fast ones (>1 MeV) | Rhodes PDF p. 21 (the neutron has no charge, so it reaches the nucleus); Bohr–Wheeler 1939 is the classic source (memory) |
| 14 | `:366–377` | Too many neutrons/protons off the band; heavy nuclei need extra neutrons; nothing past Pb-208 is truly stable | ✅ | Krane §3.3; Bi-209 decay: de Marcillac et al., *Nature* 422, 876 (2003) (memory; the publisher page needs a login) |
| 15 | `:384–406` | α (helium nucleus) stopped by paper, β (electron) by aluminum, γ (light) by lead, neutrons by concrete | ✅ This is the standard textbook diagram. Strictly, lead attenuates gamma rather than stopping it all, and neutrons are best stopped by hydrogen-rich material (water, concrete). | US NRC, "Radiation Basics", https://www.nrc.gov/about-nrc/radiation/health-effects/radiation-basics.html (memory) |
| 16 | `:417–418` | Each atom decays at a random moment; after each half-life half is gone | ✅ / ⚠️ A8 | Rhodes PDF p. 41 (Rutherford–Soddy: half-lives of uranium 4.5 billion years, radium 1,620 years) (local) |
| 17 | `:437–443` | I-131 = fallout; Cs-137 = Chernobyl's soil; Pu-239 = bomb fuel; U-238 ≈ age of the Earth | ✅ | IAEA, *Chernobyl's Legacy* (Chernobyl Forum, 2005) for I-131 and Cs-137 (memory); U-238 = 4.5 billion years: Rhodes PDF p. 41 (local) |
| 18 | `:460–463` | Every cloud-chamber streak is one particle, a trail of thousands of smashed molecules | ✅ Very conservative: a ~5.5 MeV Am-241 alpha makes ~10⁵ ion pairs. "Smashed" means ionized. | ICRU Report 31 (W ≈ 34 eV per ion pair) (memory) |
| 19 | `:469` (note) | Supersaturated **alcohol** vapor condenses on ions | ⚠️ That's how a diffusion chamber works. The photo is from an **expansion** chamber, where an adiabatic expansion makes the vapor supersaturated. | Commons file page (web) |
| 20 | `:480–486` | Radium paint glows; each flash is one atom's alpha hitting a crystal | ✅ (ZnS scintillation) / ⚠️ the photo is UV-lit (A5) | Commons file page (web); Crookes' spinthariscope, 1903 (memory: Britannica "spinthariscope") |
| 21 | `:490–493` (note) | Radium Girls: "lip, dip, paint"; radium mimics calcium and goes to bone; lawsuits led to safety rules; deterministic vs. stochastic effects | ✅ | Kate Moore, *The Radium Girls* (2017); Claudia Clark, *Radium Girls* (1997); ICRP Publication 103 (2007) for deterministic vs. stochastic effects (all memory) |
| 22 | `:507–512` | A proton is pushed away; a neutron walks straight in | ✅ | Rhodes PDF p. 21: the neutron "had no electric charge" (local) |
| 23 | `:522–535` | n + U-235 → barium + krypton + 3 neutrons | ✅ One common channel. Hahn and Strassmann identified barium in 1938. | Rhodes, ch. 8–9 (memory for the chapter numbers) |
| 24 | `:559` | Some neutrons escape the lump; some are captured | ✅ | Serber, *Los Alamos Primer*, quoted in Rhodes PDF p. 487 (local) |
| 25 | `:633` | ~12,000 warheads, nine countries | ✅ | FAS 2026 (local) |
| 26 | `:643` (note) | Russian and Chinese sites marked at garrison towns, approximate | ✅ Matches A.4 | — |
| 27 | `:681–682` | Implosion: squeeze plutonium from every side → critical | ✅ / ⚠️ A10 | Rhodes PDF p. 492 (Neddermeyer and "implosion") and p. 341 (X-ray frames showing the core compressed) (local) |
| 28 | `:687` | Trinity, New Mexico, 16 July 1945, 0.016 s | ✅ | Commons / LANL PA-98-0520 (web) |
| 29 | `:691–692` (note) | Trinity was the first nuclear explosion, the same design as Fat Man; plutonium needs implosion because a gun is too slow | ✅ The reason: Pu-240 spontaneous fission would predetonate a gun design. That's why Thin Man was cancelled and Little Boy became "Thin Man's modest brother" (Rhodes PDF p. 579, local). Rhodes gives Fat Man **22 kt** (PDF p. 777), vs. 21 kt on the slide. | Hoddeson et al., *Critical Assembly* (1993), "the plutonium crisis" (memory) |
| 30 | `:724–725` | Gun: two subcritical pieces; fire one into the other → critical | ✅ / ⚠️ geometry reversed (A4) | Wikipedia "Little Boy": "fire a hollow cylinder (the 'bullet') … into a solid cylinder (the 'target')" (web) |
| 31 | `:730` | Hiroshima, 6 August 1945, ~15 kt | ✅ / ⚠️ `audit.md` #4. Wikipedia infobox: 13–16 kt. Rhodes: 12.5 kt (PDF pp. 510, 748, local). | — |
| 32 | `:734` (note) | 70,000–140,000 dead by the end of 1945 | ❌ A2 | Rhodes PDF pp. 771, 777 (local); RERF FAQ Q1, https://www.rerf.or.jp/en/faq/ (web) |
| 33 | `:765–768` | A fission bomb is the trigger; its radiation floods the case and crushes the fusion fuel; no upper limit | ✅ (Teller–Ulam, public-level) / ⚠️ A11 | Richard Rhodes, *Dark Sun* (1995) (memory); Wikipedia "Tsar Bomba": 100 Mt design (web) |
| 34 | `:773, 777–779` | Castle Bravo, Bikini, 1 Mar 1954, 15 Mt; expected 6; lithium-7 also reacted; fallout on Rongelap and the *Lucky Dragon No. 5* | ✅ / ⚠️ A13 | Commons (web); Wikipedia "Castle Bravo" (web); Ralph Lapp, *The Voyage of the Lucky Dragon* (1958) (memory); DOE/NV-209, *United States Nuclear Tests* (memory) |
| 35 | `:787` | "The casing, now in a museum in Sarov" | ⚠️ A3 | Commons (web) |
| 36 | `:789, 792` | Novaya Zemlya, 30 Oct 1961; 50 Mt | ✅ Wikipedia: 50 Mt per Soviet instruments; 58 Mt was the Western estimate until 1991. The Sakharov reprint uses 58. | Wikipedia "Tsar Bomba" (web); `materials/sgs01sakharov.pdf` p. 1 (local) |
| 37 | `:798` | Sakharov was one of its designers | ✅ | Andrei Sakharov, *Memoirs* (1990) (memory); Adamsky & Smirnov, *CWIHP Bulletin* 4 (1994) (memory) |
| 38 | `:802–804` (note) | Designed for 100 Mt; uranium tamper swapped for lead; Sakharov ~10,000 per Mt; later a dissident who pushed the test ban | ✅ / ⚠️ `audit.md` #6 ("deaths **and other health injuries**", confirmed verbatim, `sgs01sakharov.pdf` p. 1) | Wikipedia "Tsar Bomba" (web); Sakharov reprint (local) |
| 39 | `:814–822` | Triad: silo missiles, submarine missiles, bombers | ✅ | DoD, *Nuclear Matters Handbook 2020*, ch. 2 (memory); CRS report RL33640, *U.S. Strategic Nuclear Forces* (Amy Woolf) (memory) |
| 40 | `:838–848` | Subs survive a first strike; silos are targetable but fast and accurate; bombers are vulnerable on the ground, survivable airborne, and the only recallable leg; Trident D5 can threaten silos | ✅ | Same as #39 |
| 41 | `:858` | MIRV: one missile, many warheads, each to its own target | ✅ | Hansen, *Swords of Armageddon* (memory); image note ❌ A1 |
| 42 | `:864, 870–871` | Davy Crockett: small infantry crew, range a few km; 1961–71; W54 at 10–20 t; deployed in Europe | ✅ Wikipedia: M28 range 2.0 km, M29 4.0 km; "deployed with US Army forces from 1961 to 1971"; removed from US Army Europe in Aug 1967 | Wikipedia "Davy Crockett (nuclear device)" (web); Commons photo (web) |
| 43 | `:873` (note) | CIA, *Evolution of Soviet Concepts and Forces for Nuclear War in Europe* | ✅ The title matches. The report is dated **November 1974** (SR IR 74-4-S, released 2012), but the filename `1974-05-01.pdf` suggests May. | `materials/1974-05-01.pdf` p. 1 (local) |

---

## Part C: Corrections to `audit.md`

- **#5 (Hiroshima deaths):** upgrade ⚠️ → ❌, per A2. RERF's table is "acute deaths within two to four months", not "by the end of 1945". Hiroshima: 90,000–166,000; Nagasaki: 60,000–80,000 (web).
- **§9, Trinity ≈ 25 kt:** The 24.8 ± 2 kt reassessment is confirmed via Wikipedia's "Trinity (nuclear test)" article ("A re-analysis of data published in 2021 put the yield at 24.8 ± 2 kilotons"), but the Selby et al. citation itself (journal and DOI) was **not** confirmed.
- **§2, IAU 2015 B3:** confirmed via Wikipedia "Solar luminosity" (3.828×10²⁶ W, citing https://www.iau.org/static/resolutions/IAU2015_English.pdf).
- **§9, Fat Man ≈ 21 kt:** Rhodes says 22 kt (PDF p. 777). Either is fine; just know the course reading differs.
- **Rhodes page numbers in `audit.md`** (487, 510, 748, 771, 462, 466) are **PDF** pages. All were re-confirmed verbatim.
