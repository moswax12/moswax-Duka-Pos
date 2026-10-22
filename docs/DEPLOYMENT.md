# Moswax POS - Deployment Guide

## 1. Prerequisites
- Node.js v18+
- PostgreSQL v14+
- Docker & Docker Compose (Recommended)
- SSL Certificate (Let's Encrypt)

## 2. Environment Variables (.env)
```bash
# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=moswax_user
DB_PASSWORD=secure_password
DB_NAME=moswax_pos

# App
NODE_ENV=production
JWT_SECRET=super_secure_secret_key
PORT=3000
FRONTEND_URL=https://pos.moswax.com

# Offline Sync
SYNC_INTERVAL=30000
