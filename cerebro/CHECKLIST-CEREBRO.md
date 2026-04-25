---
title: "Checklist — Configurar Cerebro no Logseq"
date: 2026-04-25
tags: [checklist, setup, cerebro, logseq]
status: em-andamento
icone: ✅
---

# ✅ Checklist — Configurar Cerebro no Logseq

> **Versão:** 1.0  
> **Para:** Rael  
> **Data:** 2026-04-25  
> **Objetivo:** Deixar o Cerebro 100% funcional no dia a dia

---

## 🔵 FASE 1 — Setup Inicial (Cerebro aberto)

### 1.1 Abrir Graph "Cerebro"
- [ ] Abrir Logseq
- [ ] Menu → **Adicionar novo graph** (ou "Add new graph")
- [ ] Navegar até: `~/Documents/Kira/`
- [ ] Clicar em **Abrir** (ou "Open")
- [ ] Nomear o graph: **`Cerebro`**
- [ ] Confirmar que abriu sem erro

### 1.2 Configurar Idioma (se precisar)
- [ ] Menu → **Configurações** (⚙️)
- [ ] Aba **Editor** ou **General**
- [ ] Idioma da interface: **Português** (confirmar)
- [ ] Fechar configurações

### 1.3 Adicionar aos Favoritos (⭐)
Clique em **Favoritos** no menu lateral esquerdo, depois **Adicionar aos favoritos**:
- [ ] `[[Minha Vida em Caixas]]` — sua página inicial
- [ ] `[[MAPA-AI]]` — índice do arsenal de IA
- [ ] `[[INSTRUCOES-LOGSEQ]]` — este manual
- [ ] `[[XAVIER-DNA]]` — DNA do organizador

---

## 🟢 FASE 2 — Templates (reutilizáveis)

### 2.1 Criar Página "Templates"
- [ ] Clicar em **Nova página** (ou usar diário e criar link `[[Templates]]`)
- [ ] Clicar no link → criar a página
- [ ] Copiar conteúdo dos arquivos em `~/Documents/Kira/templates/`
- [ ] Colar no Logseq
- [ ] O Logseq reconhece automaticamente como templates

### 2.2 Testar Templates
- [ ] No diário de hoje, digitar `/` → ver menu de templates
- [ ] Escolher **Projeto** → preencher com teste
- [ ] Escolher **Área de Vida** → preencher com teste
- [ ] Escolher **Decisão** → preencher com teste
- [ ] Confirmar que salvou e aparece nas páginas

---

## 🟡 FASE 3 — Testar Funcionalidades Básicas

### 3.1 Links `[[ ]]`
- [ ] No diário, escrever: `Hoje pensei sobre [[Totum]] e [[Família]].`
- [ ] Clicar em `[[Totum]]` → nova página criada
- [ ] Clicar em `[[Família]]` → nova página criada
- [ ] Voltar ao diário → confirmar que os links estão azuis

### 3.2 Tags `#`
- [ ] Na página `[[Totum]]`, adicionar: `#trabalho #projeto`
- [ ] Na página `[[Família]]`, adicionar: `#pessoal #area-de-vida`
- [ ] Clicar na tag → ver se lista páginas relacionadas

### 3.3 Frontmatter YAML
- [ ] Criar nova página de teste
- [ ] Adicionar no topo:
  ```yaml
  ---
  title: "Teste"
  date: 2026-04-25
  tags: [teste]
  status: ativo
  ---
  ```
- [ ] Confirmar que o Logseq reconhece (aparece formatado ou destacado)

### 3.4 Busca
- [ ] Pressionar `Cmd + K` → buscar "Totum"
- [ ] Confirmar que acha a página
- [ ] Pressionar `Cmd + Shift + K` → busca global
- [ ] Confirmar que acha tudo

### 3.5 Gráfico de Conexões
- [ ] Clicar no ícone de **Grafo** (canto superior direito)
- [ ] Ver visualização das conexões
- [ ] Clicar em um nó → ir para a página
- [ ] Fechar grafo

