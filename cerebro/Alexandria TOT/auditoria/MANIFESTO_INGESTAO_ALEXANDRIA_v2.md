# 📦 MANIFESTO DE INGESTÃO — ALEXANDRIA v2.0

> **Data:** 2026-04-25  
> **Responsável:** TOT (via GILES)  
> **Objetivo:** Organizar todo o conhecimento disperso do workspace para ingestão na Alexandria  
> **Status:** 🟡 Em organização — pronto para ingestão batch

---

## 🎯 VISÃO GERAL

A Alexandria tem **60 registros** (POPs migrados em 04/04).  
O workspace tem **~40+ documentos críticos** ainda **fora** da Alexandria.

Este manifesto organiza o que precisa ser ingerido, por **prioridade** e **domínio**, para que o processo de ingestão seja executado de forma metódica.

---

## 📊 INVENTÁRIO ATUAL

### Na Alexandria (✅)
| O que | Quantidade | Fonte |
|---|---|---|
| POPs | 60 registros | Migração 04/04 |
| Decisões | 6 registros | Inserido hoje (TOT) |
| Prompts | 8 registros | Inserido hoje (TOT) |
| Domínios | 6 | Configuração base |

### Fora da Alexandria (❌) — Este Manifesto
| Categoria | Estimativa | Prioridade |
|---|---|---|
| Fundacionais (DNA/Identidade) | 6 arquivos | 🔴 CRÍTICA |
| Arquitetura | 7 arquivos | 🔴 CRÍTICA |
| Infraestrutura/Operação | 8 arquivos | 🟡 ALTA |
| Agentes/Catálogos | 4 arquivos | 🟡 ALTA |
| Análises/Relatórios | 6 arquivos | 🟢 MÉDIA |
| Prompts/Skills | 8 arquivos | 🟢 MÉDIA |

**Total estimado:** ~39 arquivos

---

## 🔴 CAMADA 1 — FUNDACIONAIS (DNA DA TOTUM)

> **Sem esses, os agentes não sabem quem são nem quem é o Israel.**

### 1.1 Identidade do TOT
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 1.1 | `SOUL.md` | `/workspace/SOUL.md` | Quem sou eu, regras absolutas, roteamento, configuração | **Agentes** |
| 1.2 | `IDENTITY.md` | `/workspace/IDENTITY.md` | Nome, natureza, personalidade, regras absolutas | **Agentes** |
| 1.3 | `AGENTS.md` | `/workspace/AGENTS.md` | Regras de criação de agentes, bootstrap, memória | **Agentes** |
| 1.4 | `BOOTSTRAP.md` | `/workspace/BOOTSTRAP.md` | Instruções first-run (pode ser deletado depois) | **Agentes** |

### 1.2 Contexto do Israel
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 1.5 | `USER.md` | `/workspace/USER.md` | Perfil do Israel, história, família, sonhos | **Pessoal** |
| 1.6 | `MEMORY.md` | `/workspace/MEMORY.md` | Memória longa do ecossistema (feriás, lições) | **Pessoal** |

**Checklist ingestão Camada 1:**
- [ ] SOUL.md
- [ ] IDENTITY.md
- [ ] AGENTS.md
- [ ] BOOTSTRAP.md
- [ ] USER.md
- [ ] MEMORY.md

---

## 🔴 CAMADA 2 — ARQUITETURA (DECISÕES ESTRUTURAIS)

> **Sem esses, qualquer agente que tocar em arquitetura vai reverter erros já cometidos.**

### 2.1 Arquiteturas Oficiais
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 2.1 | `ARQUITETURA_TOTUM_CENTRAL.md` | `/docs/arquitetura/` | Visão central da arquitetura Totum | **Desenvolvimento** |
| 2.2 | `DECISAO_FINAL_ARQUITETURA_TOTUM.md` | `/docs/arquitetura/` | Decisões arquiteturais finais | **Desenvolvimento** |
| 2.3 | `ARQUITETURA-DISCORD-TOTUM.md` | `/docs/arquitetura/` | Proposta Discord (em revisão) | **Desenvolvimento** |
| 2.4 | `CONTEXT_HUB_ARCHITECTURE.md` | `/docs/arquitetura/` | Arquitetura do Context Hub | **Desenvolvimento** |
| 2.5 | `CENTRAL_CLIENTES_ARQUITETURA.md` | `/docs/arquitetura/` | Arquitetura da Central de Clientes | **Negócios** |
| 2.6 | `SLIDES_ARQUITETURA_TOTUM.html` | `/docs/arquitetura/` | Slides/apresentação da arquitetura | **Desenvolvimento** |

