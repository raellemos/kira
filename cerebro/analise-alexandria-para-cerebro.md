# 🧠 ANÁLISE — Alexandria → Cerebro

> **Data:** 2026-04-25  
> **Analista:** Kira  
> **Fonte:** 119 arquivos da pasta `Alexandria TOT` (944KB)  
> **Objetivo:** Extrair lógica e estrutura da Alexandria corporativa que se aplica ao Cerebro pessoal

---

## 📊 O que a Alexandria É

Sistema corporativo da Totum — **biblioteca central digital** com:
- Banco de dados Supabase (PostgreSQL + pgvector)
- Embeddings vetoriais (Gemini 768D)
- Busca híbrida (semântica + full-text)
- Múltiplos agentes consultando simultaneamente
- Dashboard React/TypeScript
- Logs, analytics, auditoria

**Stack:** Supabase + Gemini + Node.js + React

---

## ✅ O que se Aplica ao Cerebro

### 1. Taxonomia Hierárquica
**Alexandria:** Domínios → Categorias → Subcategorias  
**Cerebro:** Áreas de Vida → Projetos → Notas

| Alexandria | Cerebro (adaptado) |
|---|---|
| `Infraestrutura` | `2-Areas-de-Vida/Totum-Trabalho/` |
| `Desenvolvimento` | `4-Sistemas/` (protocolos, workflows) |
| `Negócios` | `1-Projetos-Ativos/` |
| `Marketing` | `3-Recursos/Referencias/` |
| `Operações` | `4-Sistemas/Protocolos/` |
| `Pessoal` | `2-Areas-de-Vida/Familia/`, `Saude/`, `Criatividade/` |
| `Decisões` | Journals diários + páginas de decisão |

**Status:** ✅ Já implementado na estrutura PARA

---

### 2. Metadados e Frontmatter
**Alexandria:** `chunk_id`, `dominio`, `categoria`, `tags[]`, `keywords[]`, `entidades{}`, `autor`, `created_at`, `updated_at`, `source_file`, `confianca`  
**Cerebro:** YAML frontmatter em cada página `.md`

```yaml
---
title: "Título da Nota"
date: 2026-04-25
tags: [pessoal, projeto, saude]
categoria: "Área de Vida"
status: ativo | pendente | arquivado | concluido
autor: Rael
source: "[[Outra Página]]"
icone: 🧠
cor: "#3B82F6"
---
```

**Status:** ✅ Logseq já suporta YAML frontmatter nativamente

---

### 3. Chunking (Divisão em Pedacos)
**Alexandria:** Divide documentos grandes em chunks menores com embeddings  
**Cerebro:** Divide notas longas em páginas conectadas via `[[links]]`

**Exemplo:**
- Nota longa: "Minha Vida em Caixas" → vira página índice
- Cada "caixa" vira uma página filha: `[[Totum]]`, `[[Família]]`, `[[Saúde]]`
- Conexões naturais via links do Logseq

**Status:** ✅ Funcionalidade nativa do Logseq

---

### 4. Índices e Catalogos
**Alexandria:** `giles_dominios` + views SQL (`v_conhecimento_por_dominio`)  
**Cerebro:** Páginas de índice `.md` em cada pasta

| Alexandria | Cerebro |
|---|---|
| `giles_dominios` | `00-INDICE.md` (master) |
| `v_conhecimento_por_dominio` | `INDICE-Projetos.md`, `INDICE-Areas.md`, etc. |
| `v_autores_ativos` | Página `[[Quem Sou Eu]]` |

**Status:** ✅ Criado `00-INDICE.md` na raiz

---

### 5. Tags Padronizadas
**Alexandria:** `#dominio`, `#tipo`, `#status`, `#agente`, `#urgencia`  
**Cerebro:** Tags semânticas para classificação

```markdown
#sistema      → configurações, regras, setup
#agente      → Kira, Xavier, TOT
#decisao      → escolhas importantes
#memoria      → logs, diários, lembranças
#projeto      → Upixel, Asimov, novo projeto
#pessoal      → família, saúde, eu
#trabalho     → Totum, clientes, entregas
#recurso      → templates, dicas, referências
#pendente     → ações a fazer
#concluido    → finalizado
#arquivado    → histórico, não ativo
```

**Status:** 🟡 Definido, precisa ser usado consistentemente

---

### 6. Convenção de Nomes
**Alexandria:** `tipo_YYYYMMDD_HHMMSS_hash` (ex: `ctx_20260405_143022_a3f8b2`)  
**Cerebro:** Simplificado pra legibilidade

