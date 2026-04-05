# CannaGrow – Import & Deployment Guide

This guide walks you through importing all CannaGrow pages into Wiki.js and deploying the wiki for production use.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Method 1: Git-Backed Storage (Recommended)](#method-1-git-backed-storage-recommended)
3. [Method 2: Manual Copy-Paste via Wiki.js Editor](#method-2-manual-copy-paste-via-wikijs-editor)
4. [Method 3: Bulk Import via CLI](#method-3-bulk-import-via-cli)
5. [Image Setup](#image-setup)
6. [Post-Import Configuration](#post-import-configuration)
7. [Verification Checklist](#verification-checklist)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites

- **Wiki.js 2.5+** deployed and running (see `setup/docker-compose.yml`)
- **Admin access** to your Wiki.js instance
- **Git repository** (GitHub, GitLab, Gitea, or self-hosted) for Git-backed storage
- All CannaGrow markdown files from this project

---

## Method 1: Git-Backed Storage (Recommended)

Git-backed storage is the most maintainable approach, providing version control, easy backups, and collaborative editing.

### Step 1: Configure Git Module in Wiki.js

1. Log into Wiki.js as admin
2. Navigate to **Administration > Storage**
3. Click **Add Storage Target**
4. Select **Git** as the module
5. Configure:

| Setting | Value |
|---------|-------|
| **Mode** | Push & Pull (or Push only if write access isn't needed) |
| **Repo URL** | `git@github.com:your-username/CannaGrow.git` (SSH) or `https://github.com/your-username/CannaGrow.git` (HTTPS) |
| **Branch** | `main` |
| **Auth** | SSH Key or Personal Access Token |
| **Sync Interval** | Every 5 minutes |
| **Content Path** | `/` (root of repo) |
| **Default File Extension** | `.md` |

6. Click **Save**
7. Click **Sync** to test the connection

### Step 2: Prepare the Git Repository

```bash
# Clone your wiki repository
git clone git@github.com:your-username/CannaGrow.git
cd CannaGrow

# Copy all CannaGrow markdown files into the repo
# Maintain the folder structure from this project:
# ├── home.md
# ├── about.md
# ├── about/
# ├── history/
# ├── cultivation/
# ├── strains/
# ├── extraction/
# ├── consumption/
# ├── cannabinoids.md
# ├── terpenes.md
# ├── glossary/
# └── legal-safety/

# Commit and push
git add -A
git commit -m "Initial CannaGrow import - all pages"
git push origin main
```

### Step 3: Trigger Wiki.js Sync

1. Go to **Administration > Storage**
2. Click **Sync** on your Git storage target
3. Wiki.js will pull all `.md` files and create pages automatically
4. Check **Administration > Pages** to verify all pages were created

### Step 4: Verify Page Paths

Wiki.js uses the file path (minus `.md`) as the page path. Verify:

| File | Expected Path |
|------|--------------|
| `home.md` | `/home` |
| `about.md` | `/about` |
| `strains/hybrid/og-kush.md` | `/strains/hybrid/og-kush` |
| `cultivation/indoor/lighting.md` | `/cultivation/indoor/lighting` |

---

## Method 2: Manual Copy-Paste via Wiki.js Editor

For smaller imports or testing, you can manually create pages through the Wiki.js interface.

### Steps:

1. Log into Wiki.js
2. Click **New Page** (or the **+** button in the sidebar)
3. For each file in this project:
   - Open the `.md` file in a text editor
   - Copy the full Markdown content
   - In Wiki.js, paste into the editor
   - Set the **Path** to match the file's intended path (e.g., `/strains/og-kush`)
   - Set the **Title** from the YAML front matter
   - Add **Tags** from the front matter
   - Click **Publish**

### Estimated Time

With 75+ pages, this method takes 3-5 hours. Use Method 1 (Git) for efficiency.

---

## Method 3: Bulk Import via CLI

If you have server access, you can use the Wiki.js API for programmatic import.

### Using the Wiki.js GraphQL API

```bash
#!/bin/bash
# import-wiki.sh - Bulk import markdown files via Wiki.js API

WIKI_URL="http://localhost:3000"
API_TOKEN="your-api-token"  # Generate in Admin > User > API Keys

# Function to create a page
create_page() {
  local file="$1"
  local path="$2"
  local content=$(cat "$file")
  local title=$(head -5 "$file" | grep "^title:" | sed 's/title: *"\(.*\)"/\1/')

  curl -X POST "$WIKI_URL/graphql" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{\"query\": \"mutation { pages.create(page: {path: \\\"$path\\\", title: \\\"$title\\\", content: \\\"$(echo "$content" | sed 's/"/\\"/g' | tr '\n' '\\n')\\\", contentType: \\\"markdown\\\", isPublished: true}) { id } }\"}"

  echo "Created: $path"
}

# Import all markdown files
find . -name "*.md" -not -path "./setup/*" -not -path "./README.md" | while read file; do
  path=$(echo "$file" | sed 's|\.md$||' | sed 's|^\./|/|')
  create_page "$file" "$path"
  sleep 1  # Rate limit
done
```

> **Note:** Adjust the script for your environment. The GraphQL mutation structure may vary by Wiki.js version. Refer to the [Wiki.js API documentation](https://docs.requarks.io/api).

---

## Image Setup

### Step 1: Create Image Folders in Wiki.js

1. Go to **Administration > Assets**
2. Create folders matching the image structure:
   - `/uploads/images/history/`
   - `/uploads/images/cultivation/`
   - `/uploads/images/strains/`
   - `/uploads/images/extraction/`
   - `/uploads/images/consumption/`

### Step 2: Add Images

**Option A: Upload via Wiki.js UI**
1. Navigate to **Assets**
2. Click **Upload**
3. Select images and assign to appropriate folders

**Option B: Upload via Git**
1. Place images in your Git repo under `images/` folder
2. Wiki.js can reference them at `/uploads/images/...`

### Suggested Placeholder Images

Since this project includes image placeholders, you'll want to source real images:

- **Stock photos:** Unsplash, Pexels, Pixabay (free, no attribution required)
- **Cannabis-specific:** Grow photography, strain photography (ensure licensing allows use)
- **Diagrams/Infographics:** Create your own using Figma, Canva, or similar tools
- **Scientific illustrations:** Wikimedia Commons (check licensing)

### Recommended Image Sizes

| Type | Dimensions | Format |
|------|-----------|--------|
| Hero/Banner | 1920×600px | JPG/WebP |
| Content images | 800×600px | JPG/WebP |
| Strain photos | 600×600px | JPG/PNG |
| Icons | 200×200px | PNG/SVG |

---

## Post-Import Configuration

### 1. Set the Homepage

1. Go to **Administration > Site Identity**
2. Set **Homepage Type** to **Page Redirect** or **Custom Page**
3. Set **Homepage Path** to `/home`

### 2. Configure the Sidebar Navigation

1. Go to **Administration > Navigation**
2. Create a new navigation menu called "Main Navigation"
3. Build the sidebar hierarchy using the structure provided in `setup/CONFIGURATION.md`
4. Set as the **default navigation**

### 3. Set Up Tags

1. Go to **Administration > Tags**
2. Pre-create commonly used tags:
   - Types: `indica`, `sativa`, `hybrid`
   - Terpenes: `myrcene`, `limonene`, `caryophyllene`, `pinene`, `linalool`, `terpinolene`, `humulene`
   - Topics: `history`, `cultivation`, `extraction`, `consumption`, `science`, `legal`
   - Difficulty: `beginner-friendly`, `intermediate`, `advanced-grow`

### 4. Apply Custom CSS Theme

1. Go to **Administration > Theme**
2. Under **Custom CSS**, paste the CSS from `setup/CONFIGURATION.md`
3. Preview and save

### 5. Configure Modules

Enable the following modules:
- **Tags** – Administration > Modules > Tags > Enable
- **Search** – Should be enabled by default
- **Categories** – Administration > Modules > Categories > Enable
- **Comments** – Optional
- **Ratings** – Optional
- **Graphviz** – For diagrams (optional)
- **Charts** – For data visualization (optional)

### 6. Set Content License

1. Go to **Administration > Site Identity**
2. Set **Content License** to **Creative Commons BY-NC-SA 4.0**
3. Add license text to the footer if desired

### 7. Configure SEO

1. Go to **Administration > SEO**
2. Enable **Sitemap**
3. Enable **Robots.txt**
4. Set default meta description
5. Configure Open Graph tags

### 8. Set Up User Roles & Permissions

1. Go to **Administration > User Roles**
2. Configure permissions:
   - **Anonymous:** Read access only
   - **Guest (registered):** Read, comment, rate pages
   - **Editor:** Create and edit pages
   - **Administrator:** Full access

---

## Verification Checklist

After import, verify the following:

- [ ] All 75+ pages exist and render correctly
- [ ] Homepage is set to `/home`
- [ ] Sidebar navigation matches the structure in `setup/CONFIGURATION.md`
- [ ] All internal links work (spot-check 10-15 links)
- [ ] Tables render properly
- [ ] Admonition boxes (info, warning, danger, tip) display correctly
- [ ] Images display (or placeholders are visible)
- [ ] Tags are applied to all strain pages
- [ ] Search returns relevant results
- [ ] Custom CSS theme is active
- [ ] Mobile responsiveness looks good
- [ ] Legal disclaimers appear on appropriate pages
- [ ] YAML front matter is not visible to end users (it should be parsed by Wiki.js)
- [ ] Git sync is working (if using Git-backed storage)

---

## Troubleshooting

### Pages Not Appearing After Git Sync

1. Check **Administration > Storage > Sync History** for errors
2. Verify file paths don't start with `/` in the repo (Wiki.js adds this)
3. Ensure all files have `.md` extension
4. Check that YAML front matter is valid (properly quoted strings)

### YAML Front Matter Issues

Ensure all front matter follows this format:
```yaml
---
title: "Page Title"
description: "Page description"
tags: tag1, tag2, tag3
---
```

Common issues:
- Unquoted special characters in titles (use quotes)
- Missing spaces after colons
- Invalid tag arrays (use `[tag1, tag2]` not `tag1, tag2`)

### Images Not Displaying

1. Verify image paths match: `/uploads/images/folder/filename.jpg`
2. Check that images are uploaded to **Assets**
3. Ensure file permissions allow image access
4. Check browser console for 404 errors

### Markdown Not Rendering

1. Verify Wiki.js Markdown module is enabled
2. Check for unclosed code blocks or tables
3. Ensure admonition syntax is correct (`::: tip`, `::: warning`, etc.)
4. Test with a simple page first to isolate the issue

### Git Sync Conflicts

1. Never edit the same file in Wiki.js and Git simultaneously
2. If conflicts occur, resolve in Git and force-push
3. Consider using **Push Only** mode if you don't need Wiki.js to pull external changes

---

## Ongoing Maintenance

### Backups

- **Database:** Regular PostgreSQL backups (`pg_dump`)
- **Git Repo:** Push to a remote backup location
- **Assets:** Export from Wiki.js or back up the storage directory

### Updates

- Keep Wiki.js updated to the latest version
- Monitor the [Wiki.js GitHub releases](https://github.com/requarks/wiki/releases)
- Test updates on a staging instance first

### Content Updates

- Use Git for all content changes (version history, collaboration)
- Review strain data periodically as new lab testing data becomes available
- Update legal pages when legislation changes in major jurisdictions
- Encourage community contributions via pull requests

---

## Quick Reference

| Resource | Location |
|----------|---------|
| Docker Compose | `setup/docker-compose.yml` |
| Configuration Guide | `setup/CONFIGURATION.md` |
| Site Map | `setup/SITE-MAP.md` |
| Custom CSS | `setup/CONFIGURATION.md` (Section 5) |
| Strain Template | `strains/template.md` |
| This Import Guide | `IMPORT-GUIDE.md` |

---

*For questions or issues, refer to the [Wiki.js Documentation](https://docs.requarks.io) or the CannaGrow [[about|About]] page.*
