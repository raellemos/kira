# 🏛️ ALEXANDRIA — Referência Completa

> **Pasta:** `docs/alexandria/`  
> **Data de criação:** 2026-04-25  
> **Responsável:** TOT (Alibaba Cloud)  
> **Propósito:** Central única de referência sobre a Alexandria (biblioteca de conhecimento da Totum)

---

## 📦 O QUE ESTÁ NESTA PASTA

Tudo que você precisa saber sobre a Alexandria — **arquitetura, scripts, schemas, auditoria, e plano de ingestão**.

---

## 🗂️ ESTRUTURA

```
docs/alexandria/
├── README.md                          ← VOCÊ ESTÁ AQUI
│
├── 📁 auditoria/                      ← Relatórios e auditorias
│   ├── AUDITORIA_ALEXANDRIA_2026-04-25.md
│   └── MANIFESTO_INGESTAO_ALEXANDRIA_v2.md
│
├── 📁 estrutura/                      ← Especificações e arquitetura
│   ├── ESTRUTURA_ALEXANDRIA.md        ← Schema completo (SQL + RPC)
│   ├── inventario_alexandria.md
│   ├── code-grupototum-spec.md
│   └── PROMPT_MANUS_ALEXANDRIA.md     ← Prompt para Manus indexar
│
├── 📁 referencia/                     ← Documentos externos/análises
│   ├── ANALISE_CLAUDE_DISCORD_2026-04-25.md
│   └── GUIA_VAULT_ALEXANDRIA_MAC.md
│
├── 📁 scripts/                        ← Scripts de migração e teste
│   ├── migrate-pops-v2.mjs            ← ⭐ Script principal de ingestão
│   ├── roteiro-giles-ingestao.sh      ← ⭐ Roteiro batch (GILES)
│   ├── seed-decisoes.mjs              ← Seed da tabela decisoes
│   ├── seed-prompts.mjs               ← Seed da tabela prompts
│   ├── test-connection.mjs            ← Teste de conexão Supabase
│   ├── test-full-gemini.mjs           ← Teste Gemini embeddings
│   ├── test-ingestion-supabase.mjs    ← Teste de inserção
│   ├── test-rag.mjs                   ← Teste RAG (busca semântica)
│   ├── verificar-supabase.mjs         ← Verificação de dados
│   ├── check-embedding.mjs            ← Verifica embeddings existentes
│   ├── test-chunking.mjs              ← Testa chunking de markdown
│   ├── test-gemini-embeddings.mjs     ← Teste embeddings Gemini
│   ├── test-gemini-new.mjs            ← Teste Gemini novo
│   ├── migrate-pops.mjs               ← Versão antiga (v1)
│   └── run-sql.mjs                    ← Executor SQL via RPC
│
├── 📁 sql/                            ← Schemas e migrations SQL
│   ├── SUPABASE_MIGRATIONS.txt        ← Log de migrations executadas
│   ├── drizzle.config.ts              ← Config Drizzle ORM
│   └── 20260425160000_create_decisoes_prompts.sql  ← Cria decisoes + prompts
│
├── 📁 client/                         ← Código fonte do cliente Alexandria
│   └── ...                            ← (código React/TypeScript)
│
├── README.md                          ← Este arquivo
├── MIGRATION.md                       ← Documentação do processo de migração
├── TEST_RESULTS.md                    ← Resultados dos testes realizados
└── todo.md                            ← TODO do projeto-alexandria
```

---

## 🚀 QUICK START

### 1. Verificar estado atual da Alexandria

```bash
cd docs/alexandria/scripts
node verificar-supabase.mjs
```

### 2. Testar conexão

```bash
node test-connection.mjs
```

### 3. Testar embeddings (Gemini)

```bash
node test-full-gemini.mjs
```

### 4. Ingerir documentos (batch)

```bash
cd docs/alexandria/scripts
bash roteiro-giles-ingestao.sh list     # Listar arquivos
bash roteiro-giles-ingestao.sh 1        # Camada 1: Fundacionais
bash roteiro-giles-ingestao.sh all      # TODAS as camadas (3-4h)
```

---

## 🔧 STACK TÉCNICA

| Componente | Tecnologia | Status |
|---|---|---|
| **Banco de dados** | Supabase (PostgreSQL + pgvector) | ✅ Conectado |
| **Embeddings** | Google Gemini 2.0 Flash (768D MRL) | ✅ Funcionando |
| **Cliente** | Node.js + @supabase/supabase-js | ✅ Instalado |
| **Chunking** | Parser Markdown customizado | ✅ Implementado |
| **Busca** | Híbrida (vetorial + full-text) | ✅ Schema definido |
| **Domínios** | 6 domínios base | ✅ Configurado |

---

## 📊 ESTADO ATUAL (2026-04-25)

| Tabela | Registros | Status |
|---|---|---|
| `giles_knowledge` | 60 | ✅ Dados reais (POPs) |
| `giles_dominios` | 6 | ✅ Domínios configurados |
| `giles_consultas` | 0 | ⚠️ Nenhuma consulta logada |
| `decisoes` | 6 | ✅ Inserido hoje |
| `prompts` | 8 | ✅ Inserido hoje |

**Gap:** ~34 documentos ainda fora da Alexandria. Ver `MANIFESTO_INGESTAO_ALEXANDRIA_v2.md`.

---

## 🏷️ DOMÍNIOS CONFIGURADOS

| Domínio | Cor | Ícone | Descrição |
|---|---|---|---|
| Infraestrutura | #EF4444 | 🔧 | Servidores, redes, cloud |
| Desenvolvimento | #3B82F6 | 💻 | Software, código, APIs |
| Negócios | #10B981 | 💼 | Contratos, clientes, financeiro |
| Marketing | #F59E0B | 📢 | Campanhas, conteúdo, análise |
| Operações | #8B5CF6 | ⚙️ | Processos, equipe, rotinas |
| Pessoal | #EC4899 | 👥 | Time, cultura, documentação interna |

---

## 🔗 LINKS RÁPIDOS

| Documento | Caminho | O que resolve |
|---|---|---|
| **Schema completo** | `estrutura/ESTRUTURA_ALEXANDRIA.md` | SQL, tabelas, funções RPC |
| **Plano de ingestão** | `auditoria/MANIFESTO_INGESTAO_ALEXANDRIA_v2.md` | Inventário de 34 arquivos |
| **Auditoria** | `auditoria/AUDITORIA_ALEXANDRIA_2026-04-25.md` | Estado real do Supabase |
| **Script principal** | `scripts/migrate-pops-v2.mjs` | Ingestão batch com embeddings |
| **Roteiro GILES** | `scripts/roteiro-giles-ingestao.sh` | Executa por camadas |

---

## 🎛️ NOTA TOT

Esta pasta foi criada para ser **baixável** — você pode copiar `docs/alexandria/` inteira para qualquer máquina e ter toda a referência sobre a Alexandria.

**Próximo passo:** Executar `roteiro-giles-ingestao.sh all` para popular a Alexandria com os ~34 documentos pendentes.

---

*Organizado por TOT*  
*Data: 2026-04-25*
