---
title: Deploying CannaGrow with Portainer
description: Step-by-step guide for deploying the CannaGrow Wiki.js wiki using Portainer, including reverse proxy, SSL, Git sync, and backup configuration.
---

# Deploying CannaGrow with Portainer

A comprehensive guide for deploying the CannaGrow cannabis encyclopedia wiki using Portainer as your Docker container management interface. This guide covers everything from initial setup through production-ready configuration with SSL, reverse proxy, and automated backups.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Accessing Portainer](#2-accessing-portainer)
3. [Creating the Wiki.js Stack](#3-creating-the-wikijs-stack)
4. [Configuring Persistent Storage](#4-configuring-persistent-storage)
5. [Setting Up Nginx Proxy Manager](#5-setting-up-nginx-proxy-manager)
6. [SSL/TLS with Let's Encrypt](#6-ssltls-with-lets-encrypt)
7. [Importing CannaGrow Content via Git](#7-importing-cannagrow-content-via-git)
8. [Backup Configuration](#8-backup-configuration)
9. [Monitoring and Logging](#9-monitoring-and-logging)
10. [Troubleshooting](#10-troubleshooting)

---

## 1. Prerequisites

Before deploying CannaGrow through Portainer, ensure the following are in place.

### Software Requirements

| Component | Minimum Version | Purpose |
|-----------|----------------|---------|
| Docker Engine | 20.10+ | Container runtime |
| Docker Compose | 2.0+ | Multi-container orchestration |
| Portainer CE/BE | 2.18+ | Web-based container management UI |
| Server RAM | 2 GB minimum, 4 GB recommended | Wiki.js + PostgreSQL |
| Server Storage | 10 GB minimum | Database + content + assets |
| Domain Name | Any registered domain | SSL and reverse proxy access |

### Installation Checklist

- [ ] **Docker** installed and running
- [ ] **Docker Compose** installed (v2 plugin recommended)
- [ ] **Portainer** installed and accessible
- [ ] **Domain name** pointing to your server's IP address
- [ ] **Ports 80 and 443** open and available
- [ ] **CannaGrow content** available in a Git repository

### Verify Docker Installation

```bash
docker --version
docker compose version
docker info
```

### Install Portainer (if not already installed)

```bash
# Create Portainer volume
docker volume create portainer_data

# Deploy Portainer
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```

> **Note:** Portainer will be available at `https://<your-server-ip>:9443`. On first access, you will be prompted to create an admin user.

![Portainer login screen](/images/setup/portainer-login.png)

---

## 2. Accessing Portainer

### Step 1: Navigate to the Portainer UI

Open your web browser and go to:

```
https://<your-server-ip>:9443
```

Accept the self-signed SSL certificate warning (you will replace this with a proper certificate later).

### Step 2: Create Your Admin Account

On first launch, Portainer will prompt you to:
1. Create an **admin username**
2. Set a **strong password** (minimum 12 characters recommended)

### Step 3: Connect to Your Local Environment

Portainer will detect your local Docker environment automatically. Click **Get Started** to connect to the **local** environment.

![Portainer environment selection](/images/setup/portainer-environment.png)

### Step 4: Familiarize Yourself with the Dashboard

The Portainer dashboard displays:
- **Containers** -- Running and stopped containers
- **Stacks** -- Docker Compose deployments
- **Images** -- Pulled Docker images
- **Volumes** -- Persistent data storage
- **Networks** -- Docker network configurations

---

## 3. Creating the Wiki.js Stack

A **Stack** in Portainer is equivalent to a `docker-compose.yml` file. This is how we deploy the full Wiki.js application with its PostgreSQL database.

### Step 1: Navigate to Stacks

1. In the left sidebar, click **Stacks**
2. Click **Add stack** at the top of the page

![Portainer Stacks view](/images/setup/portainer-stacks.png)

### Step 2: Name the Stack

Enter a name for your stack:

```
cannagrow
```

### Step 3: Choose the Build Method

Select **Web editor** from the Build method options. This allows you to paste the `docker-compose.yml` content directly.

| Build Method | When to Use |
|-------------|-------------|
| **Web editor** | Paste compose content directly (recommended for first deployment) |
| **Git repository** | Pull compose file from a Git repo (recommended for ongoing management) |
| **Upload from file** | Upload a `docker-compose.yml` file |

### Step 4: Paste the Docker Compose Content

Paste the following content into the Web editor:

```yaml
version: "3.8"

services:
  db:
    image: postgres:15-alpine
    container_name: cannagrow-db
    environment:
      POSTGRES_DB: wikidb
      POSTGRES_USER: wikijs
      POSTGRES_PASSWORD: wikijsrocks
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
    restart: unless-stopped
    volumes:
      - cannagrow-db-data:/var/lib/postgresql/data
    networks:
      - cannagrow-network
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U wikijs -d wikidb"]
      interval: 30s
      timeout: 10s
      retries: 5

  wiki:
    image: ghcr.io/requarks/wiki:2.5
    container_name: cannagrow-wiki
    environment:
      DB_TYPE: postgres
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: wikijsrocks
      DB_NAME: wikidb
    restart: unless-stopped
    ports:
      - "3000:3000"
    depends_on:
      db:
        condition: service_healthy
    networks:
      - cannagrow-network
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:3000"]
      interval: 30s
      timeout: 10s
      retries: 5

volumes:
  cannagrow-db-data:
    name: cannagrow-db-data

networks:
  cannagrow-network:
    name: cannagrow-network
    driver: bridge
```

### Key Improvements Over the Base Compose File

| Change | Reason |
|--------|--------|
| `container_name` added to each service | Easier identification in Portainer |
| `logging` configured for PostgreSQL | Prevents unbounded log growth |
| `healthcheck` added to both services | Portainer can monitor container health |
| Explicit `networks` defined | Required for reverse proxy integration |
| Named volume (`cannagrow-db-data`) | Easier backup and management |
| `depends_on` with health condition | Wiki.js waits for DB to be ready |

> **Important:** Change the `POSTGRES_PASSWORD` and `DB_PASS` values to a strong, unique password before deploying to production. Use a password generator to create a 32+ character random password.

### Step 5: Deploy the Stack

Click **Deploy the stack** at the bottom of the page. Portainer will:

1. Pull the `postgres:15-alpine` image
2. Pull the `ghcr.io/requarks/wiki:2.5` image
3. Create the volumes and network
4. Start both containers

![Stack deployment in progress](/images/setup/portainer-deploying.png)

### Step 6: Verify the Deployment

After deployment completes (usually 1-2 minutes):

1. Go to **Containers** in the left sidebar
2. Verify both `cannagrow-db` and `cannagrow-wiki` show **Running** status with green indicators
3. Open `http://<your-server-ip>:3000` in your browser
4. You should see the Wiki.js setup wizard

---

## 4. Configuring Persistent Storage

Persistent storage ensures your wiki content and database survive container restarts, updates, and server reboots.

### Understanding the Volume Layout

| Volume | Maps To | Contains |
|--------|---------|----------|
| `cannagrow-db-data` | `/var/lib/postgresql/data` | PostgreSQL database files (all wiki content, users, settings) |

### Viewing Volumes in Portainer

1. Navigate to **Volumes** in the left sidebar
2. Click on `cannagrow-db-data` to inspect:
   - **Creation date**
   - **Driver** (local)
   - **Mount path** on the host
   - **Size** (grows as content is added)

### Volume Management Tips

- **Never delete** the database volume unless you have a current backup
- Monitor volume size regularly via the Portainer dashboard
- For large wikis, consider using a bind mount to a specific host directory:

```yaml
volumes:
  - /opt/cannagrow/data:/var/lib/postgresql/data
```

### Creating a Dedicated Data Directory (Optional)

If you prefer bind mounts over Docker volumes for easier backup:

```bash
# Create directories on the host
mkdir -p /opt/cannagrow/db-data
mkdir -p /opt/cannagrow/backups

# Set appropriate permissions
chown -R 999:999 /opt/cannagrow/db-data
```

Then update the docker-compose to use bind mounts:

```yaml
volumes:
  - /opt/cannagrow/db-data:/var/lib/postgresql/data
```

---

## 5. Setting Up Nginx Proxy Manager

Nginx Proxy Manager (NPM) provides a web-based interface for managing reverse proxies, SSL certificates, and access lists. Deploying it alongside Wiki.js in Portainer gives you production-grade HTTPS access.

### Step 1: Create the NPM Stack

1. Go to **Stacks** > **Add stack**
2. Name it: `npm` (or `nginx-proxy-manager`)
3. Select **Web editor** as the build method

### Step 2: Paste the NPM Docker Compose

```yaml
version: "3.8"

services:
  npm-app:
    image: jc21/nginx-proxy-manager:latest
    container_name: nginx-proxy-manager
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "81:81"
    volumes:
      - npm-data:/data
      - npm-letsencrypt:/etc/letsencrypt
    networks:
      - cannagrow-network

volumes:
  npm-data:
    name: npm-data
  npm-letsencrypt:
    name: npm-letsencrypt

networks:
  cannagrow-network:
    external: true
    name: cannagrow-network
```

> **Note:** The `cannagrow-network` is set as `external: true` so NPM can route traffic to the Wiki.js container on the same network.

### Step 3: Deploy the NPM Stack

Click **Deploy the stack**. NPM will start and be available at:

```
http://<your-server-ip>:81
```

### Step 4: Initial NPM Setup

Default credentials for first login:

| Field | Value |
|-------|-------|
| **Email** | `admin@example.com` |
| **Password** | `changeme` |

You will be prompted to change these immediately.

![Nginx Proxy Manager login](/images/setup/npm-login.png)

### Step 5: Configure the Proxy Host for Wiki.js

1. In NPM, go to **Hosts** > **Proxy Hosts**
2. Click **Add Proxy Host**
3. Configure the following:

| Setting | Value |
|---------|-------|
| **Domain Names** | `wiki.yourdomain.com` (your actual domain) |
| **Scheme** | `http` |
| **Forward Hostname / IP** | `cannagrow-wiki` |
| **Forward Port** | `3000` |
| **Block Common Exploits** | Enable (checked) |
| **Websockets Support** | Enable (checked) |
| **Cache Assets** | Enable (checked) |

4. Click **Save**

![NPM Proxy Host configuration](/images/setup/npm-proxy-host.png)

At this point, your wiki is accessible at `http://wiki.yourdomain.com` (not yet HTTPS).

---

## 6. SSL/TLS with Let's Encrypt

Securing your wiki with HTTPS is essential for production use, especially if users will log in or if you plan to use Git webhooks.

### Step 1: Request a Let's Encrypt Certificate

1. In NPM, go to **Hosts** > **Proxy Hosts**
2. Click the **three dots** menu on your Wiki.js proxy host
3. Click **Edit**
4. Switch to the **SSL** tab

| Setting | Value |
|---------|-------|
| **SSL Certificate** | Request a new SSL Certificate |
| **Force SSL** | Enable (checked) |
| **HTTP/2 Support** | Enable (checked) |
| **I agree to the Let's Encrypt Terms of Service** | Enable (checked) |

![NPM SSL certificate request](/images/setup/npm-ssl.png)

5. Click **Save**

### Step 2: Verify HTTPS

Open your browser and navigate to:

```
https://wiki.yourdomain.com
```

You should see:
- A padlock icon in the address bar
- Valid certificate issued by Let's Encrypt
- Wiki.js loading over HTTPS

### Step 3: Certificate Auto-Renewal

NPM automatically renews Let's Encrypt certificates before they expire. To verify:

1. Go to **Hosts** > **SSL Certificates**
2. Check the **Expiry Date** for your certificate
3. NPM renews automatically within 30 days of expiry

### Step 4: Update Wiki.js Site URL

After HTTPS is configured, update the Wiki.js site URL:

1. Log into Wiki.js as admin at `https://wiki.yourdomain.com`
2. Go to **Administration** > **Site Identity**
3. Update **Site URL** to `https://wiki.yourdomain.com`
4. Click **Save**

---

## 7. Importing CannaGrow Content via Git

With Wiki.js running and secured, the next step is importing all CannaGrow content. The recommended method is Git-backed storage.

### Step 1: Prepare Your Git Repository

Ensure your CannaGrow content is in a Git repository:

```bash
# If you haven't already, create a repo with all CannaGrow files
git init
git add -A
git commit -m "Initial CannaGrow import"
git remote add origin git@github.com:your-username/CannaGrow.git
git push -u origin main
```

> For detailed import instructions, see the [Import Guide](/IMPORT-GUIDE.md).

### Step 2: Configure Git Storage in Wiki.js

1. Log into Wiki.js as admin
2. Navigate to **Administration** > **Storage**
3. Click **Add Storage Target**
4. Select **Git** as the module

### Step 3: Configure the Git Module

| Setting | Value |
|---------|-------|
| **Display Name** | `CannaGrow Git Repo` |
| **Mode** | Push & Pull |
| **Repository URL** | `git@github.com:your-username/CannaGrow.git` (SSH) or `https://github.com/your-username/CannaGrow.git` (HTTPS) |
| **Branch** | `main` |
| **Content Path** | `/` |
| **Default File Extension** | `.md` |
| **Sync Interval** | Every 5 minutes |

**For SSH Authentication:**
1. Generate an SSH key pair (if you don't have one)
2. Add the public key to your Git hosting provider
3. Paste the private key into the **SSH Private Key** field in Wiki.js

**For HTTPS Authentication:**
1. Generate a Personal Access Token (PAT) from your Git provider
2. Use the PAT as the password in the authentication fields

### Step 4: Test and Sync

1. Click **Save**
2. Click **Sync** to trigger an immediate sync
3. Check **Sync History** for any errors
4. Verify pages appear in **Administration** > **Pages**

### Step 5: Verify the Import

After sync completes:

1. Visit the homepage at `https://wiki.yourdomain.com/home`
2. Check that the sidebar navigation is populated
3. Browse to **Strains** > **Index** and verify the master comparison table
4. Spot-check several pages to ensure content renders correctly

> **Reference:** For the complete import workflow including troubleshooting, see the [Import Guide](/IMPORT-GUIDE.md). For post-import site settings, see the [Configuration Guide](/setup/CONFIGURATION.md).

---

## 8. Backup Configuration

Protecting your wiki data is critical. This section covers database backups, Git sync as a backup mechanism, and automated scheduling.

### Database Backups

#### Manual Backup via Portainer

```bash
# Exec into the database container and create a dump
docker exec cannagrow-db pg_dump -U wikijs wikidb > /opt/cannagrow/backups/wikidb-backup-$(date +%Y%m%d).sql
```

#### Automated Backup Script

Create a backup script at `/opt/cannagrow/backup.sh`:

```bash
#!/bin/bash
# CannaGrow Wiki.js Database Backup Script

BACKUP_DIR="/opt/cannagrow/backups"
DB_CONTAINER="cannagrow-db"
DB_USER="wikijs"
DB_NAME="wikidb"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/wikidb-backup-$DATE.sql.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create compressed database dump
docker exec "$DB_CONTAINER" pg_dump -U "$DB_USER" "$DB_NAME" | gzip > "$BACKUP_FILE"

# Verify the backup was created
if [ -f "$BACKUP_FILE" ]; then
  echo "Backup successful: $BACKUP_FILE"
  echo "Size: $(du -h "$BACKUP_FILE" | cut -f1)"
else
  echo "ERROR: Backup failed!"
  exit 1
fi

# Remove backups older than 30 days
find "$BACKUP_DIR" -name "wikidb-backup-*.sql.gz" -mtime +30 -delete
echo "Cleaned up backups older than 30 days"
```

Make the script executable:

```bash
chmod +x /opt/cannagrow/backup.sh
```

#### Schedule with Cron

Add to your system crontab (`crontab -e`):

```cron
# Daily backup at 2:00 AM
0 2 * * * /opt/cannagrow/backup.sh >> /opt/cannagrow/backups/backup.log 2>&1
```

### Git Sync as Backup

With Git-backed storage configured, every edit in Wiki.js is automatically pushed to your Git repository. This serves as an additional backup layer:

| Backup Layer | What It Covers | Frequency |
|-------------|---------------|-----------|
| **Git Push** | All page content (markdown files) | Every 5 minutes (configured interval) |
| **Database Dump** | Complete state (pages, users, settings, uploads) | Daily (cron) |
| **Git Remote** | Off-site copy of all content | Continuous (on every push) |

### Restoring from Backup

#### Restore Database from Dump

```bash
# Stop the wiki container (keep DB running)
docker stop cannagrow-wiki

# Restore the database
docker exec -i cannagrow-db psql -U wikijs wikidb < /opt/cannagrow/backups/wikidb-backup-YYYYMMDD.sql

# Restart wiki container
docker start cannagrow-wiki
```

#### Restore from Git

If you need to restore content from Git:

1. Revert changes in your Git repository
2. In Wiki.js, go to **Administration** > **Storage**
3. Click **Sync** to pull the reverted content

### Backup Verification Checklist

- [ ] Database backup script runs successfully
- [ ] Backup files are non-zero size
- [ ] Backups are stored off the primary server (or in cloud storage)
- [ ] Restore procedure has been tested
- [ ] Git sync is actively pushing changes
- [ ] Old backups are being cleaned up (30-day rotation)

---

## 9. Monitoring and Logging

Portainer provides built-in monitoring tools to keep your wiki running smoothly.

### Container Health Monitoring

The docker-compose configuration includes health checks for both services. View health status in Portainer:

1. Go to **Containers**
2. Check the **Status** column:
   - **Running** (green) = healthy
   - **Running (unhealthy)** (yellow) = health check failing
   - **Stopped** (red) = container not running

### Viewing Logs in Portainer

#### Wiki.js Logs

1. Go to **Containers**
2. Click on `cannagrow-wiki`
3. Click the **Logs** tab
4. Use **Refresh** to get the latest logs
5. Use **Download** to save logs for analysis

```
# Typical healthy Wiki.js log output:
Loading configuration...
Starting Wiki.js...
Wiki.js is running on port 3000
```

#### PostgreSQL Logs

1. Click on `cannagrow-db`
2. Click the **Logs** tab

```
# Typical healthy PostgreSQL log output:
database system is ready to accept connections
```

> **Note:** The base configuration had logging disabled for PostgreSQL (`driver: "none"`). The Portainer deployment configuration enables `json-file` logging with rotation (10 MB max, 3 files) for troubleshooting capability.

### Stack Stats

1. Go to **Stacks**
2. Click on `cannagrow`
3. View:
   - **Container list** with status
   - **Resource usage** (CPU, Memory)
   - **Network** configuration
   - **Volumes** attached

### Resource Monitoring

Monitor resource usage to ensure your server has adequate capacity:

| Resource | Wiki.js | PostgreSQL | Total |
|----------|---------|-----------|-------|
| **CPU (idle)** | ~0.1% | ~0.1% | ~0.2% |
| **CPU (active)** | 2-5% | 1-3% | 3-8% |
| **Memory** | 200-400 MB | 100-300 MB | 300-700 MB |
| **Disk (base)** | ~50 MB | ~100 MB | ~150 MB |
| **Disk (with content)** | Grows with pages/assets | Grows with edits | Monitor regularly |

### Setting Up Alerts

Portainer does not include built-in alerting in the Community Edition. For production monitoring, consider:

- **Portainer Business Edition** -- Includes alerting and RBAC
- **External monitoring** -- Prometheus + Grafana, Uptime Kuma, or Healthchecks
- **Simple uptime check** -- Use a free service like UptimeRobot to ping `https://wiki.yourdomain.com` every 5 minutes

---

## 10. Troubleshooting

### Wiki.js Won't Start

**Symptom:** The `cannagrow-wiki` container fails to start or exits immediately.

**Check the logs:**
1. Go to **Containers** > `cannagrow-wiki` > **Logs**

**Common causes:**

| Issue | Solution |
|-------|----------|
| **Database not ready** | The `depends_on` health check should handle this. If not, restart the wiki container manually. |
| **Wrong database credentials** | Verify `DB_USER`, `DB_PASS`, and `DB_NAME` match the PostgreSQL environment variables. |
| **Port conflict** | Ensure port 3000 is not already in use: `netstat -tlnp | grep 3000` |
| **Image pull failed** | Check internet connectivity: `docker pull ghcr.io/requarks/wiki:2.5` |

### Cannot Connect to Wiki.js

**Symptom:** Browser shows "Connection refused" or "Site can't be reached."

**Checklist:**

1. Verify the container is running: `docker ps | grep cannagrow-wiki`
2. Check if the port is listening: `curl -I http://localhost:3000`
3. If using NPM, verify the proxy host is configured correctly
4. Check firewall rules: `ufw status` or `firewall-cmd --list-all`

### Database Connection Errors

**Symptom:** Wiki.js shows database connection error.

**Steps:**

```bash
# Test database connectivity from the wiki container
docker exec cannagrow-wiki wget -qO- http://db:5432 2>&1 | head -5

# Check if PostgreSQL is accepting connections
docker exec cannagrow-db pg_isready -U wikijs -d wikidb
```

**Solutions:**

| Issue | Solution |
|-------|----------|
| **Containers on different networks** | Ensure both containers are on `cannagrow-network` |
| **Wrong host name** | In Wiki.js env, `DB_HOST` must be `db` (the service name), not `localhost` |
| **Corrupted database** | Restore from backup (see Section 8) |

### Git Sync Fails

**Symptom:** Wiki.js storage sync shows errors.

**Common causes:**

| Issue | Solution |
|-------|----------|
| **SSH key not configured** | Add SSH private key in Storage settings |
| **Wrong repository URL** | Verify the Git URL is correct and accessible |
| **Branch doesn't exist** | Ensure the `main` branch exists in the remote repo |
| **Permission denied** | Verify the SSH key or PAT has write access to the repo |
| **Sync conflict** | Resolve conflicts in Git, then force-sync |

**Debug steps:**
1. Go to **Administration** > **Storage** > **Sync History**
2. Click the failed sync entry for detailed error message
3. Test connectivity from the server: `git ls-remote git@github.com:user/repo.git`

### SSL Certificate Issues

**Symptom:** Browser shows certificate errors or NPM cannot obtain a certificate.

**Checklist:**

1. Verify DNS points to your server: `dig wiki.yourdomain.com`
2. Ensure ports 80 and 443 are open and reachable
3. Check NPM logs for Let's Encrypt errors
4. Verify the domain name in NPM matches your DNS exactly

**Force certificate renewal:**
1. In NPM, go to **SSL Certificates**
2. Delete the existing certificate
3. Re-edit the proxy host and request a new certificate

### Nginx Proxy Manager Not Starting

**Symptom:** The NPM stack fails to deploy or the container won't start.

**Common causes:**

| Issue | Solution |
|-------|----------|
| **Port conflict on 80/443** | Another service (Apache, Nginx) is using the ports. Stop it first. |
| **Network not found** | Ensure `cannagrow-network` exists before deploying NPM. |
| **Volume permission issues** | Set correct ownership on bind-mounted directories. |

```bash
# Check for port conflicts
netstat -tlnp | grep -E ':(80|443) '

# Verify the network exists
docker network ls | grep cannagrow

# Create the network manually if missing
docker network create cannagrow-network
```

### Performance Issues

**Symptom:** Wiki.js is slow to load pages or respond to requests.

**Diagnostic steps:**

1. Check resource usage in Portainer (**Containers** > resource metrics)
2. Monitor database query times in PostgreSQL logs
3. Check for large assets inflating page load times
4. Verify the reverse proxy is caching static assets

**Optimization tips:**

- Enable **Cache Assets** in NPM proxy host settings
- Optimize images before uploading (use WebP format)
- Consider adding a Redis cache layer for high-traffic wikis
- Increase PostgreSQL shared buffers if RAM allows

---

## Quick Reference

### Portainer URLs

| Service | URL | Notes |
|---------|-----|-------|
| **Portainer UI** | `https://<server-ip>:9443` | Container management |
| **Wiki.js** | `https://wiki.yourdomain.com` | Your wiki (after SSL) |
| **Nginx Proxy Manager** | `http://<server-ip>:81` | Reverse proxy admin |
| **Wiki.js (direct)** | `http://<server-ip>:3000` | Bypass proxy (testing only) |

### Key Commands

| Task | Command |
|------|---------|
| View all containers | `docker ps -a` |
| View stack status | `docker stack ls` |
| Backup database | `docker exec cannagrow-db pg_dump -U wikijs wikidb > backup.sql` |
| Restart wiki | `docker restart cannagrow-wiki` |
| View wiki logs | `docker logs -f cannagrow-wiki` |
| Check resources | `docker stats` |

### File Reference

| File | Purpose |
|------|---------|
| [docker-compose.yml](/setup/docker-compose.yml) | Base Wiki.js deployment file |
| [Configuration Guide](/setup/CONFIGURATION.md) | Site settings, CSS, navigation |
| [Import Guide](/IMPORT-GUIDE.md) | Content import procedures |
| [README](/README.md) | Project overview and quick start |

---

## Next Steps

With CannaGrow deployed via Portainer:

1. **Complete the Wiki.js setup wizard** at `https://wiki.yourdomain.com`
2. **Import all CannaGrow content** following the [Import Guide](/IMPORT-GUIDE.md)
3. **Configure site settings** per the [Configuration Guide](/setup/CONFIGURATION.md)
4. **Set up the sidebar navigation** with the full site map
5. **Apply the custom CSS theme** for the green/nature aesthetic
6. **Configure automated backups** with the cron job from Section 8
7. **Set up user accounts** and configure access permissions

---

*This guide covers the complete Portainer deployment workflow for CannaGrow. For general deployment without Portainer, refer to the quick start in the [README](/README.md).*
