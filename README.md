# 🌿 CannaGrow

> **A Comprehensive, Neutral, Educational Cannabis Encyclopedia**

CannaGrow is a production-ready [Wiki.js](https://js.wiki/) wiki project covering every aspect of cannabis — from ancient history to modern cultivation, strain genetics, extraction science, consumption methods, and legal landscapes.

---

## 📋 Project Overview

This project contains **286 fully-written wiki pages** organized into a complete, deployable wiki structure. Every page is written in Wiki.js-compatible Markdown with:

- **YAML front matter** (title, description, tags)
- **Admonitions** (info, warning, danger, tip boxes)
- **Comparison tables** and data tables
- **Internal cross-links** between related pages
- **Image placeholders** ready for real images
- **Legal and safety disclaimers** throughout
- **Neutral, educational tone** — never promotional

---

## 📁 Project Structure

```
CannaGrow/
├── README.md                  ← You are here
├── IMPORT-GUIDE.md            ← How to deploy this wiki
├── home.md                    ← Homepage
├── about.md                   ← About CannaGrow
├── science/
│   ├── index.md               ← Science of Cannabis overview
│   ├── cannabinoids.md        ← Cannabinoid chemistry
│   ├── terpenes.md            ← Terpene biochemistry & entourage effect
│   └── decarboxylation.md     ← Decarbing flower & concentrates
│   └── bro-science.md         ← Debunking cannabis myths with science
│
├── sustainability/
│   ├── index.md               ← Sustainability overview
│   ├── eco-friendly-cultivation.md ← Green growing practices
│   └── environmental-impact.md ← Industry footprint analysis
│
├── setup/
│   ├── docker-compose.yml             ← One-click Wiki.js deployment
│   ├── CONFIGURATION.md               ← Site settings, CSS, navigation
│   ├── SITE-MAP.md                    ← Complete page hierarchy (286 pages)
│   └── PORTAINER-DEPLOYMENT.md        ← Step-by-step Portainer deployment guide
│
├── about/
│   ├── how-to-use.md          ← How to navigate this wiki
│   └── editorial.md           ← Content standards for contributors
│
├── history/
│   ├── index.md               ← History overview
│   ├── ancient/
│   │   └── origins.md         ← Ancient Origins (8000 BCE+)
│   ├── medieval.md            ← Cannabis in the Medieval World
│   ├── prohibition/
│   │   ├── prohibition-era.md ← The Prohibition Era (1900s-1960s)
│   │   └── war-on-drugs.md    ← The War on Drugs (1970s-2000s)
│   └── modern/
│       └── legalization.md    ← Modern Legalization & Renaissance
│
├── cultivation/
│   ├── index.md               ← Cultivation overview
│   ├── indoor/
│   │   ├── index.md           ← Indoor growing guide
│   │   ├── lighting.md        ← HID, LED, CMH comparison
│   │   ├── environment.md     ← Temp, humidity, VPD, CO₂
│   │   └── hydroponics.md     ← DWC, ebb & flow, aeroponics
│   ├── outdoor/
│   │   └── index.md           ← Outdoor growing guide
│   ├── greenhouse/
│   │   └── index.md           ← Greenhouse & light-dep
│   ├── nutrients/
│   │   └── index.md           ← NPK, feeding, pH management
│   ├── training.md            ← HST, LST, ScrOG, SOG
│   ├── pests-diseases.md      ← IPM, pests, diseases, treatments
│   ├── harvest-dry.md         ← Harvest timing, drying
│   └── cure-store.md          ← Curing, long-term storage
│
├── strains/
│   ├── index.md               ← Strain database with master table
│   ├── template.md            ← Standard strain template guide
│   ├── indica/                ← 69 indica strains
│   │   ├── northern-lights.md
│   │   ├── granddaddy-purple.md
│   │   ├── purple-kush.md
│   │   ├── bubba-kush.md
│   │   ├── blueberry.md
│   │   ├── afghani.md
│   │   ├── hindu-kush.md
│   │   ├── la-confidential.md
│   │   └── skywalker-og.md
│   ├── sativa/                ← 69 sativa strains
│   │   ├── durban-poison.md
│   │   ├── green-crack.md
│   │   ├── jack-herer.md
│   │   ├── super-silver-haze.md
│   │   ├── amnesia-haze.md
│   │   ├── sour-diesel.md
│   │   ├── strawberry-cough.md
│   │   ├── tangie.md
│   │   └── maconga.md
│   └── hybrid/                ← 70 hybrid strains
│       ├── og-kush.md
│       ├── blue-dream.md
│       ├── girl-scout-cookies.md
│       ├── white-widow.md
│       ├── ak-47.md
│       ├── pineapple-express.md
│       ├── gelato.md
│       ├── wedding-cake.md
│       ├── gorilla-glue-4.md
│       └── zkittlez.md
│
├── genetics/
│   ├── index.md               ← Genetics & Breeding overview
│   ├── basics.md              ← Cannabis genetics fundamentals
│   ├── breeding.md            ← Breeding methodology
│   ├── seeds.md               ← Seed types and production
│   └── autoflower-vs-photoperiod.md ← Auto vs photo comparison
│
├── extraction/
│   ├── index.md               ← Extraction overview
│   ├── solventless/
│   │   ├── dry-sift.md        ← Dry sift & kief
│   │   ├── ice-water-hash.md  ← Bubble hash
│   │   └── rosin-press.md     ← Rosin extraction
│   ├── solvent-based/
│   │   ├── bho-pho.md         ← Butane/propane hash oil
│   │   ├── ethanol.md         ← Ethanol extraction (QWET)
│   │   └── co2.md             ← Supercritical CO₂
│   └── refinement/
│       ├── distillate.md      ← Fractional distillation
│       ├── live-resin.md      ← Fresh frozen extraction
│       └── live-rosin.md      ← Premium solventless concentrate
│
├── consumption/
│   ├── index.md               ← Consumption overview & comparison
│   ├── smoking/
│   │   └── index.md           ← Joints, pipes, bongs
│   ├── vaping/
│   │   └── index.md           ← Dry herb & concentrate vaporizers
│   ├── edibles/
│   │   └── index.md           ← Edibles, dosing, cannabutter
│   ├── tinctures/
│   │   └── index.md           ← Sublingual tinctures
│   ├── topicals/
│   │   └── index.md           ← Creams, balms, transdermal patches
│   ├── dabbing/
│   │   └── index.md           ← Concentrate consumption
│   └── gear/
│       └── china-glass-buyers-guide.md ← Sourcing glass pieces from China
│
├── glossary/
│   └── index.md               ← Comprehensive glossary (200+ terms)
│
├── law-policy/
│   ├── index.md               ← Cannabis law & policy overview
│   ├── united-states.md       ← US federal/state complexity
│   ├── full-legalization/     ← 8 country profiles
│   │   ├── uruguay.md
│   │   ├── canada.md
│   │   ├── germany.md
│   │   ├── malta.md
│   │   ├── luxembourg.md
│   │   ├── mexico.md
│   │   ├── thailand.md
│   │   └── south-africa.md
│   ├── decriminalization/     ← 5 country profiles
│   │   ├── portugal.md
│   │   ├── spain.md
│   │   ├── netherlands.md
│   │   ├── czech-republic.md
│   │   └── switzerland.md
│   └── medical/               ← 4 country profiles
│       ├── australia.md
│       ├── united-kingdom.md
│       ├── israel.md
│       └── colombia.md
│
├── legal-safety/
│   ├── legal.md               ← Global legal landscape
│   ├── responsible-use.md     ← Responsible use guidelines
│   └── harm-reduction.md      ← Evidence-based harm reduction
│
└── images/                    ← Image folder structure (empty, ready for uploads)
    ├── history/
    ├── cultivation/
    ├── strains/
    ├── extraction/
    └── consumption/
```

---

## 📊 Content Summary

| Section | Pages | Word Count (approx.) |
|---------|-------|---------------------|
| Core (Home, About, Editorial) | 4 | ~8,000 |
| Legal & Safety (Responsible Use, Harm Reduction) | 2 | ~8,000 |
| History | 6 | ~16,500 |
| Cultivation | 12 | ~28,000 |
| Strains (208 strains) | 210 | ~230,000 |
| Genetics & Breeding | 5 | ~18,000 |
| Extraction | 10 | ~24,000 |
| Consumption | 7 | ~18,000 |
| Science (Cannabinoids, Terpenes, Decarboxylation, Bro Science) | 4 | ~20,000 |
| Law & Policy (consolidated; US + 17 country profiles) | 19 | ~50,000 |
| Sustainability | 3 | ~14,000 |
| Glossary | 1 | ~6,000 |
| Setup & Import Docs | 4 | ~12,000 |
| **Total** | **306** | **~485,000+** |

---

## 🚀 Quick Start

### 1. Deploy Wiki.js

**Option A: Docker Compose (quickest)**
```bash
cd setup
docker-compose up -d
```

**Option B: Portainer (recommended for production)**
See `setup/PORTAINER-DEPLOYMENT.md` for a complete step-by-step guide including Nginx Proxy Manager, SSL, and automated backups.

Wiki.js will be running at `http://localhost:3000`

### 2. Configure the Site

Open `setup/CONFIGURATION.md` and follow the instructions for:
- Site title, slogan, and identity
- Sidebar navigation setup
- Custom CSS theme (green/nature/modern minimal)
- Module configuration (Tags, Search, Git, Categories)

### 3. Import Content

See `IMPORT-GUIDE.md` for three import methods:
- **Git-backed storage** (recommended) — Push all files to a Git repo and sync
- **Manual copy-paste** — Create pages one by one via the Wiki.js editor
- **CLI/API bulk import** — Scripted import via Wiki.js GraphQL API

### 4. Add Images

Upload images to Wiki.js Assets or place them in your Git repo's `images/` folder. All pages include image placeholders.

---

## 🎨 Features

### Content Quality
- ✅ Neutral, evidence-based, educational tone
- ✅ 208 detailed strain profiles with consistent template (69 indica, 69 sativa, 70 hybrid)
- ✅ Master strain comparison table (sortable in Wiki.js)
- ✅ Comprehensive cultivation guides from seed to cure
- ✅ Genetics & Breeding section — cannabis genetics, breeding techniques, seed types, autoflowering vs. photoperiod
- ✅ Extraction science with edible application guidance for every method
- ✅ Dedicated decarboxylation page (flower + all concentrate types)
- ✅ Consumption method comparison with onset/duration data
- ✅ Science of Cannabis section (ECS, cannabinoid chemistry, terpene biochemistry, receptor pharmacology)
- ✅ Bro Science page — 12 common cannabis myths debunked with evidence
- ✅ Sustainability section — eco-friendly cultivation, industry environmental impact
- ✅ Historical coverage from 8000 BCE to modern legalization
- ✅ Global legal landscape overview
- ✅ Harm reduction and responsible use guidance
- ✅ 200+ term glossary

### Wiki.js Best Practices
- ✅ Clean, logical page paths
- ✅ Heavy internal linking between related pages
- ✅ Tags and categories on all pages
- ✅ YAML front matter on every page
- ✅ Admonition boxes (info, warning, danger, tip)
- ✅ Markdown tables throughout
- ✅ Image placeholders with suggested paths
- ✅ Progressive depth (beginner-friendly → advanced)
- ✅ Custom CSS theme (green/nature/minimal)

---

## ⚠️ Important Disclaimers

This wiki includes **prominent legal and safety disclaimers** on appropriate pages:

- Cannabis cultivation and possession is **illegal in many jurisdictions**
- This wiki is **educational only** — not medical or legal advice
- Laws change frequently; readers must verify their local regulations
- Harm reduction information is evidence-based but not a substitute for professional medical guidance
- Strain effects data is based on reported experiences and lab testing, **not clinical studies**

---

## 📄 License

All CannaGrow content is intended to be published under **Creative Commons BY-SA 4.0** (Attribution-ShareAlike).

The project files themselves are provided for personal educational use.

---

## 🛠️ Technologies

| Component | Technology |
|-----------|-----------|
| Wiki Engine | [Wiki.js 2.5](https://js.wiki/) |
| Database | PostgreSQL 15 |
| Deployment | Docker / Docker Compose |
| Content Format | Markdown with YAML front matter |
| Storage | Git-backed (GitHub, GitLab, etc.) |
| Styling | Custom CSS (green/nature theme) |

---

## 📚 Page Index

See `setup/SITE-MAP.md` for the complete hierarchical listing of all 286 pages.

---

## 🤝 Contributing

All contributions are made through the GitHub repository, as Wiki.js 2.x does not handle in-platform edits reliably:

1. Go to [https://github.com/tinypanda31/cannagrow-wiki/](https://github.com/tinypanda31/cannagrow-wiki/)
2. Fork the repo or request collaborator access
3. Follow the editorial guidelines in `about/editorial.md`
4. Use the strain template from `strains/template.md`
5. Maintain neutral, evidence-based tone
6. Include proper internal links and tags
7. Submit a Pull Request for editorial review

---

*Built as a comprehensive, production-ready wiki project. Deploy, customize, and share.* 🌿
