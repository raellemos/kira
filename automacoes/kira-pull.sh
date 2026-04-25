#!/bin/bash
# ============================================
# kira-pull.sh — Sincronização bidirecional
# Executar ao iniciar sessão para pegar atualizações do VPS
# ============================================

set -e

REPO_DIR="/Users/israellemos/.kimi_openclaw/workspace"
LOG_FILE="$REPO_DIR/automacoes/sync.log"
BRANCH="main"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] --- Pull iniciado ---" >> "$LOG_FILE"

cd "$REPO_DIR" || exit 1

if git remote get-url origin >/dev/null 2>&1; then
    git stash --quiet 2>/dev/null || true
    git pull origin "$BRANCH" --quiet
    git stash pop --quiet 2>/dev/null || true
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Pull realizado com sucesso" >> "$LOG_FILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] AVISO: Remote não configurado" >> "$LOG_FILE"
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] --- Pull finalizado ---" >> "$LOG_FILE"
