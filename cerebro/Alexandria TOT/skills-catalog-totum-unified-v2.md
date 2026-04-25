# 📋 CATÁLOGO UNIFICADO - SKILLS & AGENTES PARA TOTUM

> **Repositório:** Alexandria → Apps Totum  
> **Versão:** 2.0 (Unificado)  
> **Data:** 2026-04-18  
> **Fontes:** 
> - clawskills.sh (5.147 skills)
> - VoltAgent/awesome-openclaw-skills (5.400+ skills)
> - best/openclaw-skills
> - mergisi/awesome-openclaw-agents (162 templates)
> - VoltAgent/awesome-agent-skills (1.000+ skills)
> - VoltAgent/awesome-claude-code-subagents (100+ subagentes)

---

## 🎯 VISÃO GERAL

Este catálogo unificado reúne **skills técnicas** + **templates de agentes** + **subagentes especializados** para transformar a Totum em uma infraestrutura de crescimento autônoma.

| Tipo | Quantidade | Descrição |
|------|------------|-----------|
| **Skills Técnicas** | 200+ | Integrações com ferramentas e APIs |
| **Templates de Agentes** | 162 | Agentes prontos para deploy |
| **Subagentes** | 100+ | Agentes especializados por tarefa |
| **Total Catalogado** | 462+ | Recursos para implementação |

---

## 🔴 P0 - STACK CRÍTICO TOTUM (Implementar Primeiro)

### 1. AGENTES PRONTOS ( mergisi/awesome-openclaw-agents )

| Agente | Categoria | Função | Uso na Totum |
|--------|-----------|--------|--------------|
| `marketing/echo` | Marketing | Agente base de marketing | Template inicial |
| `sales/lead-qualifier` | Vendas | Qualificação de leads | Qualificar inbound |
| `content/social-media-manager` | Conteúdo | Gestão redes sociais | Postagem automática |
| `analytics/ga4-reporter` | Analytics | Relatórios GA4 | Dashboards clientes |
| `crm/hubspot-sync` | CRM | Sincronização HubSpot | Gestão de leads |
| `automation/n8n-orchestrator` | Automação | Orquestração n8n | Workflows complexos |
| `research/competitor-analyzer` | Pesquisa | Análise competidores | Inteligência mercado |
| `email/sequence-builder` | Email | Sequências de email | Nurture campaigns |
| `seo/content-optimizer` | SEO | Otimização de conteúdo | Blog e landing pages |
| `ads/meta-campaign-manager` | Ads | Gestão Meta Ads | Campanhas paid |

**Repositório:** `https://github.com/mergisi/awesome-openclaw-agents`

---

### 2. SKILLS DE MARKETING (VoltAgent/awesome-agent-skills)

#### Marketing Skills by Corey Haines
| Skill | Função | Aplicação |
|-------|--------|-----------|
| `ab-test-setup` | Planejar A/B tests | Landing pages, anúncios |
| `ad-creative` | Gerar criativos de ads | Copy para Meta/Google |
| `ai-seo` | Otimizar para AI search | SEO moderno |
| `analytics-tracking` | Setup de analytics | GA4, Pixel, etc. |
| `churn-prevention` | Prevenção churn | Retenção de clientes |
| `cold-email` | Cold emails B2B | Prospecção outbound |
| `competitor-alternatives` | Páginas de comparação | SEO + conversão |
| `content-strategy` | Estratégia de conteúdo | Editorial calendar |
| `copy-editing` | Edição de copy | Refinamento de textos |
| `copywriting` | Copywriting geral | Landing pages, ads |
| `email-sequence` | Sequências de email | Automação nurture |
| `form-cro` | Otimização de formulários | Lead capture |
| `free-tool-strategy` | Ferramentas gratuitas | Lead gen + SEO |
| `launch-strategy` | Estratégia de lançamento | Go-to-market |
| `marketing-ideas` | Ideias de marketing | Brainstorming |
| `marketing-psychology` | Psicologia aplicada | Copy persuasiva |
| `onboarding-cro` | Otimização onboarding | Ativação de usuários |
| `page-cro` | CRO de páginas | Conversão |
| `paid-ads` | Gestão de paid ads | Meta, Google, LinkedIn |
| `paywall-upgrade-cro` | Otimização de upgrades | Monetização |
| `popup-cro` | Otimização de popups | Lead capture |
| `pricing-strategy` | Estratégia de preços | Pricing |