### 2.2 Sumários e Análises
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 2.7 | `RESUMO_ARQUITETURA.md` | `/workspace/` | Resumo executivo da arquitetura atual | **Desenvolvimento** |
| 2.8 | `DECISOES-PENDENCIAS.md` | `/workspace/` | Decisões pendentes de aprovação | **Decisões** |
| 2.9 | `ANALISE_CLAUDE_DISCORD_2026-04-25.md` | `/docs/analises/` | **(Novo)** Análise do Claude | **Decisões** |

**Checklist ingestão Camada 2:**
- [ ] ARQUITETURA_TOTUM_CENTRAL.md
- [ ] DECISAO_FINAL_ARQUITETURA_TOTUM.md
- [ ] ARQUITETURA-DISCORD-TOTUM.md
- [ ] CONTEXT_HUB_ARCHITECTURE.md
- [ ] CENTRAL_CLIENTES_ARQUITETURA.md
- [ ] RESUMO_ARQUITETURA.md
- [ ] DECISOES-PENDENCIAS.md
- [ ] ANALISE_CLAUDE_DISCORD_2026-04-25.md

---

## 🟡 CAMADA 3 — INFRAESTRUTURA E OPERAÇÃO

> **Sem esses, nenhum agente sabe onde os sistemas rodam nem como acessar.**

### 3.1 Infraestrutura
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 3.1 | `PLANO_MIGRACAO_ALIBABA_HOSTINGER.md` | `/workspace/` | Plano de migração entre VPS | **Infraestrutura** |
| 3.2 | `relatorio-auditoria-hostinger-alibaba.md` | `/workspace/` | Auditoria completa dos VPS | **Infraestrutura** |
| 3.3 | `SYNC_VPS_MAC_KIRA.md` | `/workspace/` | Sincronização VPS ↔ Mac | **Infraestrutura** |
| 3.4 | `PLANO_DE_REFATORACAO.md` | `/Apps_totum_Oficial/docs/auditoria/` | Plano de refatoração do Apps Totum | **Desenvolvimento** |

### 3.2 Operação e Diagnóstico
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 3.5 | `GUIA_DIAGNOSTICO_MAC.md` | `/workspace/` | Guia de diagnóstico do Mac | **Operações** |
| 3.6 | `GUIA_PRIMEIROS_SOCORROS_MAC.md` | `/workspace/` | Primeiros socorros Mac | **Operações** |
| 3.7 | `GUIA_VAULT_ALEXANDRIA_MAC.md` | `/workspace/` | Guia do Vault Alexandria no Mac | **Operações** |

### 3.3 Pendências e Relatórios
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 3.8 | `PENDENCIAS_FERIAS_ISRAEL.md` | `/workspace/` | Pendências acumuladas durante férias | **Operações** |
| 3.9 | `TODO_ATUAL.md` | `/workspace/` | TODO geral do ecossistema | **Operações** |

**Checklist ingestão Camada 3:**
- [ ] PLANO_MIGRACAO_ALIBABA_HOSTINGER.md
- [ ] relatorio-auditoria-hostinger-alibaba.md
- [ ] SYNC_VPS_MAC_KIRA.md
- [ ] GUIA_DIAGNOSTICO_MAC.md
- [ ] GUIA_PRIMEIROS_SOCORROS_MAC.md
- [ ] GUIA_VAULT_ALEXANDRIA_MAC.md
- [ ] PENDENCIAS_FERIAS_ISRAEL.md
- [ ] TODO_ATUAL.md

---

## 🟡 CAMADA 4 — AGENTES E CATÁLOGOS

> **Sem esses, agentes novos não sabem quem são os outros agentes.**

| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 4.1 | `AGENTES_TOTUM_CATALOGO_COMPLETO.md` | `/workspace/` | Catálogo completo de agentes (DNA) | **Agentes** |
| 4.2 | `AGENTES_POR_DEPARTAMENTO.md` | `/workspace/` | Organização de agentes por dept | **Agentes** |
| 4.3 | `TOTUM_AGENT_PROMPT.md` | `/workspace/` | Prompt principal do TOT | **Agentes** |
| 4.4 | `PROMPT_MAPA_TOTUM.md` | `/workspace/` | Prompt do Mapa Totum | **Agentes** |

**Checklist ingestão Camada 4:**
- [ ] AGENTES_TOTUM_CATALOGO_COMPLETO.md
- [ ] AGENTES_POR_DEPARTAMENTO.md
- [ ] TOTUM_AGENT_PROMPT.md
- [ ] PROMPT_MAPA_TOTUM.md

---

## 🟢 CAMADA 5 — PROMPTS E SKILLS

> **Contexto operacional para execução de tarefas.**

### 5.1 Skills Catalog
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 5.1 | `SKILLS_CATALOG_TOTUM.md` | `/workspace/` | Catálogo de skills disponíveis | **Desenvolvimento** |
| 5.2 | `prompt-completo-apps-totum.md` | `/workspace/` | Prompt completo do Apps Totum | **Desenvolvimento** |
| 5.3 | `prompt-analise-agentes-totum.md` | `/workspace/` | Prompt de análise de agentes | **Agentes** |
| 5.4 | `PROMPT_SINCRONIZACAO_GITHUB.md` | `/workspace/` | Prompt de sync GitHub | **Desenvolvimento** |
| 5.5 | `prompt-testes-apps-totum.md` | `/workspace/` | Prompt de testes Apps Totum | **Desenvolvimento** |
| 5.6 | `PROMPT_MASTER_V2_COMPARISON.md` | `/workspace/` | Comparação Prompt Master v2 | **Desenvolvimento** |
| 5.7 | `PROMPT_CLAUDE_CODE.md` | `/workspace/` | Prompt para Claude Code | **Desenvolvimento** |

### 5.2 Projetos e Propostas
| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 5.8 | `PROPOSTA_REORGANIZACAO_TOT.md` | `/workspace/` | Proposta de reorganização do TOT | **Operações** |
| 5.9 | `MAPA-TOTUM.md` | `/workspace/` | Mapa visual do ecossistema Totum | **Negócios** |
| 5.10 | `INDEX.md` | `/workspace/` | Índice de navegação do workspace | **Operações** |

**Checklist ingestão Camada 5:**
- [ ] SKILLS_CATALOG_TOTUM.md
- [ ] prompt-completo-apps-totum.md
- [ ] prompt-analise-agentes-totum.md
- [ ] PROMPT_SINCRONIZACAO_GITHUB.md
- [ ] prompt-testes-apps-totum.md
- [ ] PROPOSTA_REORGANIZACAO_TOT.md
- [ ] MAPA-TOTUM.md
- [ ] INDEX.md

---

## 🟢 CAMADA 6 — AUDITORIA ALEXANDRIA (META)

> **Documentação sobre o estado da própria Alexandria.**

| # | Arquivo | Caminho | O que contém | Domínio |
|---|---------|---------|--------------|---------|
| 6.1 | `AUDITORIA_ALEXANDRIA_2026-04-25.md` | `/docs/auditoria/` | Relatório de auditoria (este ciclo) | **Operações** |
| 6.2 | `ESTRUTURA_ALEXANDRIA.md` | `/tot-second-brain/notes/🏢 Totum/Arquitetura/` | Especificação da estrutura | **Desenvolvimento** |

---

## 📦 PLANO DE INGESTÃO BATCH

### Ferramenta: `migrate-pops-v2.mjs`
- Local: `/projeto-alexandria/migrate-pops-v2.mjs`
- Método: Gemini embeddings 768D (MRL)
- Rate limit: 300ms entre chunks, 2s entre arquivos
- Estimativa: **3-4 horas** para 39 arquivos

### Ordens de Execução

