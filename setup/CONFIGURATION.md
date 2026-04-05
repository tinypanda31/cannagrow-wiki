# CannaGrow - Wiki.js Setup & Configuration Guide

## 1. Docker Deployment

### Prerequisites
- Docker and Docker Compose installed
- At least 2GB RAM available
- Persistent storage for database

### Quick Start

```bash
cd setup
docker-compose up -d
```

Wiki.js will be available at `http://localhost:3000`

Default admin credentials (change immediately):
- **Email:** `admin@example.com`
- **Password:** `adminadmin`

### Production Recommendations
- Use a reverse proxy (Nginx/Traefik) with SSL
- Change database password in `docker-compose.yml`
- Set up automated backups
- Use environment variables for secrets

---

## 2. Site Configuration

### General Settings (Admin > Settings)

| Setting | Value |
|---------|-------|
| **Site Title** | CannaGrow |
| **Site Slogan** | A Comprehensive Cannabis Encyclopedia |
| **Site URL** | `https://your-domain.com` |
| **Content License** | Creative Commons BY-NC-SA 4.0 |
| **Company/Organization** | CannaGrow Project |
| **Footer Copyright Text** | © 2026 CannaGrow. Content licensed under CC BY-NC-SA 4.0 |

### Homepage Settings
- **Homepage Type:** Custom Page
- **Homepage Path:** `/home`

### SEO Settings
- **Enable SEO:** Yes
- **Default Meta Description:** "CannaGrow - A comprehensive, neutral, educational resource about cannabis covering history, cultivation, strains, extraction, and consumption."
- **Enable Sitemap:** Yes
- **Enable Robots.txt:** Yes

---

## 3. Modules to Enable

### Required Modules
1. **Tags** - For categorizing strains, topics, and cross-referencing
2. **Search** - Full-text search (built-in)
3. **Git** - For Git-backed storage and version control
4. **Comments** - Optional community discussion
5. **Ratings** - User page ratings
6. **History** - Page version tracking
7. **Categories** - Hierarchical categorization
8. **Assets** - File/image management

### Git Storage Configuration
- **Mode:** Push & Pull
- **Repo URL:** Your Git repository URL
- **Branch:** `main`
- **Auth:** SSH key or Personal Access Token
- **Sync Interval:** Every 5 minutes

---

## 4. Sidebar Navigation

```
🌿 CannaGrow
├── 🏠 Home
├── 📖 About
│   ├── About CannaGrow
│   ├── How to Use This Wiki
│   └── Editorial Guidelines
├── 📜 History
│   ├── Ancient Origins
│   ├── Cannabis in the Medieval World
│   ├── The Prohibition Era
│   ├── The War on Drugs
│   └── Modern Legalization & Renaissance
├── 🌱 Cultivation
│   ├── Cultivation Overview
│   ├── Indoor Growing
│   │   ├── Lighting Systems
│   │   ├── Environmental Control
│   │   └── Hydroponics
│   ├── Outdoor Growing
│   ├── Greenhouse Cultivation
│   ├── Nutrients & Feeding
│   ├── Plant Training Techniques
│   ├── Pest & Disease Management
│   ├── Harvesting & Drying
│   └── Curing & Storage
├── 🧬 Strain Database
│   ├── Strain Database Index
│   ├── Strain Template Guide
│   ├── Indica Strains
│   │   ├── Northern Lights
│   │   ├── Granddaddy Purple
│   │   ├── Purple Kush
│   │   ├── Bubba Kush
│   │   ├── Blueberry
│   │   ├── Afghani
│   │   ├── Hindu Kush
│   │   ├── LA Confidential
│   │   └── Skywalker OG
│   ├── Sativa Strains
│   │   ├── Durban Poison
│   │   ├── Green Crack
│   │   ├── Jack Herer
│   │   ├── Super Silver Haze
│   │   ├── Amnesia Haze
│   │   ├── Sour Diesel
│   │   ├── Strawberry Cough
│   │   ├── Tangie
│   │   └── Maconga
│   └── Hybrid Strains
│       ├── OG Kush
│       ├── Blue Dream
│       ├── Girl Scout Cookies
│       ├── White Widow
│       ├── AK-47
│       ├── Pineapple Express
│       ├── Gelato
│       ├── Wedding Cake
│       ├── Gorilla Glue #4
│       └── Zkittlez
├── 🧬 Genetics & Breeding
│   ├── Genetics & Breeding Overview
│   ├── Cannabis Genetics Basics
│   ├── Breeding Techniques
│   ├── Seeds (Types & Production)
│   └── Autoflowering vs. Photoperiod
├── ⚗️ Extraction Methods
│   ├── Extraction Overview
│   ├── Solventless Methods
│   │   ├── Dry Sift & Kief
│   │   ├── Ice-Water Hash
│   │   └── Rosin Press
│   ├── Solvent-Based Methods
│   │   ├── BHO/PHO
│   │   ├── Ethanol Extraction
│   │   └── CO₂ Extraction
│   └── Refinement & Distillation
│       ├── Distillate
│       ├── Live Resin
│       └── Live Rosin
├── 💨 Consumption Methods
│   ├── Consumption Overview
│   ├── Smoking
│   ├── Vaporizing
│   ├── Edibles
│   ├── Tinctures & Sublingual
│   ├── Topicals & Transdermals
│   ├── Dabbing
│   └── Gear
│       └── China Glass Buyer's Guide
├── 🔬 Science of Cannabis
│   ├── Science of Cannabis Overview
│   ├── Cannabinoids (THC, CBD, CBG, CBN, etc.)
│   ├── Terpenes & the Entourage Effect
│   ├── Decarboxylation
│   └── Bro Science (Myth Debunking)
├── 📚 Glossary
├── ♻️ Sustainability
│   ├── Sustainability & Cannabis Overview
│   ├── Eco-Friendly Cultivation Practices
│   └── Environmental Impact of the Cannabis Industry
├── ⚖️ Law & Policy
│   ├── Cannabis Law & Policy Overview
│   ├── United States (Federal vs. State)
│   ├── Full Legalization
│   │   ├── Uruguay
│   │   ├── Canada
│   │   ├── Germany
│   │   ├── Malta
│   │   ├── Luxembourg
│   │   ├── Mexico
│   │   ├── Thailand
│   │   └── South Africa
│   ├── Decriminalization
│   │   ├── Portugal
│   │   ├── Spain
│   │   ├── Netherlands
│   │   ├── Czech Republic
│   │   └── Switzerland
│   └── Medical Cannabis
│       ├── Australia
│       ├── United Kingdom
│       ├── Israel
│       └── Colombia
├── ⚖️ Legal & Safety
│   ├── Legal Landscape
│   ├── Responsible Use
│   └── Harm Reduction
└── 📝 Contribute
```

