---
title: Advanced Cannabis Breeding
description: A scientific deep-dive into cannabis breeding — Mendelian inheritance patterns, chemotype genetics, Punnett square predictions for key traits, S1 protocols, terpene inheritance, statistical pheno-hunt design, and cannabinoid biosynthesis pathways�
tags: genetics, advanced-breeding, mendelian, inheritance, chemotype, S1, terpene-genetics, pheno-hunt, cannabinoid-synthesis
---

> **DISCLAIMER:** Cannabis breeding and cultivation are illegal in many jurisdictions. This content is provided for educational purposes only. Always research and comply with your local laws and regulations. This is not medical or professional breeding advice.

# Advanced Cannabis Breeding

This page provides a scientific deep-dive into cannabis breeding genetics. Where [Breeding Techniques](/genetics/breeding) covers the practical methodology — selective breeding, backcrossing, stabilization, and generation management — this page focuses on the underlying genetics that govern trait inheritance, with quantitative tools for predicting offspring outcomes.

> **Prerequisite:** This page assumes familiarity with the generational framework (P, F1, F2, IBL), backcrossing methodology, and reversed female techniques covered in the [Breeding Techniques](/genetics/breeding) page.

---

## Mendelian Inheritance in Cannabis

Cannabis is a diploid organism with 10 chromosome pairs (2n = 20). Most traits are governed by Mendelian inheritance patterns — the same principles Gregor Mendel established with pea plants in the 1860s, which remain the foundation of plant genetics.

### Dominant vs. Recessive Alleles

Each gene exists in variant forms called alleles. An individual inherits one allele from each parent at every gene locus. The interaction between these alleles determines trait expression.

| Term | Definition | Cannabis Example |
|------|-----------|-----------------|
| **Dominant allele** | Expressed when present in just one copy (heterozygous) | Early flowering may be dominant in some lineages |
| **Recessive allele** | Only expressed when both copies are the same recessive allele | Autoflowering is recessive to photoperiod dependence |
| **Homozygous** | Both alleles at a locus are identical (AA or aa) | IBL plants are homozygous at most loci |
| **Heterozygous** | Alleles at a locus differ (Aa) | F1 hybrids are heterozygous at loci where parents differ |
| **Co-dominant** | Both alleles are partially expressed | Some cannabinoid synthase alleles show co-dominance |

### Predicting Offspring with Punnett Squares

For single-gene traits, Punnett squares provide exact probability predictions for offspring genotypes and phenotypes.

**Example: Autoflowering (recessive) × Photoperiod (dominant)**

Let *A* = photoperiod (dominant) and *a* = autoflowering (recessive).

| | **A** (photoperiod parent) | **A** (photoperiod parent) |
|---|---|---|
| **a** (auto parent) | Aa (photoperiod) | Aa (photoperiod) |
| **a** (auto parent) | Aa (photoperiod) | Aa (photoperiod) |

**Result:** 100% of F1 offspring are heterozygous photoperiod carriers (Aa). None will autoflower, but all carry the auto gene.

**F2 cross: Aa × Aa**

| | **A** | **a** |
|---|---|---|
| **A** | AA (photoperiod) | Aa (photoperiod carrier) |
| **a** | Aa (photoperiod carrier) | aa (autoflowering) |

**Result:** 75% photoperiod (AA or Aa), 25% autoflowering (aa). Of the photoperiod plants, 2/3 are heterozygous carriers (Aa) and 1/3 are homozygous (AA).

> **Practical application:** In an F2 population of 100 plants from this cross, expect approximately 25 autoflowering individuals. To find a high-quality auto plant, you must grow enough F2 individuals to find both the auto trait (25%) AND the other desirable traits (structure, potency, yield) in the same plant. This is why large F2 populations are essential.

### Multi-Gene Inheritance

Many important cannabis traits are **polygenic** — controlled by multiple genes rather than a single locus. These traits show continuous variation (a spectrum) rather than discrete categories.

