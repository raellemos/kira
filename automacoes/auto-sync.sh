#!/bin/bash

# auto-sync.sh — Sincronização automática com GitHub
# Inclui: workspace Kimi + vault Cerebro (Logseq)

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CEREBRO_DIR="/Users/israellemos/Documents/Kira"
cd "$REPO_DIR"

# === PASSO 1: Copiar vault Cerebro para o repo ===
if [ -d "$CEREBRO_DIR" ]; then
    echo "[auto-sync] Copiando Cerebro..."
    mkdir -p "$REPO_DIR/cerebro"
    # Copia tudo, preservando estrutura
    cp -R "$CEREBRO_DIR/"* "$REPO_DIR/cerebro/" 2>/dev/null
    # Remove lixo do Logseq que não precisa versionar
    rm -rf "$REPO_DIR/cerebro/logseq/bak" 2>/dev/null
    rm -rf "$REPO_DIR/cerebro/.DS_Store" 2>/dev/null
    echo "[auto-sync] Cerebro copiado."
else
    echo "[auto-sync] ⚠️ Cerebro não encontrado em $CEREBRO_DIR"
fi

# === PASSO 2: Verificar mudanças ===
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "[auto-sync] Nada para sincronizar."
    exit 0
fi

# === PASSO 3: Commit e Push ===
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
BRANCH=$(git rev-parse --abbrev-ref HEAD)

git add -A

git commit -m "sync: [$TIMESTAMP] — sincronização automática" \
           -m "Branch: $BRANCH" \
           -m "Arquivos modificados: $(git diff --cached --name-only | wc -l)" \
           -m "Inclui: workspace Kimi + vault Cerebro"

git push origin main

echo "[auto-sync] Sincronizado em $TIMESTAMP"