```
FASE 1: Fundacionais (6 arquivos) → ~30 min
  ├─ SOUL.md
  ├─ IDENTITY.md
  ├─ AGENTS.md
  ├─ BOOTSTRAP.md
  ├─ USER.md
  └─ MEMORY.md

FASE 2: Arquitetura (8 arquivos) → ~40 min
  ├─ ARQUITETURA_TOTUM_CENTRAL.md
  ├─ DECISAO_FINAL_ARQUITETURA_TOTUM.md
  ├─ ARQUITETURA-DISCORD-TOTUM.md
  ├─ CONTEXT_HUB_ARCHITECTURE.md
  ├─ CENTRAL_CLIENTES_ARQUITETURA.md
  ├─ RESUMO_ARQUITETURA.md
  ├─ DECISOES-PENDENCIAS.md
  └─ ANALISE_CLAUDE_DISCORD_2026-04-25.md

FASE 3: Infra + Operação (8 arquivos) → ~40 min
  ├─ PLANO_MIGRACAO_ALIBABA_HOSTINGER.md
  ├─ relatorio-auditoria-hostinger-alibaba.md
  ├─ SYNC_VPS_MAC_KIRA.md
  ├─ GUIA_DIAGNOSTICO_MAC.md
  ├─ GUIA_PRIMEIROS_SOCORROS_MAC.md
  ├─ GUIA_VAULT_ALEXANDRIA_MAC.md
  ├─ PENDENCIAS_FERIAS_ISRAEL.md
  └─ TODO_ATUAL.md

FASE 4: Agentes (4 arquivos) → ~20 min
  ├─ AGENTES_TOTUM_CATALOGO_COMPLETO.md
  ├─ AGENTES_POR_DEPARTAMENTO.md
  ├─ TOTUM_AGENT_PROMPT.md
  └─ PROMPT_MAPA_TOTUM.md

FASE 5: Prompts + Skills (8 arquivos) → ~40 min
  ├─ SKILLS_CATALOG_TOTUM.md
  ├─ prompt-completo-apps-totum.md
  ├─ prompt-analise-agentes-totum.md
  ├─ PROMPT_SINCRONIZACAO_GITHUB.md
  ├─ prompt-testes-apps-totum.md
  ├─ PROPOSTA_REORGANIZACAO_TOT.md
  ├─ MAPA-TOTUM.md
  └─ INDEX.md
```

---

## 🏷️ DOMÍNIOS ALEXANDRIA → MAPEAMENTO

| Domínio Alexandria | Arquivos deste Manifesto |
|---|---|
| **Agentes** | SOUL, IDENTITY, AGENTS, AGENTES_CATALOGO, AGENTES_DEPTO, TOTUM_AGENT_PROMPT |
| **Pessoal** | USER, MEMORY, BOOTSTRAP |
| **Desenvolvimento** | Arquiteturas (5), RESUMO, PLANO_REFATORACAO, SKILLS_CATALOG, prompts técnicos |
| **Infraestrutura** | PLANO_MIGRACAO, relatorio-auditoria, SYNC_VPS |
| **Negócios** | CENTRAL_CLIENTES_ARQUITETURA, MAPA-TOTUM |
| **Operações** | GUIAS (3), PENDENCIAS_FERIAS, TODO_ATUAL, PROPOSTA_REORGANIZACAO, INDEX |
| **Decisões** | DECISOES-PENDENCIAS, ANALISE_CLAUDE |

---

## ✅ CHECKLIST FINAL

- [ ] Camada 1 (Fundacionais) — 6 arquivos
- [ ] Camada 2 (Arquitetura) — 8 arquivos
- [ ] Camada 3 (Infra+Ops) — 8 arquivos
- [ ] Camada 4 (Agentes) — 4 arquivos
- [ ] Camada 5 (Prompts+Skills) — 8 arquivos
- [ ] **TOTAL: ~34 arquivos**

---

## 🎛️ NOTA TOT

Este manifesto é **o mapa**. A ingestão real precisa ser executada via script `migrate-pops-v2.mjs` com a API Gemini.

**Não faça manualmente.** São 34 arquivos, cada um com múltiplos chunks. O script automatiza chunking, embedding e inserção.

**Próximo passo:** Executar `node migrate-pops-v2.mjs --dir=/workspace --dominio=geral` (ou por camadas separadas).

---

*Manifesto criado por TOT*  
*Pronto para GILES executar a ingestão*