| Trait | Inheritance Pattern | Genes Involved | Predictability |
|-------|-------------------|---------------|---------------|
| **Autoflowering** | Single-gene recessive | 1 major locus (putative) | High — Mendelian |
| **Chemotype (THC vs. CBD)** | Single-gene co-dominant | 1 locus (THCAS/CBDAS alleles) | High — Mendelian |
| **Plant height** | Polygenic | 10+ loci | Low — continuous variation |
| **Flowering time** (within photoperiod) | Polygenic | 5-10+ loci | Moderate — can select early finishers |
| **THC potency** | Polygenic | 5+ loci + environmental | Moderate |
| **Terpene profile** | Polygenic | 30+ terpene synthase genes | Low — complex interactions |
| **Yield** | Polygenic | 20+ loci + environment | Low — heavily environment-dependent |
| **Disease resistance** | Oligogenic to polygenic | 3-10+ loci depending on pathogen | Moderate |

> **Breeding implication:** Single-gene traits can be predicted and selected with high accuracy using Punnett squares. Polygenic traits require population-level selection across multiple generations. The more genes involved, the larger the population needed to find exceptional individuals.

---

## Chemotype Genetics: The THC/CBD Locus

The most economically significant single-gene trait in cannabis is the chemotype — whether a plant produces predominantly THC, predominantly CBD, or a balanced ratio of both.

### The Bt Locus

Research by Onofri et al. (2015) and van Bakel et al. (2011) identified a single genetic locus on chromosome 7 that governs the primary chemotype. This locus contains two closely linked genes:

- **THCAS** (tetrahydrocannabinolic acid synthase) — converts CBGA into THCA
- **CBDAS** (cannabidiolic acid synthase) — converts CBGA into CBDA

These genes are allelic variants at the same locus, meaning a plant inherits one allele from each parent.

### Chemotype Inheritance

| Genotype | Enzyme Produced | Chemotype | Ratio |
|----------|---------------|-----------|-------|
| **Bt/Bt** (THCAS/THCAS) | THCA synthase only | Type I (THC-dominant) | THC:CBD > 10:1 |
| **Bt/Bd** (THCAS/CBDAS) | Both synthases | Type II (mixed) | THC:CBD ≈ 1:1 |
| **Bd/Bd** (CBDAS/CBDAS) | CBDAS synthase only | Type III (CBD-dominant) | CBD:THC > 10:1 |

This follows a **co-dominant** inheritance pattern — the heterozygote (Bt/Bd) expresses both enzymes simultaneously, producing a balanced THC:CBD profile.

### Predicting Chemotype Crosses

**Cross 1: THC-dominant × CBD-dominant**

| | **Bt** (THC parent) | **Bt** (THC parent) |
|---|---|---|
| **Bd** (CBD parent) | Bt/Bd (Type II, balanced) | Bt/Bd (Type II, balanced) |
| **Bd** (CBD parent) | Bt/Bd (Type II, balanced) | Bt/Bd (Type II, balanced) |

**Result:** 100% Type II (balanced THC:CBD). This is why the first cross of a high-THC strain with a high-CBD strain always produces balanced offspring.

**Cross 2: Type II × Type II (balanced × balanced)**

| | **Bt** | **Bd** |
|---|---|---|
| **Bt** | Bt/Bt (Type I, THC) | Bt/Bd (Type II, balanced) |
| **Bd** | Bt/Bd (Type II, balanced) | Bd/Bd (Type III, CBD) |

**Result:** 25% Type I (THC-dominant), 50% Type II (balanced), 25% Type III (CBD-dominant).

> **Practical application:** If you are breeding for CBD-dominant cultivars, cross two Type II plants and screen the F2 population. Approximately 25% of offspring will be Type III. Test them with HPLC to confirm the CBD:THC ratio. See [Cannabinoids](/science/cannabinoids) for detailed cannabinoid profiles.

### Beyond THC and CBD: Minor Cannabinoid Genetics

The Bt locus controls the primary THC/CBD ratio, but additional synthase genes govern minor cannabinoids:

