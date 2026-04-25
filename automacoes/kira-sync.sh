#!/bin/bash
# ============================================
# kira-sync.sh — Auto-commit & push para GitHub
# Roda silenciosamente em background
# ============================================

set -e

REPO_DIR="/Users/israellemos/.kimi_openclaw/workspace"
LOG_FILE="$REPO_DIR/automacoes/sync.log"
BRANCH="main"

# Garantir que o log existe
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] --- Sync iniciado ---" >> "$LOG_FILE"

cd "$REPO_DIR" || exit 1

# 1. Pull silencioso (se houver remote configurado)
if git remote get-url origin >/dev/null 2>&1; then
    git pull origin "$BRANCH" --quiet 2>/dev/null || true
fi

# 2. Verificar se há mudanças
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Nada para commitar" >> "$LOG_FILE"
    exit 0
fi

# 3. Stage tudo (respeitando .gitignore)
git add -A

# 4. Gerar mensagem de commit
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
# Tenta extrair última ação do contexto (fallback genérico)
last_action="sync automático"
commit_msg="sync: $timestamp — $last_action"

# 5. Commit
git commit -m "$commit_msg" --quiet

# 6. Push (se houver remote)
if git remote get-url origin >/dev/null 2>&1; then
    git push origin "$BRANCH" --quiet
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Push realizado: $commit_msg" >> "$LOG_FILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Commit local (sem remote): $commit_msg" >> "$LOG_FILE"
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] --- Sync finalizado ---" >> "$LOG_FILE"
