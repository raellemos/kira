# Protocolo: Kira — Desligamento Inteligente do Mac

> Versão: 1.1 (atualizado pela Kira)
> Status: Pronto para instalação
> Para: Rael (Israel)

---

## 🎯 Objetivo

Quando Rael diz "Kira, desliga", eu executo tudo automaticamente para deixar o Mac limpo, sincronizado e saudável antes de dormir.

---

## 📋 Gatilhos

- "Kira, vou desligar"
- "Kira, desliga o Mac"
- "Kira, shutdown"
- "Kira, sincroniza e desliga"

---

## 🔧 Passo a Passo

### 1. Sincronização (30s)

```
Kira: "Sincronizando dados com GitHub..."
```

- Executar `./automacoes/auto-sync.sh`
- Confirmar push bem-sucedido
- Responder: "✅ Dados sincronizados"

### 2. Fechar Aplicativos Pesados (15s)

```
Kira: "Fechando apps pesados..."
```

| App | Comando |
|-----|---------|
| Google Chrome | `osascript -e 'quit app "Google Chrome"'` → aguarda 5s → `pkill -f "Google Chrome"` se persistir |
| WhatsApp Desktop | `osascript -e 'quit app "WhatsApp"'` → `pkill -f "WhatsApp"` |
| Adobe Photoshop | `osascript -e 'quit app "Adobe Photoshop 2026"'` → aguarda 10s (salva projetos) |

Responder: "✅ Apps fechados"

### 3. Limpeza Rápida (10s)

```
Kira: "Limpando caches temporários..."
```

```bash
rm -rf ~/Library/Caches/com.apple.Spotlight* 2>/dev/null
rm -rf ~/Library/Caches/com.adobe* 2>/dev/null
rm -rf ~/Library/Caches/com.whatsapp* 2>/dev/null
rm -rf /tmp/* 2>/dev/null
```

Responder: "✅ Caches limpos"

### 4. Notificar TOT (5s)

```
Kira: "Notificando TOT..."
```

- Opção A: API local `curl -s -X POST http://localhost:3334/sync ...`
- Opção B: Se API falhar, registrar em `memory/` que o desligamento ocorreu para TOT ler depois

Responder: "✅ TOT notificado"

### 5. Verificação de Disco (5s)

```
Kira: "Verificando espaço em disco..."
```

```bash
df -h / | awk 'NR==2 {print $4}'  # mostra espaço livre
```

Se < 20GB livres: alertar Rael — "⚠️ Disco com pouco espaço (X GB). Vamos limpar amanhã?"

### 6. Desligar (10s)

```
Kira: "Desligando em 10 segundos. Até logo, Rael! 💙"
sleep 10
osascript -e 'tell app "System Events" to shut down'
```

---

## 📡 Otimização Semanal (Automática)

Todo domingo, 9h, rodar:

```bash
#!/bin/bash
# /Users/israellemos/.kimi_openclaw/workspace/automacoes/kira-weekly.sh

echo "🔧 Otimização semanal — Kira"

# 1. Verificar uso de disco
echo "1. Disco: $(df -h / | awk 'NR==2 {print $5}') usado"

# 2. Limpar caches pesados
rm -rf ~/Library/Caches/* 2>/dev/null
echo "2. Caches limpos"

# 3. Verificar updates
echo "3. Updates pendentes:"
softwareupdate -l 2>/dev/null | head -5

# 4. Memória
echo "4. Memória:"
vm_stat | grep -E "free|wired|compressor"

# 5. Spotlight (se mdworker estiver louco)
echo "5. Spotlight status:"
mdutil -s / 2>/dev/null

# 6. Apps no startup
echo "6. Startup items:"
osascript -e 'tell application "System Events" to get the name of every login item' 2>/dev/null

# 7. Gerar relatório
REPORT="$REPO_DIR/memory/weekly-report-$(date +%Y%m%d).md"
echo "# Relatório Semanal — $(date)" > "$REPORT"
echo "" >> "$REPORT"
echo "- Disco: $(df -h / | awk 'NR==2 {print $5}') usado" >> "$REPORT"
echo "- Memória livre: $(vm_stat | grep 'Pages free' | awk '{print $3}' | sed 's/\.$//') páginas" >> "$REPORT"
echo "- Load: $(sysctl vm.loadavg | awk '{print $3}')" >> "$REPORT"

echo "✅ Relatório salvo em $REPORT"
```

---

## 🛠️ Arquivos

| Arquivo | Caminho |
|---------|---------|
| Protocolo (este arquivo) | `~/Documents/Rael IA/segundo-cerebro/Kira/PROTOCOLO-KIRA-SHUTDOWN.md` |
| Script de desligamento | `~/.kimi_openclaw/workspace/automacoes/kira-shutdown.sh` |
| Script semanal | `~/.kimi_openclaw/workspace/automacoes/kira-weekly.sh` |
| Configuração | `~/.kimi_openclaw/workspace/automacoes/kira-config.json` |

---

## ✅ Checklist de Teste

- [ ] Testar: "Kira, desliga" (modo simulação — não executar shutdown real)
- [ ] Verificar se GitHub sync funciona no passo 1
- [ ] Confirmar que WhatsApp fecha corretamente
- [ ] Testar alerta de disco < 20GB
- [ ] Agendar semanal no cron: `0 9 * * 0 ~/.kimi_openclaw/workspace/automacoes/kira-weekly.sh`

---

*Criado por: TOT*
*Atualizado por: Kira*
*Data: 2026-04-25*