---

## 5. Custom CSS Theme

Create a custom CSS file or add via Admin > Theme > Custom CSS:

```css
/* CannaGrow Custom Theme - Green/Nature/Modern Minimal */

:root {
  --primary-green: #2E7D32;
  --light-green: #4CAF50;
  --dark-green: #1B5E20;
  --accent-gold: #F9A825;
  --bg-light: #F1F8E9;
  --text-dark: #212121;
  --text-muted: #757575;
  --border-color: #C8E6C9;
}

/* Header */
#app-header {
  background: linear-gradient(135deg, var(--dark-green), var(--primary-green));
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}

/* Sidebar */
.sidebar {
  background-color: #FAFFFE;
  border-right: 1px solid var(--border-color);
}

.sidebar .nav-link.active {
  background-color: var(--bg-light);
  border-left: 3px solid var(--primary-green);
  color: var(--dark-green);
}

/* Content Area */
.wiki-content h1 {
  color: var(--dark-green);
  border-bottom: 2px solid var(--border-color);
  padding-bottom: 0.3em;
}

.wiki-content h2 {
  color: var(--primary-green);
  border-bottom: 1px solid var(--border-color);
  padding-bottom: 0.2em;
}

/* Admonition Boxes */
.admonition-warning {
  background-color: #FFF8E1;
  border-left: 4px solid var(--accent-gold);
  padding: 1em;
  margin: 1em 0;
}

.admonition-danger {
  background-color: #FFEBEE;
  border-left: 4px solid #C62828;
  padding: 1em;
  margin: 1em 0;
}

.admonition-info {
  background-color: var(--bg-light);
  border-left: 4px solid var(--light-green);
  padding: 1em;
  margin: 1em 0;
}

/* Tables */
table {
  border-collapse: collapse;
  width: 100%;
}

table th {
  background-color: var(--bg-light);
  color: var(--dark-green);
  padding: 0.75em;
}

table td {
  padding: 0.5em 0.75em;
  border-bottom: 1px solid #E8F5E9;
}

/* Links */
a {
  color: var(--primary-green);
}

a:hover {
  color: var(--dark-green);
}

/* Tags */
.tag {
  background-color: var(--bg-light);
  color: var(--dark-green);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 2px 10px;
  margin: 2px;
  display: inline-block;
  font-size: 0.85em;
}

/* Code blocks */
pre {
  background-color: #263238;
  border-radius: 6px;
  padding: 1em;
}

/* Footer */
#app-footer {
  background-color: var(--dark-green);
  color: #C8E6C9;
  text-align: center;
  padding: 1em;
}
```

---

## 6. Recommended Tags

### Strain Tags
- `indica`, `sativa`, `hybrid`, `thc-dominant`, `cbd-dominant`, `balanced`
- `earthy`, `citrus`, `sweet`, `diesel`, `pine`, `berry`, `spicy`, `floral`
- `medical`, `recreational`, `creative`, `energetic`, `relaxing`, `sedating`
- `beginner-friendly`, `advanced-grow`, `high-yield`, `fast-flowering`

### Topic Tags
- `history`, `cultivation`, `extraction`, `consumption`, `science`, `safety`, `legal`

---

## 7. Image Guidelines

### Recommended Sizes
- **Hero/Banner images:** 1920x600px
- **Content images:** 800x600px (4:3 ratio)
- **Strain photos:** 600x600px (1:1 ratio)
- **Icons/thumbnails:** 200x200px

### Folder Structure
```
/images/
├── history/
│   ├── ancient-cannabis-fields.jpg
│   ├── prohibition-poster.jpg
│   └── modern-dispensary.jpg
├── cultivation/
│   ├── indoor-grow-tent.jpg
│   ├── hydroponic-system.jpg
│   └── mature-plant.jpg
├── strains/
│   ├── og-kush.jpg
│   ├── blue-dream.jpg
│   └── ...
├── extraction/
│   ├── rosin-press.jpg
│   └── co2-machine.jpg
└── consumption/
    ├── vaporizer.jpg
    └── edibles-assortment.jpg
```

### Wiki.js Image Syntax
```markdown
![Description text](/uploads/images/filename.jpg)
```
