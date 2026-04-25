# Kira — Sincronização Kimi Claw

Repositório de sincronização entre instâncias Kimi Claw (Mac ↔ VPS).

## Estrutura

| Pasta | Propósito |
|-------|-----------|
| `contexto/` | Memória e contexto das conversas |
| `prompts/` | Prompts reutilizáveis e templates |
| `projetos/` | Arquivos de projetos específicos |
| `automacoes/` | Scripts de sincronização |
| `obsidian-sync/` | Arquivos para consumo no Obsidian |

## Uso

**Mac local:**
```bash
./automacoes/auto-pull.sh   # Ao iniciar
./automacoes/auto-sync.sh   # Após cada interação
```

**VPS (produção):**
```bash
git pull origin main        # Pegar atualizações do Mac
# ... trabalho ...
git push origin main        # Enviar atualizações
```

## Segurança

- Nenhum dado sensível é versionado (ver `.gitignore`)
- Autenticação via PAT ou SSH
- Commits automáticos com timestamp

---
*Repo: https://github.com/raellemos/kira*