---

## 🟠 FASE 4 — Organizar a Estrutura PARA

### 4.1 Criar Índice por Área
No Cerebro, crie páginas-índice (só título e links):
- [ ] `[[ÍNDICE — Projetos Ativos]]`
  - Conteúdo: `[[Upixel]]` `[[Asimov]]` `[[Novo Projeto]]`
- [ ] `[[ÍNDICE — Áreas de Vida]]`
  - Conteúdo: `[[Totum-Trabalho]]` `[[Família]]` `[[Saúde]]` `[[Finanças]]` `[[Criatividade]]`
- [ ] `[[ÍNDICE — Recursos]]`
  - Conteúdo: `[[AI]]` `[[Dicas]]` `[[Referências]]` `[[Templates]]`
- [ ] `[[ÍNDICE — Sistemas]]`
  - Conteúdo: `[[Protocolos]]` `[[Workflows]]` `[[Automações]]`

### 4.2 Adicionar Índices aos Favoritos
- [ ] Adicionar `[[ÍNDICE — Projetos Ativos]]` aos favoritos
- [ ] Adicionar `[[ÍNDICE — Áreas de Vida]]` aos favoritos
- [ ] Adicionar `[[ÍNDICE — Recursos]]` aos favoritos
- [ ] Adicionar `[[ÍNDICE — Sistemas]]` aos favoritos

---

## 🔴 FASE 5 — Testar o Sync (automático)

### 5.1 Verificar Sync Manualmente
- [ ] Escrever algo novo no diário (qualquer coisa)
- [ ] Abrir Terminal
- [ ] Rodar: `cd ~/.kimi_openclaw/workspace && ./automacoes/auto-sync.sh`
- [ ] Confirmar que aparece: "Sincronizado em [data]"

### 5.2 Verificar no GitHub
- [ ] Abrir navegador → https://github.com/raellemos/kira
- [ ] Verificar pasta `cerebro/`
- [ ] Confirmar que o que você escreveu apareceu lá
- [ ] Se não apareceu, me avisar

### 5.3 Confirmar Cron Job
- [ ] O sync automático roda a **cada 1 hora**
- [ ] Não precisa fazer nada — funciona sozinho
- [ ] Se quiser forçar: rode o script manualmente (passo 5.1)

---

## 🟣 FASE 6 — Primeira Nota Real (obrigatório)

### 6.1 Escrever no Diário de Hoje
- [ ] Ir em **Diários** (Journals) no menu lateral
- [ ] Escrever pelo menos 3 linhas sobre hoje
- [ ] Usar pelo menos 1 link `[[ ]]`
- [ ] Usar pelo menos 1 tag `#`
- [ ] Salvar (Ctrl+S ou Cmd+S)

### 6.2 Criar Primeira Página de Decisão
- [ ] Criar página: `[[Decisão: Criar Cerebro]]`
- [ ] Copiar template de `template-decisao.md`
- [ ] Preencher: contexto, decisão, por que, quando
- [ ] Salvar
- [ ] Adicionar link no diário de hoje

---

## ⚫ FASE 7 — Verificar Se Tudo Funciona

### 7.1 Fechar e Reabrir
- [ ] Fechar Logseq completamente (Cmd + Q)
- [ ] Reabrir Logseq
- [ ] Confirmar que o graph "Cerebro" abre automaticamente
- [ ] Confirmar que tudo que escreveu está lá

### 7.2 Teste de Stress
- [ ] Criar 5 páginas rápidas com links entre elas
- [ ] Clicar em links pra frente e pra trás
- [ ] Confirmar que não trava
- [ ] Confirmar que não perde nada

---

## ✅ Quando terminar tudo isso

O Cerebro está **100% funcional**. Pode usar no dia a dia.

Próximo passo (depois): adicionar **Alexandria** como segundo graph.

---

*Criado por: Kira*  
*Para: Rael*  
*Data: 2026-04-25*
