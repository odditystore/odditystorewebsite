#!/usr/bin/env bash
# Deploy static site to Cloudflare Pages
# Usage: ./deploy.sh
# Requires: CLOUDFLARE_API_TOKEN env var (or ~/.cloudflare-token file)

set -e

PROJECT_NAME="odditystore-website"

# Load token from ~/.cloudflare-token if env var not set
if [ -z "$CLOUDFLARE_API_TOKEN" ] && [ -f "$HOME/.cloudflare-token" ]; then
  export CLOUDFLARE_API_TOKEN="$(cat "$HOME/.cloudflare-token")"
fi

if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
  echo "Error: CLOUDFLARE_API_TOKEN not set."
  echo "Either export it, or save to ~/.cloudflare-token"
  exit 1
fi

echo "Deploying to Cloudflare Pages project: $PROJECT_NAME"
npx wrangler pages deploy . \
  --project-name "$PROJECT_NAME" \
  --commit-dirty=true