| Cannabinoid | Synthase Gene | Chromosome | Notes |
|-------------|--------------|------------|-------|
| **CBG** | CBGAS (absence of THCAS/CBDAS activity) | 7 | CBGA accumulates when downstream synthases are absent or non-functional |
| **THCV** | THCVAS (variant of THCAS) | 7 | Requires divarinyl-CoA precursor instead of geranyl-CoA |
| **CBDV** | CBDAS acting on divarinyl-CoA | 7 | Propyl variant of CBD |
| **CBC** | CBCAS | Unknown | Cannabichromenic acid synthase; distinct from THCAS/CBDAS |
| **CBN** | Oxidation of THC (not enzymatic) | N/A | Degradation product, not directly synthesized |

**Breeding for elevated CBG:** Select plants where THCAS and CBDAS activity is reduced or absent. CBGA (the precursor) accumulates in these plants, resulting in CBG-dominant chemotypes. This is a recessive trait — both alleles must be non-functional for high CBG expression.

---

## S1 Creation Protocol

An S1 (selfed first generation) is produced when a female plant is reversed and used to pollinate itself. The result is a seed line that carries only the genetics of the single parent plant — essentially a genetic "backup" of an exceptional individual.

### The Genetics of S1

When a heterozygous plant (Aa) is selfed:

| | **A** | **a** |
|---|---|---|
| **A** | AA | Aa |
| **a** | Aa | aa |

The S1 population shows the same 1:2:1 genotypic ratio as an F2 cross. However, because all genetics come from a single parent, the S1 population is more predictable than an F2 — there is no second parent introducing unknown variation.

### When to Create S1 Seeds

| Scenario | Recommendation |
|----------|---------------|
| **Exceptional female that cannot be cloned** | Create S1 as genetic insurance |
| **Elite mother plant for seed production** | S1 allows seed-based propagation of clonal genetics |
| **Rapid trait fixation** | S1 is the fastest way to homozygosity from a single individual |
| **Preserving a breeder's key plant** | S1 + proper storage = long-term genetic preservation |

### S1 Creation Step-by-Step

**Step 1: Select the Mother Plant**

Choose an elite female that excels in all target traits. This plant's entire genome will be the sole genetic source for the S1 line. Verify:
- Exceptional potency (HPLC-confirmed cannabinoid profile)
- Strong terpene expression (GC-MS or confirmed organoleptic)
- Desirable structure and growth pattern
- Disease resistance under cultivation conditions
- Stable flowering time

**Step 2: Pre-Flowering Preparation**

Move the plant to a dedicated, isolated space. Remove any existing males or pollen sources. The reversal process requires the plant to be in early flowering (7-14 days after 12/12 switch).

**Step 3: Reversal Treatment**

Two proven methods:

| Method | Protocol | Effectiveness | Notes |
|--------|----------|--------------|-------|
| **Colloidal Silver (CS)** | Spray selected branch with 30-50 ppm CS daily for 10-21 days. Cover the rest of the plant to prevent contamination. | 70-90% | Accessible; CS generators cost $30-60. |
| **Silver Thiosulfate (STS)** | Prepare STS solution (silver nitrate + sodium thiosulfate). Spray selected branch every 3-4 days for 2-3 applications. | 90-99% | Preferred by professional breeders; more reliable than CS. Requires chemical handling safety protocols. |

> **Safety:** Never consume flower from the reversed branch or any part of a plant treated with CS or STS. Silver compounds are not safe for consumption. Use the pollen only for pollinating a separate, untreated female plant — or for S1 creation where the pollen is used on other branches of the same plant (untreated branches only).

**Step 4: Pollen Collection**

Male flowers (pollen sacs) develop on the reversed branch after 2-4 weeks of treatment. Collect pollen as described in [Breeding Techniques](/genetics/breeding) — tap sacs onto clean paper, dry for 12-24 hours, store with desiccant.

**Step 5: Self-Pollination**

Apply the collected pollen to receptive pistils on **untreated** branches of the same plant. Use a small brush or cotton swab for targeted application. Bag the pollinated branch to prevent contamination.