```
Formatos sugeridos:
- YYYY-MM-DD.md                 → Journals diários
- YYYY-MM-DD_nome-decisao.md   → Decisões datadas
- nome-projeto.md               → Projetos
- pop-nome-protocolo.md          → Protocolos
- template-nome.md              → Templates
- indice-area.md               → Índices
```

**Status:** 🟡 Definido, precisa ser documentado no protocolo

---

### 7. Protocolo de Acesso
**Alexandria:** `[DNA DO AGENTE] + [CONTEXTO ALEXANDRIA] + [A ORDEM]`  
**Cerebro:** Adaptado para uso pessoal

```
[KIRA SOUL] + [CONTEXTO CEREBRO] + [A ORDEM]

Exemplo:
"Kira, você sabe que eu tenho [[Totum]] e [[Família]]. 
No Cerebro tem uma nota sobre minha saúde. 
Me lembra o que eu escrevi sobre exercício?"

→ Kira lê SOUL.md (quem ela é)
→ Kira lê Cerebro (contexto)
→ Kira busca "exercício" nas páginas de Saúde
→ Kira responde com o que achou
```

**Status:** 🟡 Conceito definido, Xavier vai implementar

---

### 8. Memórias e Logs
**Alexandria:** `giles_consultas` — logs de toda consulta  
**Cerebro:** `memory/YYYY-MM-DD.md` — diário de interação

| Alexandria | Cerebro |
|---|---|
| `query_text` | Pergunta do Rael |
| `agente` | Quem respondeu (Kira, Xavier) |
| `resultados` | O que foi encontrado |
| `avaliacao` | Feedback (1-5) |
| `created_at` | Data automática |

**Status:** ✅ Já implementado (`memory/2026-04-24.md`, `2026-04-25.md`)

---

## ❌ O que NÃO se Aplica (corporativo/tecnológico)

| Componente Alexandria | Por que não aplica |
|---|---|
| **Supabase/pgvector** | Banco de dados corporativo. Cerebro usa filesystem + markdown. |
| **Embeddings 768D (Gemini)** | Requer API cloud e processamento. Logseq faz busca por texto. |
| **Funções RPC (SQL)** | APIs de backend. Cerebro é local, sem servidor. |
| **React/TypeScript components** | Frontend de dashboard. Cerebro é Logseq, já tem UI. |
| **Cliente Node.js** | Código de app. Cerebro não precisa de código. |
| **Múltiplos agentes consultando** | Cerebro é pessoal: Kira + Xavier (futuro). Não é multi-tenant. |
| **Dashboard de analytics** | Métricas corporativas. Uso pessoal não precisa dashboard. |
| **Views SQL** | Banco relacional. Cerebro usa grafos de links do Logseq. |
| **Backup para GitHub/GDrive** | Já temos sync via GitHub para Cerebro. |
| **Tabela `giles_sinonimos`** | Logseq resolve sinônimos via `[[aliases]]`. |

---

## 🎯 Resumo — O que Vamos Implementar no Cerebro

### Já Feito ✅
1. Estrutura PARA numérica (1-Projetos, 2-Areas, 3-Recursos, 4-Sistemas, 9-Arquivo)
2. Índice master (`00-INDICE.md`)
3. Memórias diárias (`memory/YYYY-MM-DD.md`)
4. Journals no Logseq
5. Sync GitHub automático

### Próximos Passos 🟡
6. **Templates de frontmatter YAML** para cada tipo de página
7. **Tags padronizadas** documentadas e usadas
8. **Xavier** — subagente organizador que:
   - Cataloga novas páginas
   - Suggest tags e categorias
   - Mantém índices atualizados
   - Encontra conexões entre notas
9. **Protocolo de acesso** formalizado
10. **Convenção de nomes** aplicada

### Futuro (não urgente) 🔮
11. Busca semântica local (via Ollama/embeddings no Mac)
12. Visualização de grafo de conhecimento (Logseq já tem isso)
13. Integração com Alexandria corporativa (quando Rael quiser)

---

## 📝 Templates Propostos

Ver `templates/` no Cerebro para:
- `template-projeto.md`
- `template-area-de-vida.md`
- `template-decisao.md`
- `template-memoria.md`
- `template-recurso.md`
- `template-protocolo.md`

---

*Análise concluída por: Kira*  
*Para: Rael*  
*Data: 2026-04-25*  
*Arquivos analisados: 119 | Tamanho: 944KB | Tempo: ~30 min*
