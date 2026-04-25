#!/bin/bash
###############################################################################
# ROTEIRO GILES — INGESTÃO BATCH ALEXANDRIA v2.0
# Responsável: GILES (Gemini 2.0 Flash) | Orquestrador: TOT
# Data: 2026-04-25
###############################################################################
#
# USO:
#   cd /root/.openclaw/workspace/projeto-alexandria
#   bash roteiro-giles-ingestao.sh [camada]
#
#   camada: all | 1 | 2 | 3 | 4 | 5
#
###############################################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="/root/.openclaw/workspace"
MIGRATE_SCRIPT="$SCRIPT_DIR/migrate-pops-v2.mjs"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

log() { echo -e "${CYAN}[GILES]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
error() { echo -e "${RED}[ERRO]${NC} $1"; }

###############################################################################
# CONFIGURAÇÃO DAS CAMADAS
###############################################################################

# Camada 1: Fundacionais
CAMADA1_FILES=(
  "$WORKSPACE_DIR/SOUL.md"
  "$WORKSPACE_DIR/IDENTITY.md"
  "$WORKSPACE_DIR/AGENTS.md"
  "$WORKSPACE_DIR/BOOTSTRAP.md"
  "$WORKSPACE_DIR/USER.md"
  "$WORKSPACE_DIR/MEMORY.md"
)

# Camada 2: Arquitetura
CAMADA2_FILES=(
  "$WORKSPACE_DIR/docs/arquitetura/ARQUITETURA_TOTUM_CENTRAL.md"
  "$WORKSPACE_DIR/docs/arquitetura/DECISAO_FINAL_ARQUITETURA_TOTUM.md"
  "$WORKSPACE_DIR/docs/arquitetura/ARQUITETURA-DISCORD-TOTUM.md"
  "$WORKSPACE_DIR/docs/arquitetura/CONTEXT_HUB_ARCHITECTURE.md"
  "$WORKSPACE_DIR/docs/arquitetura/CENTRAL_CLIENTES_ARQUITETURA.md"
  "$WORKSPACE_DIR/RESUMO_ARQUITETURA.md"
  "$WORKSPACE_DIR/DECISOES-PENDENCIAS.md"
  "$WORKSPACE_DIR/docs/analises/ANALISE_CLAUDE_DISCORD_2026-04-25.md"
)

# Camada 3: Infra + Operação
CAMADA3_FILES=(
  "$WORKSPACE_DIR/PLANO_MIGRACAO_ALIBABA_HOSTINGER.md"
  "$WORKSPACE_DIR/relatorio-auditoria-hostinger-alibaba.md"
  "$WORKSPACE_DIR/SYNC_VPS_MAC_KIRA.md"
  "$WORKSPACE_DIR/GUIA_DIAGNOSTICO_MAC.md"
  "$WORKSPACE_DIR/GUIA_PRIMEIROS_SOCORROS_MAC.md"
  "$WORKSPACE_DIR/GUIA_VAULT_ALEXANDRIA_MAC.md"
  "$WORKSPACE_DIR/PENDENCIAS_FERIAS_ISRAEL.md"
  "$WORKSPACE_DIR/TODO_ATUAL.md"
)

# Camada 4: Agentes
CAMADA4_FILES=(
  "$WORKSPACE_DIR/AGENTES_TOTUM_CATALOGO_COMPLETO.md"
  "$WORKSPACE_DIR/AGENTES_POR_DEPARTAMENTO.md"
  "$WORKSPACE_DIR/TOTUM_AGENT_PROMPT.md"
  "$WORKSPACE_DIR/PROMPT_MAPA_TOTUM.md"
)

# Camada 5: Prompts + Skills
CAMADA5_FILES=(
  "$WORKSPACE_DIR/SKILLS_CATALOG_TOTUM.md"
  "$WORKSPACE_DIR/prompt-completo-apps-totum.md"
  "$WORKSPACE_DIR/prompt-analise-agentes-totum.md"
  "$WORKSPACE_DIR/PROMPT_SINCRONIZACAO_GITHUB.md"
  "$WORKSPACE_DIR/prompt-testes-apps-totum.md"
  "$WORKSPACE_DIR/PROPOSTA_REORGANIZACAO_TOT.md"
  "$WORKSPACE_DIR/MAPA-TOTUM.md"
  "$WORKSPACE_DIR/INDEX.md"
)

###############################################################################
# FUNÇÕES
###############################################################################

verificar_pre_requisitos() {
  log "Verificando pré-requisitos..."
  
  if [ ! -f "$MIGRATE_SCRIPT" ]; then
    error "Script de migração não encontrado: $MIGRATE_SCRIPT"
    exit 1
  fi
  
  if ! command -v node &> /dev/null; then
    error "Node.js não encontrado"
    exit 1
  fi
  
  success "Node.js disponível: $(node --version)"
  
  # Verificar se dependências estão instaladas
  if [ ! -d "$SCRIPT_DIR/node_modules" ]; then
    warn "node_modules não encontrado. Instalando dependências..."
    cd "$SCRIPT_DIR" && npm install
  fi
  
  success "Pré-requisitos OK"
}

criar_diretorio_temp() {
  TEMP_DIR=$(mktemp -d -t alexandria-ingest-XXXX)
  log "Diretório temporário: $TEMP_DIR"
  echo "$TEMP_DIR"
}

preparar_camada() {
  local camada_num=$1
  local temp_dir=$2
  shift 2
  local files=("$@")
  
  log "Preparando Camada $camada_num (${#files[@]} arquivos)..."
  
  local camada_dir="$temp_dir/camada$camada_num"
  mkdir -p "$camada_dir"
  
  local count=0
  for file in "${files[@]}"; do
    if [ -f "$file" ]; then
      cp "$file" "$camada_dir/"
      ((count++))
    else
      warn "Arquivo não encontrado: $file"
    fi
  done
  
  success "$count arquivos copiados para $camada_dir"
  echo "$camada_dir"
}

executar_ingestao() {
  local camada_dir=$1
  local dominio=$2
  
  log "Executando ingestão: $camada_dir (domínio: $dominio)..."
  
  cd "$SCRIPT_DIR"
  
  # Executar migrate-pops-v2.mjs com dry-run primeiro
  log "  → Dry-run (simulação)..."
  node migrate-pops-v2.mjs --dir="$camada_dir" --dominio="$dominio" --dry-run
  
  read -p "  Prosseguir com ingestão real? [y/N] " confirm
  if [[ $confirm == [yY] ]]; then
    log "  → Ingestão real..."
    node migrate-pops-v2.mjs --dir="$camada_dir" --dominio="$dominio"
    success "Ingestão concluída para $camada_dir"
  else
    warn "Ingestão cancelada pelo operador"
    return 1
  fi
}

###############################################################################
# MENU PRINCIPAL
###############################################################################

mostrar_menu() {
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "  ROTEIRO GILES — INGESTÃO BATCH ALEXANDRIA v2.0"
  echo "═══════════════════════════════════════════════════════════════"
  echo ""
  echo "  Uso: bash $0 [opção]"
  echo ""
  echo "  Opções:"
  echo "    1    → Camada 1: Fundacionais (DNA/Identidade)"
  echo "    2    → Camada 2: Arquitetura (Decisões Estruturais)"
  echo "    3    → Camada 3: Infra + Operação"
  echo "    4    → Camada 4: Agentes + Catálogos"
  echo "    5    → Camada 5: Prompts + Skills"
  echo "    all  → Todas as camadas (sequencial)"
  echo "    list → Listar arquivos por camada"
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
}

listar_arquivos() {
  echo ""
  echo "📦 CAMADA 1: Fundacionais (${#CAMADA1_FILES[@]} arquivos)"
  for f in "${CAMADA1_FILES[@]}"; do
    [ -f "$f" ] && echo "   ✅ $(basename $f)" || echo "   ❌ $(basename $f) (NÃO ENCONTRADO)"
  done
  
  echo ""
  echo "📦 CAMADA 2: Arquitetura (${#CAMADA2_FILES[@]} arquivos)"
  for f in "${CAMADA2_FILES[@]}"; do
    [ -f "$f" ] && echo "   ✅ $(basename $f)" || echo "   ❌ $(basename $f) (NÃO ENCONTRADO)"
  done
  
  echo ""
  echo "📦 CAMADA 3: Infra + Operação (${#CAMADA3_FILES[@]} arquivos)"
  for f in "${CAMADA3_FILES[@]}"; do
    [ -f "$f" ] && echo "   ✅ $(basename $f)" || echo "   ❌ $(basename $f) (NÃO ENCONTRADO)"
  done
  
  echo ""
  echo "📦 CAMADA 4: Agentes (${#CAMADA4_FILES[@]} arquivos)"
  for f in "${CAMADA4_FILES[@]}"; do
    [ -f "$f" ] && echo "   ✅ $(basename $f)" || echo "   ❌ $(basename $f) (NÃO ENCONTRADO)"
  done
  
  echo ""
  echo "📦 CAMADA 5: Prompts + Skills (${#CAMADA5_FILES[@]} arquivos)"
  for f in "${CAMADA5_FILES[@]}"; do
    [ -f "$f" ] && echo "   ✅ $(basename $f)" || echo "   ❌ $(basename $f) (NÃO ENCONTRADO)"
  done
  echo ""
}

###############################################################################
# EXECUÇÃO
###############################################################################

main() {
  local opcao=${1:-help}
  
  case "$opcao" in
    1|2|3|4|5)
      verificar_pre_requisitos
      TEMP_DIR=$(criar_diretorio_temp)
      
      case "$opcao" in
        1) CAMADA_DIR=$(preparar_camada 1 "$TEMP_DIR" "${CAMADA1_FILES[@]}")
           executar_ingestao "$CAMADA_DIR" "agentes"
           ;;
        2) CAMADA_DIR=$(preparar_camada 2 "$TEMP_DIR" "${CAMADA2_FILES[@]}")
           executar_ingestao "$CAMADA_DIR" "desenvolvimento"
           ;;
        3) CAMADA_DIR=$(preparar_camada 3 "$TEMP_DIR" "${CAMADA3_FILES[@]}")
           executar_ingestao "$CAMADA_DIR" "infraestrutura"
           ;;
        4) CAMADA_DIR=$(preparar_camada 4 "$TEMP_DIR" "${CAMADA4_FILES[@]}")
           executar_ingestao "$CAMADA_DIR" "agentes"
           ;;
        5) CAMADA_DIR=$(preparar_camada 5 "$TEMP_DIR" "${CAMADA5_FILES[@]}")
           executar_ingestao "$CAMADA_DIR" "desenvolvimento"
           ;;
      esac
      
      # Limpeza
      rm -rf "$TEMP_DIR"
      success "Temporários removidos"
      ;;
    
    all)
      verificar_pre_requisitos
      TEMP_DIR=$(criar_diretorio_temp)
      
      log "══════════════════════════════════════════════════════════"
      log "  INGESTÃO COMPLETA — TODAS AS CAMADAS"
      log "  Tempo estimado: 3-4 horas"
      log "══════════════════════════════════════════════════════════"
      
      read -p "Confirma ingestão de TODAS as camadas? [y/N] " confirm_all
      if [[ $confirm_all != [yY] ]]; then
        warn "Ingestão cancelada"
        rm -rf "$TEMP_DIR"
        exit 0
      fi
      
      # Camada 1
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  CAMADA 1: FUNDACIONAIS"
      log "══════════════════════════════════════════════════════════"
      CAMADA1_DIR=$(preparar_camada 1 "$TEMP_DIR" "${CAMADA1_FILES[@]}")
      node "$MIGRATE_SCRIPT" --dir="$CAMADA1_DIR" --dominio="agentes"
      
      # Camada 2
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  CAMADA 2: ARQUITETURA"
      log "══════════════════════════════════════════════════════════"
      CAMADA2_DIR=$(preparar_camada 2 "$TEMP_DIR" "${CAMADA2_FILES[@]}")
      node "$MIGRATE_SCRIPT" --dir="$CAMADA2_DIR" --dominio="desenvolvimento"
      
      # Camada 3
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  CAMADA 3: INFRA + OPERAÇÃO"
      log "══════════════════════════════════════════════════════════"
      CAMADA3_DIR=$(preparar_camada 3 "$TEMP_DIR" "${CAMADA3_FILES[@]}")
      node "$MIGRATE_SCRIPT" --dir="$CAMADA3_DIR" --dominio="infraestrutura"
      
      # Camada 4
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  CAMADA 4: AGENTES"
      log "══════════════════════════════════════════════════════════"
      CAMADA4_DIR=$(preparar_camada 4 "$TEMP_DIR" "${CAMADA4_FILES[@]}")
      node "$MIGRATE_SCRIPT" --dir="$CAMADA4_DIR" --dominio="agentes"
      
      # Camada 5
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  CAMADA 5: PROMPTS + SKILLS"
      log "══════════════════════════════════════════════════════════"
      CAMADA5_DIR=$(preparar_camada 5 "$TEMP_DIR" "${CAMADA5_FILES[@]}")
      node "$MIGRATE_SCRIPT" --dir="$CAMADA5_DIR" --dominio="desenvolvimento"
      
      # Limpeza
      rm -rf "$TEMP_DIR"
      
      log ""
      log "══════════════════════════════════════════════════════════"
      log "  ✅ INGESTÃO COMPLETA CONCLUÍDA"
      log "══════════════════════════════════════════════════════════"
      ;;
    
    list)
      listar_arquivos
      ;;
    
    help|*)
      mostrar_menu
      ;;
  esac
}

main "$@"