**Step 6: Seed Harvest**

Seeds mature in 4-6 weeks after pollination. Harvest when calyxes begin to dry and split. Dry seeds for 1-2 weeks in a cool, dark environment before storage.

**Step 7: S1 Grow-Out and Selection**

Grow 20-50 S1 seeds. Expect variation similar to F2 — some plants will closely resemble the mother, others will diverge. Select the individuals that best express the mother's traits for continued S1 breeding or for use as the new stable line.

### S1 vs. IBL: Understanding the Difference

| Aspect | S1 | IBL (Inbred Line) |
|--------|----|--------------------|
| **Genetic source** | Single parent | Two parents stabilized over 6+ generations |
| **Homozygosity** | Moderate (25% new homozygosity per generation) | High (approaching 99% homozygous) |
| **Variation in offspring** | High — similar to F2 | Very low — breeds true |
| **Generations to stability** | Still requires 4-6 more generations of sibling crosses | Already stable |
| **Use case** | Genetic preservation of a single plant; starting point for new IBL | Finished, reliable cultivar for seed production |

---

## Terpene Inheritance Genetics

Terpene profiles are among the most complex traits to breed for because they involve dozens of genes working in concert.

### Terpene Synthase Genes

Each major terpene is produced by a specific synthase enzyme. The genes encoding these enzymes are inherited independently, creating combinatorial complexity.

| Terpene | Primary Synthase | Inheritance Notes |
|---------|-----------------|------------------|
| **Myrcene** | Myrcene synthase (multiple genes) | Often dominant; high expression in many landraces |
| **Limonene** | Limonene synthase | Moderately heritable; expression varies with environment |
| **Caryophyllene** | Caryophyllene synthase | Strongly heritable; stable across environments |
| **Pinene** | Pinene synthase (alpha and beta variants) | Two separate genes; can be inherited independently |
| **Terpinolene** | Terpinolene synthase | Often recessive; high-expression plants are valuable breeding stock |
| **Linalool** | Linalool synthase | Moderate heritability; environmentally sensitive |
| **Humulene** | Humulene synthase | Co-inherited with caryophyllene in some lineages |
| **Ocimene** | Ocimene synthase | Variable expression; heat-sensitive |

Research by Flockhart et al. (2020) and Grassa et al. (2021) identified over 100 terpene synthase and related genes in the cannabis genome. The combinatorial possibilities are enormous.

### Predicting Terpene Inheritance

Unlike single-gene traits, terpene profiles cannot be predicted with Punnett squares. Instead, breeders use **phenotypic correlation** — tracking which parent combinations produce offspring with desired terpene profiles.

**General principles:**

1. **Additive inheritance:** Most terpene levels show additive inheritance — offspring terpene levels are roughly the average of the two parents. Crossing a high-myrcene plant with a low-myrcene plant typically produces intermediate offspring.

2. **Epistatic interactions:** Some terpene genes interact with each other. For example, the presence of certain limonene synthase alleles may suppress or enhance terpinolene expression.

3. **Environmental modulation:** Terpene expression is highly sensitive to temperature, humidity, light spectrum, and harvest timing. A genotype that produces high terpinolene at 68°F may produce significantly less at 80°F. This means terpene-based selection must be performed under consistent, documented conditions.

**Practical breeding approach:**

| Step | Action |
|------|--------|
| 1 | GC-MS test both parent candidates for full terpene profiles |
| 2 | Cross and grow F2 population (50-100+ plants) |
| 3 | GC-MS test F2 plants at harvest |
| 4 | Select F2 individuals with terpene profiles exceeding both parents (transgressive segregation) |
| 5 | Intercross selected F2 plants and repeat selection in F3-F5 |

> **Transgressive segregation** occurs when offspring express trait values beyond the range of either parent. This is common in polygenic traits and is the mechanism by which breeders create plants with higher terpene levels, greater potency, or better yields than either parent.

---

## Statistical Pheno-Hunt Design

