#!/bin/bash

# auto-pull.sh — Atualiza contexto ao iniciar Kimi Claw Mac
# Executar no início de cada sessão

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

echo "[auto-pull] Buscando atualizações do VPS..."
git pull origin main --rebase

echo "[auto-pull] Contexto atualizado."
