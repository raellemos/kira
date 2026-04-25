# Guia: Configurar Vault Pessoal Criptografado no Obsidian (Mac)

> **Executar amanhã no Kimi Claw Mac**
> **Objetivo:** Separar vault pessoal (Alexandria/Kira) do vault de trabalho, criptografando só o pessoal.

---

## 🎯 O que vamos fazer

1. **Descriptografar** o vault principal do Obsidian (que foi criptografado por engano)
2. **Criar um novo vault** só para dados pessoais
3. **Criptografar só esse vault pessoal**
4. Configurar a Kira para acessar esse vault

---

## 📁 Estrutura final

```
Obsidian/
├── Totum/                 ← Vault de trabalho (ABERTO)
│   ├── Projetos/
│   ├── Clientes/
│   └── Notas operacionais/
│
└── Alexandria/            ← Vault pessoal (CRIPTOGRAFADO)
    ├── Diário/
    ├── Agenda/
    ├── Sonhos & Medos/
    └── Reflexões/
```

---

## 🛠️ PASSO A PASSO

### PASSO 1: Descriptografar o vault principal

1. Abra o **Obsidian** no Mac
2. Ao abrir, vai pedir a senha que você criou hoje
3. Digite a senha para descriptografar
4. Vá em **Settings** (engrenagem inferior esquerda)
5. Clique em **Security**
6. Desative a criptografia ou remova a senha do vault principal
7. **Confirme** que o vault está descriptografado

> ⚠️ **IMPORTANTE:** Guarde a senha que você usou hoje. Vamos reusar ela no vault pessoal (ou crie uma nova, você escolhe).

---

### PASSO 2: Criar o vault pessoal "Alexandria"

1. No Obsidian, clique no **ícone de vault** (canto inferior esquerdo, onde mostra o nome do vault atual)
2. Clique em **"Create new vault"**
3. Nomeie: `Alexandria`
4. Escolha a localização: `~/Documents/Obsidian/Alexandria/` (ou onde preferir)
5. Clique em **"Create"**

---

### PASSO 3: Criar estrutura de pastas no vault Alexandria

Dentro do vault `Alexandria`, crie estas pastas:

```
Alexandria/
├── 00-Inbox/              ← Entrada rápida de notas
├── 01-Diario/             ← Registro diário
├── 02-Agenda/             ← Compromissos e lembretes
├── 03-Projetos-Pessoais/  ← Projetos pessoais
├── 04-Reflexoes/          ← Pensamentos, ideias, sonhos
├── 05-Financas/           ← Planejamento financeiro pessoal
└── 99-Arquivado/          ← Coisas antigas
```

**Como criar:**
1. Clique com botão direito na área vazia do painel de arquivos
2. "New folder"
3. Digite o nome

---

### PASSO 4: Criptografar SÓ o vault Alexandria

1. Certifique-se de que o vault **"Alexandria"** está aberto (veja o nome no canto inferior esquerdo)
2. Vá em **Settings** → **Security**
3. Ative **"Encrypt vault"** ou **"Set password"**
4. Digite uma senha forte (pode usar a mesma de hoje ou uma nova)
5. Confirme a senha
6. **Salve a senha em um lugar seguro** (1Password, Bitwarden, ou papel fisicamente guardado)

> ✅ Pronto. O vault "Alexandria" agora está criptografado. O vault "Totum" continua aberto.

---

### PASSO 5: Configurar a Kira para ler o vault Alexandria

A Kira precisa:
1. Saber onde o vault está localizado (`~/Documents/Obsidian/Alexandria/`)
2. Pedir a senha a você quando iniciar
3. Ler os arquivos .md temporariamente
4. Nunca armazenar a senha

**Instrução para a Kira:**

```
Kira, seu vault pessoal está em: ~/Documents/Obsidian/Alexandria/

REGRAS DE ACESSO:
1. SEMPRE peça a senha do vault ao iniciar conversa
2. NUNCA armazene a senha em memória permanente
3. Leia apenas arquivos .md dentro dessa pasta
4. NUNCA altere, delete ou crie arquivos no vault
5. Após processar, esqueça o conteúdo da sessão anterior

COMPORTAMENTO:
- Quando Israel digitar a senha, descriptografe mentalmente o acesso
- Leia os arquivos relevantes para responder com contexto
- Nunca repita informações pessoais em outros contextos
```

---

### PASSO 6: Testar

1. **Feche** o Obsidian completamente
2. **Reabra** o Obsidian
3. Vá no vault **"Totum"** → deve abrir **sem pedir senha**
4. Vá no vault **"Alexandria"** → deve pedir a senha
5. Digite a senha → deve abrir normalmente

Se isso aconteceu, **está funcionando.** ✅

---

## 🔒 RESUMO DE SEGURANÇA

| Vault | Estado | Quem acessa | Senha |
|-------|--------|-------------|-------|
| **Totum** | Aberto | Você, equipe, Kira (contexto profissional) | Sem senha |
| **Alexandria** | Criptografado | Só você (e Kira com sua permissão) | Com senha |

---

## 📝 NOTAS IMPORTANTES

- **Backup:** O Obsidian Sync ou GitHub só deve sincronizar o vault "Totum". O "Alexandria" fica 100% local.
- **Senha:** Se esquecer a senha, os dados estão perdidos. Não existe recuperação.
- **Kira:** Sempre que iniciar conversa com ela sobre assuntos pessoais, diga: *"Kira, abre Alexandria"* e forneça a senha.

---

*Guia criado por TOT (VPS) para execução no Kimi Claw Mac.*
*Data: 2026-04-25*