A serious pheno-hunt requires statistical rigor — not just growing seeds and picking the best-looking plant. This section covers how to design a pheno-hunt that produces reliable, reproducible results.

### Population Size Calculations

The probability of finding a plant with a specific trait combination depends on the frequency of each trait in the population.

For independent traits, the probability of finding an individual with **all** desired traits is the product of individual trait frequencies:

```
P(all traits) = P(trait 1) × P(trait 2) × P(trait 3) × ...
```

**Example:** You are hunting for an F2 plant that is:
- Autoflowering (25% of F2 = 0.25)
- Type III CBD-dominant (25% of F2 = 0.25)
- Compact structure (estimated 50% = 0.50)
- High terpene expression (estimated 25% = 0.25)

```
P(all 4 traits) = 0.25 × 0.25 × 0.50 × 0.25 = 0.0078 = 0.78%
```

To have a 95% probability of finding at least one plant with all four traits:

```
N = log(1 - 0.95) / log(1 - 0.0078) = log(0.05) / log(0.9922) ≈ 383 plants
```

> **Implication:** Finding an F2 individual that combines four specific traits may require growing 383+ plants. This is why serious breeding programs require significant space and resources.

### Experimental Design for Pheno-Hunts

| Design Element | Recommendation |
|---------------|---------------|
| **Randomization** | Randomize plant positions within the grow space to eliminate location bias |
| **Replication** | Include known control plants (parents) in every run to verify environmental consistency |
| **Blind evaluation** | Evaluate plants without knowing their lineage to prevent confirmation bias |
| **Standardized conditions** | Maintain consistent VPD, PPFD, nutrient schedule, and photoperiod across the entire population |
| **Sample size** | Minimum 50 plants for simple trait combinations; 200+ for complex multi-trait hunts |
| **Culling threshold** | Pre-define culling criteria before the grow begins; do not change standards mid-hunt |

### Data Collection Protocol

| Stage | Data Points | Tools |
|-------|------------|-------|
| **Germination** | Date, rate, vigor | Calendar, visual scoring (1-5) |
| **Vegetative (weekly)** | Height, node count, internodal spacing, leaf morphology | Ruler, calipers, photos |
| **Pre-flower** | Sex, pre-flower structure, early terpene expression (leaf crush test) | Loupe (30x+), organoleptic assessment |
| **Flowering (weekly)** | Stretch factor, bud site count, resin production, pest/disease incidents | Scale, photos, incident log |
| **Harvest** | Wet weight, dry weight, flowering time (days from 12/12) | Scale, calendar |
| **Post-harvest** | HPLC cannabinoid profile, GC-MS terpene profile, cure quality, organoleptic assessment | Lab testing, standardized evaluation form |

---

## Cannabinoid Biosynthesis Pathways for Breeders

Understanding the biochemical pathway of cannabinoid production enables breeders to make informed parent selection decisions.

### The Pathway

```
Olivetolic Acid (OA) + Geranyl Pyrophosphate (GPP)
         ↓ (PT enzyme: prenyltransferase)
    CBGA (cannabigerolic acid) — the "mother cannabinoid"
         ↓
    ┌──────────────┬──────────────┬──────────────┐
    ↓              ↓              ↓              ↓
  THCA           CBDA           CBCA           CBGA
 (THCAS)        (CBDAS)        (CBCAS)       (accumulates
    ↓              ↓              ↓             if no
  THC            CBD            CBC           downstream
                                                   synthase)
```

### Breeding Implications

**CBG-dominant plants:** Occur when CBGA is not converted by downstream synthases. This happens when both THCAS and CBDAS alleles are non-functional at the Bt locus. To breed for high CBG:
1. Cross two Type II (balanced) plants
2. Screen F2 for plants with elevated CBG
3. These plants carry non-functional alleles at the Bt locus
4. Intercross high-CBG F2 plants to fix the trait