**Repositório:** `https://github.com/VoltAgent/awesome-agent-skills`

---

#### Advertising Skills by Kim Barrett
| Skill | Função | Aplicação |
|-------|--------|-----------|
| `avatar-extraction` | Definir avatar do cliente | Persona |
| `offer-extraction` | Criar ofertas irresistíveis | Offer design |
| `schwartz-awareness-mapper` | Mapear awareness | Eugene Schwartz framework |
| `mechanism-builder` | Mecanismo único | Diferenciação |
| `headline-matrix` | Matriz de headlines | Testes criativos |
| `objection-crusher` | Quebrar objeções | Overcoming objections |
| `ad-angle-multiplier` | Múltiplos ângulos de anúncio | Creative testing |
| `scroll-stopping-creative` | Criativos que param o scroll | Thumb stop |
| `conversion-path-builder` | Construir funil | Funnel design |
| `performance-diagnosis` | Diagnosticar performance | Troubleshooting |
| `full-funnel-campaign-orchestrator` | Orquestrar campanhas | Full-funnel |
| `generic-language-killer` | Eliminar linguagem genérica | Copy afiada |

---

### 3. SUBAGENTES ESPECIALIZADOS (VoltAgent/awesome-claude-code-subagents)

| Subagente | Especialidade | Uso na Totum |
|-----------|---------------|--------------|
| `marketing-strategist` | Estratégia de marketing | Planejamento |
| `content-creator` | Criação de conteúdo | Blog, social |
| `seo-specialist` | SEO técnico + on-page | Otimização |
| `paid-ads-manager` | Gestão de anúncios | Meta, Google |
| `email-marketer` | Email marketing | Sequências |
| `analytics-reporter` | Relatórios e dashboards | Data analysis |
| `crm-admin` | Gestão de CRM | HubSpot, Salesforce |
| `social-media-manager` | Gestão social | Instagram, LinkedIn |
| `copywriter` | Copywriting | Ads, landing pages |
| `conversion-optimizer` | CRO | Testes e otimização |

**Repositório:** `https://github.com/VoltAgent/awesome-claude-code-subagents`

---

### 4. SKILLS TÉCNICAS INSTALADAS (Core Infrastructure)

| Skill | Status | Função |
|-------|--------|--------|
| `feishu-bitable` | ✅ Instalado | CRM, bases de leads |
| `feishu-calendar` | ✅ Instalado | Agendamentos |
| `feishu-task` | ✅ Instalado | Gestão de tarefas |
| `feishu-fetch-doc` | ✅ Instalado | Documentação |
| `feishu-create-doc` | ✅ Instalado | Criar documentos |
| `feishu-im-read` | ✅ Instalado | Monitoramento |
| `wecom-doc-manager` | ✅ Instalado | Docs WeChat |
| `wecom-schedule` | ✅ Instalado | Agenda WeCom |
| `wecom-edit-todo` | ✅ Instalado | Tarefas WeCom |
| `wecom-meeting-create` | ✅ Instalado | Reuniões |
| `wecom-meeting-query` | ✅ Instalado | Consultar reuniões |
| `wecom-meeting-manage` | ✅ Instalado | Gerenciar reuniões |
| `wecom-smartsheet-data` | ✅ Instalado | Dados tabelas |
| `wecom-smartsheet-schema` | ✅ Instalado | Estrutura tabelas |
| `wecom-contact-lookup` | ✅ Instalado | Busca contatos |
| `wecom-msg` | ✅ Instalado | Mensagens WeCom |
| `channels-setup` | ✅ Instalado | Config canais |

---

## 🟠 P1 - STACK DE OPERAÇÃO (Implementar na Semana 2-4)

### Skills de Automação & Workflows

| Skill | Repositório | Função |
|-------|-------------|--------|
| `n8n-workflow-automation` | ClawHub | Design workflows n8n |
| `automation-workflows` | ClawHub | Automações diversas |
| `api-gateway` | ClawHub | Gateway APIs |
| `agent-browser` | ClawHub | Browser headless |
| `playwright-mcp` | ClawHub | Playwright automation |
| `playwright-scraper-skill` | ClawHub | Web scraping |
| `browser-use` | ClawHub | Browser cloud API |
| `agent-daily-planner` | ClawHub | Planejamento diário |
| `agent-task-tracker` | ClawHub | Tracking de tarefas |
| `ai-hunter-pro` | ClawHub | Automação social media |

