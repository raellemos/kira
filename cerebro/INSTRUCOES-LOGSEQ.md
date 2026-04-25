---
title: "Instruções Logseq — Conectando ao Cerebro"
date: 2026-04-25
tags: [sistema, logseq, setup]
status: ativo
icone: 📖
---

# 📖 Instruções — Conectar Logseq ao Cerebro

> **Última atualização:** 2026-04-25  
> **Para:** Rael  
> **Status:** Pronto para usar

---

## ✅ O que já está pronto

1. ✅ **Vault Cerebro criado** em `~/Documents/Kira/`
2. ✅ **Sync GitHub configurado** — envia automático pro repo `raellemos/kira`
3. ✅ **Estrutura PARA** implementada (1-Projetos, 2-Areas, 3-Recursos, 4-Sistemas, 9-Arquivo)
4. ✅ **Templates** criados (projeto, área, decisão, memória, recurso, protocolo)
5. ✅ **Xavier definido** — subagente organizador

---

## 🚀 Passo a Passo no Logseq

### 1. Abrir o Logseq

Abra o app Logseq no Mac.

### 2. Criar / Abrir o Graph

**Se for a PRIMEIRA vez:**
1. Clique em **"Add new graph"**
2. Navegue até: `~/Documents/Kira/`
3. Clique em **"Open"**
4. Nomeie o graph: **`Cerebro`**

**Se já tiver um graph:**
1. Clique no nome do graph atual (canto superior esquerdo)
2. Escolha **"Add new graph"**
3. Siga os passos acima

### 3. Configurar o Graph

#### A) Favoritos
1. No menu lateral esquerdo, clique no **⭐ (Favoritos)**
2. Clique em **"Add to favorites"**
3. Adicione as páginas mais importantes:
   - `[[Minha Vida em Caixas]]`
   - `[[MAPA-AI]]`
   - `[[XAVIER-DNA]]`
   - `[[00-INDICE]]` (quando criar)

#### B) Ícone e Cor (destacar visualmente)
1. Vá em **Settings** (⚙️ canto superior direito)
2. Aba **General**
3. Em **"Custom theme"** ou **"Accent color"**, escolha uma cor que combine — sugestão: **Azul** (#3B82F6) ou **Roxo** (#8B5CF6)
4. Opcional: em **"Custom CSS"** (aba `custom.css`) você pode adicionar um ícone ou estilo visual

#### C) Templates
1. No Logseq, crie uma página chamada `Templates`
2. Copie o conteúdo dos arquivos em `~/Documents/Kira/templates/`
3. Cole no Logseq — ele reconhece automaticamente como templates

### 4. Começar a Escrever

A maneira mais fácil de começar:

1. Vá para **Journals** (botão no menu lateral)
2. Escreva qualquer coisa no diário de hoje
3. Use `[[ ]]` para criar links:
   ```markdown
   Hoje pensei sobre [[Totum]] e como organizar [[Alexandria]].
   Preciso conversar com [[Mylena]] sobre o [[Upixel]].
   ```
4. Clique nos links para criar as páginas automaticamente

### 5. Organizar com Frontmatter

Quando criar uma página importante, adicione no topo:

```yaml
---
title: "Nome da Página"
date: 2026-04-25
tags: [pessoal, projeto]
categoria: "Áreas de Vida"
status: ativo
icone: 🏠
cor: "#10B981"
---
```

O Logseq reconhece YAML automaticamente.

---

## 🔄 Como o Sync Funciona

### Automático (cron job)
- **A cada 1 hora** o Mac copia seu vault `~/Documents/Kira/` para o GitHub
- **URL do repo:** https://github.com/raellemos/kira
- **Pasta no repo:** `cerebro/`

### Manual (quando quiser)
Abra o Terminal e rode:
```bash
cd ~/.kimi_openclaw/workspace && ./automacoes/auto-sync.sh
```

### O que acontece no GitHub
Seu vault aparece em:
```
https://github.com/raellemos/kira/tree/main/cerebro
```

Lá está tudo: suas notas, memórias, templates, tudo.

---

## 🗂️ Estrutura de Pastas no Cerebro

```
~/Documents/Kira/                    ← Seu vault (Graph "Cerebro")
├── journals/                       ← Diários automáticos (Logseq cria)
├── pages/                          ← Páginas que você cria
│   ├── Minha Vida em Caixas.md
│   └── ...
├── templates/                      ← Templates prontos
│   ├── template-projeto.md
│   ├── template-area-de-vida.md
│   ├── template-decisao.md
│   ├── template-memoria.md
│   ├── template-recurso.md
│   └── template-protocolo.md
├── memory/                         ← Memórias de interação
│   ├── 2026-04-24.md
│   └── 2026-04-25.md
├── logseq/                         ← Configuração do Logseq
│   ├── config.edn
│   └── custom.css
├── AGENTS.md                       ← Regras do ecossistema
├── HEARTBEAT.md                    ← Checklist de heartbeat
├── IDENTITY.md                     ← Quem é Kira
├── SOUL.md                         ← Alma da Kira
├── TOOLS.md                        ← Ferramentas locais
├── USER.md                         ← Quem é Rael
├── MAPA-AI.md                      ← Índice do arsenal de IA
├── PROTOCOLO-KIRA-SHUTDOWN.md      ← Protocolo de desligar
├── XAVIER-DNA.md                   ← DNA do organizador
├── analise-alexandria-para-cerebro.md
└── claude-1-milhao-tokens-contexto.md
```

---

## 💡 Dicas de Uso

### Links `[[ ]]`
- Digite `[[` + nome → cria link
- Clique no link → vai pra página
- Shift+clique → abre no painel lateral

### Tags `#`
- Digite `#tag` em qualquer lugar
- Use as tags padronizadas: `#pessoal`, `#trabalho`, `#projeto`, `#decisao`, `#memoria`

### Busca
- `Cmd + K` → busca rápida
- `Cmd + Shift + K` → busca em todas as páginas

### Templates
- Digite `/` → menu de templates
- Escolha o template adequado

### Gráfico de Conexões
- Clique no ícone de **grafo** (canto superior direito)
- Veja como suas ideias se conectam visualmente

---

## 🆘 Se Travar ou Der Erro

1. **Feche o Logseq** (Cmd + Q)
2. **Verifique se não tem arquivos enormes** em `~/Documents/Kira/`
3. **Reabra** o Logseq
4. Se persistir: me chame que eu investigo

---

## 🎯 Próximos Passos Sugeridos

1. ✅ Abrir Logseq → Add new graph → `~/Documents/Kira/`
2. ✅ Nomear: **Cerebro**
3. ✅ Adicionar favoritos
4. ✅ Escrever no Journals de hoje
5. ✅ Criar primeira página: `[[Minha Vida em Caixas]]`
6. ✅ Testar links e templates
7. ✅ Deixar o sync rodar (automático a cada 1h)

---

*Criado por: Kira*  
*Para: Rael*  
*Data: 2026-04-25*