**THCV breeding:** THCV requires the propyl precursor (divarinyl-CoA) instead of the pentyl precursor (geranyl-CoA). The genes controlling precursor availability are separate from the Bt locus. THCV expression is found in African landrace genetics (particularly South African and Ethiopian varieties). To breed for THCV:
1. Source African landrace genetics with confirmed THCV expression
2. Cross with a target cultivar
3. Screen F2 for propyl cannabinoid expression
4. This is a multi-gene trait requiring significant population sizes

**The entourage effect in breeding:** Plants that produce diverse minor cannabinoids (CBC, CBG, THCV, CBDV) alongside primary THC or CBD may offer enhanced therapeutic profiles. Selecting for minor cannabinoid expression alongside primary chemotype is an advanced breeding goal that requires HPLC screening of large populations.

For detailed cannabinoid chemistry, see [Cannabinoids](/science/cannabinoids).

---

## Sex Determination Genetics

Cannabis sex determination is a complex trait influenced by both genetics and environment. Understanding the genetic basis helps breeders control sex ratios in offspring.

### Genetic Sex Determinangement

Recent research (Grassa et al., 2021; Toth et al., 2020) identified sex-linked regions on the cannabis genome:

- **M locus:** A male-determining region on chromosome 1 that is present in males (XY) but absent or modified in females (XX)
- **Female-hemizygous region:** Females carry two X chromosomes with specific markers

| Genotype | Sex | Notes |
|----------|-----|-------|
| **XX** | Female | Standard female; produces pistils only |
| **XY** | Male | Standard male; produces pollen sacs |
| **XX (reversed)** | Male flowers on female plant | Chemical reversal (CS/STS); pollen carries only X chromosomes |
| **XXY / anomalies** | Hermaphroditic | Chromosomal anomalies; rare but occur naturally under stress |

### Breeding Implications

**Feminized seeds (XX × XX):** When a reversed female (XX) pollinates a normal female (XX), all offspring are XX = female. The sex ratio is effectively 99%+ female, with the small error rate due to environmental hermaphroditism rather than genetic sex determination.

**Regular seeds (XY × XX):** A normal male (XY) crossed with a normal female (XX) produces approximately 50% XX (female) and 50% XY (male) offspring.

**Selecting for female prevalence:** Some breeding lines show a slight bias toward female offspring (55-60% female). While the mechanism is not fully understood, selecting mothers and fathers from lines that consistently produce female-biased sex ratios may incrementally improve the female percentage over generations.

---

## Breeding for Environmental Adaptation

Breeding plants adapted to specific growing conditions is one of the most impactful contributions a breeder can make.

### Trait-Environment Mapping

| Target Environment | Key Traits to Select For | Breeding Strategy |
|-------------------|------------------------|-------------------|
| **Northern outdoor** (short season, cool nights) | Early finish (55-65 days), cold tolerance, mold resistance | Source genetics from Canada, northern US, or high-altitude landraces; select earliest finishers each generation |
| **Hot/dry outdoor** | Drought tolerance, heat resilience, UV protection (high resin) | Source from Middle Eastern, African, or Central Asian landraces; select for survival under water stress |
| **High humidity** | Botrytis resistance, open bud structure, powdery mildew resistance | Source from equatorial landraces (Southeast Asian sativas); select plants with loose bud structure and no PM incidence |
| **Indoor tent** (limited height) | Compact structure, short internodes, minimal stretch | Select shortest, most compact plants each generation; cross with known compact genetics |
| **Greenhouse** (light deprivation) | Flexible photoperiod response, consistent flowering under variable light | Select plants that flower reliably under non-ideal light conditions |

### Cold Tolerance Genetics

Cold tolerance is a polygenic trait involving:
- Membrane lipid composition (more unsaturated fatty acids = better cold tolerance)
- Antifreeze protein production
- Cold-responsive gene expression (CBF/DREB pathway)

**Breeding protocol:**
1. Grow F2 population under cold stress (nighttime temps of 50-55°F / 10-13°C)
2. Score each plant for cold damage (leaf purpling, necrosis, growth cessation)
3. Select the top 10% of cold-tolerant plants
4. Intercross selected plants and repeat cold stress in the next generation
5. After 3-4 generations of cold-stress selection, the line shows significantly improved cold tolerance