### Skills de Marketing & Analytics

| Skill | Repositório | Função |
|-------|-------------|--------|
| `google-analytics` | ClawHub | Métricas GA4 |
| `ahrefs` | ClawHub | SEO e backlinks |
| `google-sheets` | ClawHub | Planilhas |
| `airtable` | ClawHub | Bases Airtable |
| `hubspot` | ClawHub | CRM HubSpot |
| `salesforce` | ClawHub | CRM Salesforce |
| `mailchimp` | ClawHub | Email marketing |
| `sendgrid` | ClawHub | Email transacional |
| `twilio` | ClawHub | SMS/WhatsApp |
| `meta-ads` | ClawHub | Facebook/Instagram Ads |
| `google-ads` | ClawHub | Google Ads |
| `tiktok-ads` | ClawHub | TikTok Ads |
| `linkedin-ads` | ClawHub | LinkedIn Ads |
| `activecampaign` | ClawHub | Automação marketing |
| `mixpost` | ClawHub | Social media scheduling |
| `data-analyst` | ClawHub | Visualização e SQL |
| `markdown-converter` | ClawHub | Conversão documentos |
| `notion` | Instalado | Base de conhecimento |

### Skills de Comunicação & Colaboração

| Skill | Repositório | Função |
|-------|-------------|--------|
| `slack` | ClawHub | Integração Slack |
| `discord` | Instalado | Gestão Discord |
| `telegram` | ClawHub | Bot Telegram |
| `whatsapp` | ClawHub | WhatsApp Business |
| `gmail` | ClawHub | Gmail integrado |
| `google-calendar` | ClawHub | Calendário Google |
| `google-drive` | ClawHub | Drive Google |
| `zoom` | ClawHub | Zoom meetings |
| `calendly` | ClawHub | Agendamento |
| `trello` | ClawHub | Gestão Trello |
| `asana` | ClawHub | Gestão Asana |
| `monday` | ClawHub | Monday.com |
| `clickup` | ClawHub | ClickUp |
| `jira` | ClawHub | Gestão Jira |
| `confluence` | ClawHub | Wiki Confluence |

---

## 🟡 P2 - STACK DE ANÁLISE & INTELIGÊNCIA (Mês 2)

### Skills de IA & LLMs

| Skill | Repositório | Função |
|-------|-------------|--------|
| `openai` | ClawHub | API OpenAI |
| `anthropic` | ClawHub | Claude API |
| `perplexity` | ClawHub | Perplexity API |
| `huggingface` | ClawHub | Modelos open |
| `elevenlabs` | ClawHub | TTS |
| `openrouter` | ClawHub | Multi-model |
| `gemini` | ClawHub | Google Gemini |
| `grok` | ClawHub | xAI Grok |
| `free-ride` | ClawHub | OpenRouter free |
| `elite-longterm-memory` | ClawHub | Memória longa |
| `ai-ppt-generator` | ClawHub | Gerar PPT |
| `gemini-image-gen` | best/skills | Imagens Gemini |
| `openai-whisper` | Instalado | Transcrição |
| `video-frames` | Instalado | Análise vídeo |

### Skills de Pesquisa & Inteligência

| Skill | Repositório | Função |
|-------|-------------|--------|
| `exa-web-search` | ClawHub | Busca Exa |
| `perplexity-search` | ClawHub | Perplexity |
| `brave-search` | ClawHub | Brave Search |
| `baidu-search` | ClawHub | Baidu Search |
| `google-search` | ClawHub | Google Search |
| `blogwatcher` | ClawHub | Monitor blogs |
| `feed-collect` | best/skills | Coleta feeds |
| `feed-score` | best/skills | Score feeds |
| `feed-broadcast` | best/skills | Broadcast feeds |
| `stock-analysis` | ClawHub | Análise ações |
| `stock-watcher` | ClawHub | Monitor ações |

---

## 🟢 P3 - STACK ESPECIALIZADO (Contextual)

### Específicas de Plataforma

| Skill | Repositório | Quando Usar |
|-------|-------------|-------------|
| `apple-notes` | ClawHub | Ecossistema Apple |
| `apple-reminders` | Instalado | iOS/macOS |
| `imessage` | ClawHub | Apple users |
| `obsidian` | ClawHub | PKM pessoal |
| `roam-research` | ClawHub | PKM network |
| `logseq` | ClawHub | PKM open |

