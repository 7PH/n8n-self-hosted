# Self-hosted N8N

This repository is a starter-pack to get a self-hosted [N8N](https://n8n.io) instance with:
- A containerized setup (docker)
- Automatic TLS certificate from [Let's Encrypt](https://letsencrypt.org)
- Basic authentication
- An export/import workflow to export/import current workflows and credentials to local folders
- A persistent encryption key to keep your credentials across losing your container

## Install

```bash
# 1. Clone the repository
git clone https://github.com/7PH/n8n-self-hosted.git
cd n8n-self-hosted

# 2. Copy `.env.template` to `.env` and tweak the environment variables
#    In particular, ensure `N8N_ENCRYPTION_KEY` is set
cp .env.template .env

# 3. Run `docker compose up`
docker compose up
```