### Mold Resistance Genetics

Botrytis (bud rot) and powdery mildew resistance are among the most valuable traits to breed for, particularly for outdoor and greenhouse growers.

**Botrytis resistance** is associated with:
- Open, loose bud structure (allows airflow within the cola)
- Thinner calyx walls
- Faster drying after rain or dew
- Chemical resistance (antifungal compounds in resin)

**Powdery mildew resistance** is associated with:
- Thicker leaf cuticle
- Chemical resistance compounds in leaf surface
- Faster leaf surface drying

**Breeding protocol:**
1. Grow a diverse F2 population in conditions favorable to the target pathogen (high humidity for botrytis; moderate humidity and poor airflow for PM)
2. Do not treat — let the plants' natural resistance determine survival
3. Select surviving plants with minimal disease symptoms
4. Intercross resistant plants and repeat the disease-pressure selection
5. After 3-4 generations, the line shows significantly improved resistance

---

## Record-Keeping and Data Management

The single greatest predictor of breeding success is the quality of record-keeping.

### Minimum Data Set for Each Plant

| Data Point | Format | When Recorded |
|------------|--------|--------------|
| **Unique ID** | e.g., "F2-023" | Germination |
| **Lineage** | e.g., "(OGK × SD) F1-007 × (OGK × SD) F1-012" | Germination |
| **Germination date** | YYYY-MM-DD | Germination |
| **Sex** | M/F/H | Pre-flower (week 3-4 of veg or week 1-2 of flower) |
| **Flowering start date** | YYYY-MM-DD | 12/12 switch |
| **Harvest date** | YYYY-MM-DD | Harvest |
| **Flowering time** | Days (calculated) | Post-harvest |
| **Wet weight** | Grams | Harvest |
| **Dry weight** | Grams | Post-dry |
| **HPLC results** | THC%, CBD%, CBG%, CBN% | Post-harvest |
| **GC-MS results** | Top 5 terpenes with % | Post-harvest |
| **Disease incidents** | PM/Botrytis/other + severity score | Throughout grow |
| **Subjective scores** | Aroma (1-10), Effect (1-10), Structure (1-10) | Post-harvest |
| **Keeper status** | Keep/Cull/Maybe | Post-evaluation |
| **Notes** | Free text | Throughout grow |

### Pedigree Tracking

Every cross should be recorded in standard notation:

```
Cross notation: Female × Male
Example: (OGK × SD)F2-007 × (GSC × TA)F1-003

This reads as:
  Female parent: F2 individual #007 from OG Kush × Sour Diesel cross
  Male parent:  F1 individual #003 from Girl Scout Cookies × Tangie cross
```

> **Rule:** Never make a cross without writing it down immediately. Pollen looks identical regardless of source. Unlabeled pollen or unrecorded crosses are irrecoverable losses of breeding data.

---

## Related Pages

- **[Breeding Techniques](/genetics/breeding)** — Practical methodology: selective breeding, backcrossing, stabilization, generations, polyhybrids, reversed females
- **[Genetics Basics](/genetics/basics)** — Genotype vs. phenotype, chromosomes, subspecies, chemotypes
- **[Seeds](/genetics/seeds)** — Seed types, germination, storage
- **[Autoflower vs. Photoperiod](/genetics/autoflower-vs-photoperiod)** — Genetics and cultivation differences
- **[Cannabinoids](/science/cannabinoids)** — Cannabinoid biosynthesis, profiles, and effects
- **[Terpenes](/science/terpenes)** — Terpene profiles and analytical methods
- **[Strains Database](/strains/index)** — Reference for existing cultivar characteristics

---

> **See Also:** [/genetics/breeding](/genetics/breeding) | [/genetics/basics](/genetics/basics) | [/genetics/seeds](/genetics/seeds) | [/science/cannabinoids](/science/cannabinoids) | [/science/terpenes](/science/terpenes) | [/strains](/strains/index)