#!/bin/bash

# auto-sync.sh — Sincronização automática com GitHub
# Executa a cada interação no Kimi Claw Mac

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

# Verificar se há mudanças
if git diff --quiet && git diff --cached --quiet; then
    echo "[auto-sync] Nada para sincronizar."
    exit 0
fi

# Timestamp e resumo automático
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Adicionar tudo (respeitando .gitignore)
git add -A

# Commit com mensagem descritiva
git commit -m "sync: [$TIMESTAMP] — sincronização automática Kimi Claw Mac" \
           -m "Branch: $BRANCH" \
           -m "Arquivos modificados: $(git diff --cached --name-only | wc -l)"

# Push para o GitHub
git push origin main

echo "[auto-sync] Sincronizado em $TIMESTAMP"