### Segurança & Infra

| Skill | Repositório | Quando Usar |
|-------|-------------|-------------|
| `1password` | Instalado | Gestão senhas |
| `bitwarden` | ClawHub | Senhas open |
| `healthcheck` | Instalado | Auditoria segurança |
| `ssl-monitor` | ClawHub | Monitor SSL |
| `uptime-monitor` | ClawHub | Disponibilidade |

### China-Specific

| Skill | Repositório | Quando Usar |
|-------|-------------|-------------|
| `wechat-article-fetcher` | best/skills | China market |
| `wechat-mp-publisher` | best/skills | China presence |
| `douyin` | ClawHub | TikTok China |
| `xiaohongshu` | ClawHub | Redbook |
| `alipay` | ClawHub | China payments |

---

## 📊 MATRIZ DE IMPLEMENTAÇÃO

### Fase 1: Foundation (Semana 1-2) - P0
```bash
# 1. Clonar repositório de agentes
git clone https://github.com/mergisi/awesome-openclaw-agents.git

# 2. Instalar skills críticas já disponíveis
clawhub install n8n-workflow-automation
clawhub install agent-browser
clawhub install playwright-mcp

# 3. Configurar agentes base
# - marketing/echo
# - sales/lead-qualifier
# - analytics/ga4-reporter
```

### Fase 2: Operação (Semana 3-4) - P1
```bash
# Comunicação
clawhub install slack
clawhub install telegram
clawhub install whatsapp

# Marketing
clawhub install google-analytics
clawhub install hubspot
clawhub install mailchimp
clawhub install meta-ads
clawhub install google-ads

# Produtividade
clawhub install notion
clawhub install trello
```

### Fase 3: Analytics (Mês 2) - P2
```bash
# IA e Pesquisa
clawhub install perplexity
clawhub install exa-web-search
clawhub install elevenlabs
clawhub install data-analyst

# Memory
clawhub install elite-longterm-memory
```

---

## 🛠️ COMO IMPORTAR

### Método 1: ClawHub (Skills)
```bash
clawhub install <skill-slug>
```

### Método 2: Git Clone (Agentes)
```bash
git clone https://github.com/mergisi/awesome-openclaw-agents.git
cd awesome-openclaw-agents/agents/<categoria>/<agente>
cp SOUL.md /caminho/do/seu/agente/
```

### Método 3: Git Clone (Skills Custom)
```bash
git clone https://github.com/best/openclaw-skills.git
cp -r openclaw-skills/<skill> ~/.openclaw/skills/
```

---

## 🔐 SEGURANÇA & AUDITORIA

**Antes de instalar qualquer skill ou agente:**
1. Verificar no [ClawHub](https://clawhub.ai) relatório VirusTotal
2. Revisar código fonte
3. Testar em ambiente isolado
4. Verificar permissões necessárias

---

## 📈 MÉTRICAS DE SUCESSO

| Métrica | Target Mês 1 | Target Mês 3 |
|---------|--------------|--------------|
| Skills instaladas | 15 | 40 |
| Agentes ativos | 3 | 8 |
| Subagentes | 5 | 15 |
| Workflows automatizados | 5 | 20 |
| Horas economizadas/semana | 10h | 30h |

---

## 📚 REFERÊNCIAS

### Repositórios Principais
1. **mergisi/awesome-openclaw-agents** - 162 templates de agentes
   - URL: https://github.com/mergisi/awesome-openclaw-agents
   
2. **VoltAgent/awesome-agent-skills** - 1.000+ skills
   - URL: https://github.com/VoltAgent/awesome-agent-skills
   
3. **VoltAgent/awesome-claude-code-subagents** - 100+ subagentes
   - URL: https://github.com/VoltAgent/awesome-claude-code-subagents
   
4. **VoltAgent/awesome-openclaw-skills** - 5.400+ skills
   - URL: https://github.com/VoltAgent/awesome-openclaw-skills
   
5. **best/openclaw-skills** - Skills autônomas
   - URL: https://github.com/best/openclaw-skills

### Skills por Categoria no ClawHub
- Marketing: 102 skills
- Communication: 146 skills
- Productivity & Tasks: 205 skills
- Browser & Automation: 322 skills
- AI & LLMs: 176 skills
- Data & Analytics: 28 skills

---

**Documento mantido por:** TOT  
**Próxima revisão:** 2026-05-18  
**Status:** ✅ Aprovado para importação
