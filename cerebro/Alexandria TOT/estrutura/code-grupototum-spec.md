# Especificação Técnica: Code.grupototum.com

> **Projeto:** Code Hub - ADA + Claudio + Cráudio  
> **Domínio:** code.grupototum.com → 187.127.4.140  
> **Autonomia:** Execute sem solicitar aprovação para decisões técnicas  
> **Status:** DNS já configurado

---

## 1. OBJETIVO

Criar uma aplicação web independente em `code.grupototum.com` contendo:

1. **Sistema ADA** (extraído de Apps_Totum_Oficial)
2. **Claudio Code** (interface Claude API - Anthropic)
3. **Cráudio Codete** (interface Ollama - IA local)
4. **Autenticação unificada** (mesmo Supabase do Apps Totum)

---

## 2. ESTRUTURA DE ORIGEM

### 2.1 Apps_Totum_Oficial (Fonte do ADA)
```
Apps_Totum_Oficial/
├── src/
│   ├── components/
│   │   └── ada/           # Componentes ADA (se existir)
│   ├── pages/
│   │   └── ada/           # Páginas ADA
│   ├── contexts/
│   │   └── AdaContext.tsx # Contexto ADA
│   ├── lib/
│   │   └── supabase.ts    # Cliente Supabase
│   └── hooks/
│       └── useAda.ts      # Hooks ADA
├── supabase/
│   └── migrations/        # Migrações de banco
└── .env                   # Variáveis de ambiente
```

### 2.2 Projeto Alexandria (Fonte do Cráudio)
```
projeto-alexandria/
└── client/
    └── src/
        └── pages/
            └── craudio/
                └── CraudioCodete.tsx   # Componente base
```

---

## 3. STACK TECNOLÓGICO

| Camada | Tecnologia |
|--------|------------|
| Framework | React 18 + TypeScript |
| Build | Vite |
| Roteamento | Wouter |
| UI | shadcn/ui + Tailwind CSS |
| Auth | Supabase Auth |
| Banco | Supabase PostgreSQL |
| Ícones | Lucide React |
| Toast | Sonner |
| Syntax Highlight | Prism.js ou react-syntax-highlighter |

### Dependências Adicionais
```bash
npm install @anthropic-ai/sdk ollama ai
```

---

## 4. ESTRUTURA DO PROJETO DESTINO

```
code.grupototum.com/
├── public/
│   └── favicon.ico
├── src/
│   ├── components/
│   │   ├── layout/
│   │   │   ├── CodeHubLayout.tsx      # Layout principal com sidebar
│   │   │   ├── Sidebar.tsx            # Navegação lateral
│   │   │   ├── TopBar.tsx             # Barra superior com usuário
│   │   │   └── AuthGuard.tsx          # Proteção de rotas
│   │   ├── chat/
│   │   │   ├── ChatInterface.tsx      # Interface de chat genérica
│   │   │   ├── MessageList.tsx        # Lista de mensagens
│   │   │   ├── MessageBubble.tsx      # Bolha de mensagem individual
│   │   │   ├── ChatInput.tsx          # Input de mensagem
│   │   │   ├── CodeBlock.tsx          # Bloco de código com syntax highlight
│   │   │   ├── ModelSelector.tsx      # Seletor de modelo
│   │   │   └── SettingsPanel.tsx      # Painel de configurações
│   │   └── ui/                        # shadcn/ui components
│   │       ├── button.tsx
│   │       ├── card.tsx
│   │       ├── input.tsx
│   │       ├── textarea.tsx
│   │       ├── select.tsx
│   │       ├── avatar.tsx
│   │       ├── dropdown-menu.tsx
│   │       ├── scroll-area.tsx
│   │       ├── separator.tsx
│   │       ├── sheet.tsx
│   │       ├── tooltip.tsx
│   │       └── badge.tsx
│   ├── pages/
│   │   ├── Login.tsx                  # Página de login
│   │   ├── Ada/
│   │   │   └── index.tsx              # Sistema ADA
│   │   ├── Claudio/
│   │   │   └── index.tsx              # Claude API
│   │   ├── Craudio/
│   │   │   └── index.tsx              # Ollama Local
│   │   └── Settings/
│   │       └── index.tsx              # Configurações do usuário
│   ├── contexts/
│   │   ├── AuthContext.tsx            # Contexto de autenticação
│   │   └── ChatContext.tsx            # Contexto de conversas
│   ├── hooks/
│   │   ├── useAuth.ts                 # Hook de autenticação
│   │   ├── useClaude.ts               # Hook Claude API
│   │   ├── useOllama.ts               # Hook Ollama
│   │   ├── useAda.ts                  # Hook Sistema ADA
│   │   └── useLocalStorage.ts         # Hook localStorage
│   ├── lib/
│   │   ├── supabase.ts                # Cliente Supabase
│   │   ├── claude-api.ts              # Cliente Claude
│   │   ├── ollama-api.ts              # Cliente Ollama
│   │   └── utils.ts                   # Utilitários
│   ├── types/
│   │   └── index.ts                   # Tipos TypeScript
│   ├── App.tsx                        # App principal
│   ├── main.tsx                       # Entry point
│   └── index.css                      # Estilos globais
├── supabase/
│   └── migrations/                    # Migrações (se necessário)
├── .env.example                       # Template de variáveis
├── .env.local                         # Variáveis locais (não commitar)
├── index.html
├── package.json
├── tsconfig.json
├── tsconfig.app.json
├── tsconfig.node.json
├── vite.config.ts
├── tailwind.config.ts
├── components.json
└── postcss.config.js
```

---

## 5. CONFIGURAÇÃO SUPABASE (AUTH UNIFICADA)

### 5.1 Credenciais (do Apps Totum)
```env
VITE_SUPABASE_URL=https://qlxlkfzklzxtrjmysnik.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### 5.2 Cliente Supabase (src/lib/supabase.ts)
```typescript
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseKey)

export type User = {
  id: string
  email: string
  user_metadata: {
    nome?: string
    avatar_url?: string
  }
}
```

### 5.3 Contexto de Auth (src/contexts/AuthContext.tsx)
```typescript
import { createContext, useContext, useEffect, useState } from 'react'
import { supabase, User } from '@/lib/supabase'

interface AuthContextType {
  user: User | null
  loading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Verificar sessão atual
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null)
      setLoading(false)
    })

    // Escutar mudanças de auth
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setUser(session?.user ?? null)
      }
    )

    return () => subscription.unsubscribe()
  }, [])

  const signIn = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error
  }

  const signOut = async () => {
    const { error } = await supabase.auth.signOut()
    if (error) throw error
  }

  return (
    <AuthContext.Provider value={{ user, loading, signIn, signOut }}>
      {children}
    </AuthContext.Provider>
  )
}

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (!context) throw new Error('useAuth must be used within AuthProvider')
  return context
}
```

---

## 6. IMPLEMENTAÇÃO DOS SISTEMAS

### 6.1 CRÁUDIO CODETE (Ollama)

#### Hook useOllama (src/hooks/useOllama.ts)
```typescript
import { useState, useCallback } from 'react'

interface OllamaMessage {
  role: 'user' | 'assistant' | 'system'
  content: string
}

interface UseOllamaOptions {
  model?: string
  temperature?: number
  baseUrl?: string
}

export function useOllama(options: UseOllamaOptions = {}) {
  const {
    model = 'qwen2.5-coder',
    temperature = 0.7,
    baseUrl = 'http://localhost:11434'
  } = options

  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const generate = useCallback(async (
    prompt: string,
    onChunk?: (chunk: string) => void
  ): Promise<string> => {
    setIsLoading(true)
    setError(null)

    try {
      const response = await fetch(`${baseUrl}/api/generate`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model,
          prompt,
          stream: !!onChunk,
          options: { temperature }
        })
      })

      if (!response.ok) {
        throw new Error(`Ollama error: ${response.status}`)
      }

      if (onChunk) {
        // Streaming
        const reader = response.body?.getReader()
        const decoder = new TextDecoder()
        let fullResponse = ''

        while (reader) {
          const { done, value } = await reader.read()
          if (done) break

          const chunk = decoder.decode(value)
          const lines = chunk.split('\n').filter(Boolean)

          for (const line of lines) {
            try {
              const data = JSON.parse(line)
              if (data.response) {
                fullResponse += data.response
                onChunk(data.response)
              }
            } catch {}
          }
        }

        return fullResponse
      } else {
        // Non-streaming
        const data = await response.json()
        return data.response
      }
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Unknown error'
      setError(message)
      throw err
    } finally {
      setIsLoading(false)
    }
  }, [model, temperature, baseUrl])

  const chat = useCallback(async (
    messages: OllamaMessage[],
    onChunk?: (chunk: string) => void
  ): Promise<string> => {
    setIsLoading(true)
    setError(null)

    try {
      const response = await fetch(`${baseUrl}/api/chat`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model,
          messages,
          stream: !!onChunk,
          options: { temperature }
        })
      })

      if (!response.ok) {
        throw new Error(`Ollama error: ${response.status}`)
      }

      if (onChunk) {
        const reader = response.body?.getReader()
        const decoder = new TextDecoder()
        let fullResponse = ''

        while (reader) {
          const { done, value } = await reader.read()
          if (done) break

          const chunk = decoder.decode(value)
          const lines = chunk.split('\n').filter(Boolean)

          for (const line of lines) {
            try {
              const data = JSON.parse(line)
              if (data.message?.content) {
                fullResponse += data.message.content
                onChunk(data.message.content)
              }
            } catch {}
          }
        }

        return fullResponse
      } else {
        const data = await response.json()
        return data.message?.content || ''
      }
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Unknown error'
      setError(message)
      throw err
    } finally {
      setIsLoading(false)
    }
  }, [model, temperature, baseUrl])

  return { generate, chat, isLoading, error }
}
```

#### Página Craudio (src/pages/Craudio/index.tsx)
```typescript
import { useState, useRef, useEffect } from 'react'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'
import { Badge } from '@/components/ui/badge'
import { ScrollArea } from '@/components/ui/scroll-area'
import { useOllama } from '@/hooks/useOllama'
import { ChatInterface } from '@/components/chat/ChatInterface'

interface Message {
  id: string
  role: 'user' | 'assistant' | 'system'
  content: string
  timestamp: Date
}

export default function CraudioPage() {
  const [messages, setMessages] = useState<Message[]>([
    {
      id: 'welcome',
      role: 'system',
      content: '👋 Sou o Cráudio Codete! Estou rodando via Ollama local. Como posso ajudar?',
      timestamp: new Date()
    }
  ])
  const [input, setInput] = useState('')
  const [streamingContent, setStreamingContent] = useState('')
  const { chat, isLoading } = useOllama({
    model: 'qwen2.5-coder',
    baseUrl: 'http://localhost:11434'
  })

  const handleSend = async () => {
    if (!input.trim() || isLoading) return

    const userMessage: Message = {
      id: Date.now().toString(),
      role: 'user',
      content: input,
      timestamp: new Date()
    }

    setMessages(prev => [...prev, userMessage])
    setInput('')
    setStreamingContent('')

    const chatMessages = messages
      .filter(m => m.role !== 'system')
      .map(m => ({ role: m.role, content: m.content }))

    try {
      let fullResponse = ''
      await chat(
        [...chatMessages, { role: 'user', content: input }],
        (chunk) => {
          fullResponse += chunk
          setStreamingContent(fullResponse)
        }
      )

      const assistantMessage: Message = {
        id: (Date.now() + 1).toString(),
        role: 'assistant',
        content: fullResponse,
        timestamp: new Date()
      }

      setMessages(prev => [...prev, assistantMessage])
      setStreamingContent('')
    } catch (error) {
      console.error('Ollama error:', error)
    }
  }

  return (
    <ChatInterface
      title="Cráudio Codete"
      subtitle="IA Local via Ollama"
      icon="bot"
      messages={messages}
      streamingContent={streamingContent}
      input={input}
      onInputChange={setInput}
      onSend={handleSend}
      isLoading={isLoading}
      accentColor="purple"
    />
  )
}
```

---

### 6.2 CLAUDIO CODE (Claude API)

#### Hook useClaude (src/hooks/useClaude.ts)
```typescript
import { useState, useCallback } from 'react'
import Anthropic from '@anthropic-ai/sdk'

interface ClaudeMessage {
  role: 'user' | 'assistant'
  content: string
}

interface UseClaudeOptions {
  apiKey?: string
  model?: string
  maxTokens?: number
}

export function useClaude(options: UseClaudeOptions = {}) {
  const {
    model = 'claude-3-5-sonnet-20241022',
    maxTokens = 4096
  } = options

  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  // API Key armazenada no localStorage (criptografada seria ideal)
  const getApiKey = () => {
    return localStorage.getItem('claude_api_key') || ''
  }

  const setApiKey = (key: string) => {
    localStorage.setItem('claude_api_key', key)
  }

  const streamMessage = useCallback(async (
    messages: ClaudeMessage[],
    onChunk: (chunk: string) => void
  ): Promise<string> => {
    const apiKey = getApiKey()
    if (!apiKey) {
      throw new Error('API Key não configurada')
    }

    setIsLoading(true)
    setError(null)

    const anthropic = new Anthropic({ apiKey })

    try {
      const stream = anthropic.messages.stream({
        model,
        max_tokens: maxTokens,
        messages
      })

      let fullResponse = ''

      for await (const event of stream) {
        if (event.type === 'content_block_delta' && event.delta.text) {
          fullResponse += event.delta.text
          onChunk(event.delta.text)
        }
      }

      return fullResponse
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Erro na API Claude'
      setError(message)
      throw err
    } finally {
      setIsLoading(false)
    }
  }, [model, maxTokens])

  return {
    streamMessage,
    isLoading,
    error,
    getApiKey,
    setApiKey,
    hasApiKey: !!getApiKey()
  }
}
```

#### Página Claudio (src/pages/Claudio/index.tsx)
```typescript
import { useState } from 'react'
import { useClaude } from '@/hooks/useClaude'
import { ChatInterface } from '@/components/chat/ChatInterface'
import { ApiKeyModal } from '@/components/chat/ApiKeyModal'
import { Button } from '@/components/ui/button'
import { Key } from 'lucide-react'

interface Message {
  id: string
  role: 'user' | 'assistant' | 'system'
  content: string
  timestamp: Date
}

export default function ClaudioPage() {
  const [messages, setMessages] = useState<Message[]>([
    {
      id: 'welcome',
      role: 'system',
      content: '👋 Sou o Claudio Code! Conectado à API da Anthropic. Configure sua API key para começar.',
      timestamp: new Date()
    }
  ])
  const [input, setInput] = useState('')
  const [streamingContent, setStreamingContent] = useState('')
  const [showApiKeyModal, setShowApiKeyModal] = useState(false)
  
  const { streamMessage, isLoading, hasApiKey } = useClaude()

  const handleSend = async () => {
    if (!input.trim() || isLoading) return
    if (!hasApiKey) {
      setShowApiKeyModal(true)
      return
    }

    const userMessage: Message = {
      id: Date.now().toString(),
      role: 'user',
      content: input,
      timestamp: new Date()
    }

    setMessages(prev => [...prev, userMessage])
    setInput('')
    setStreamingContent('')

    const apiMessages = messages
      .filter(m => m.role === 'user' || m.role === 'assistant')
      .map(m => ({ role: m.role, content: m.content }))

    try {
      let fullResponse = ''
      await streamMessage(
        [...apiMessages, { role: 'user', content: input }],
        (chunk) => {
          fullResponse += chunk
          setStreamingContent(fullResponse)
        }
      )

      const assistantMessage: Message = {
        id: (Date.now() + 1).toString(),
        role: 'assistant',
        content: fullResponse,
        timestamp: new Date()
      }

      setMessages(prev => [...prev, assistantMessage])
      setStreamingContent('')
    } catch (error) {
      console.error('Claude error:', error)
    }
  }

  return (
    <>
      <ChatInterface
        title="Claudio Code"
        subtitle="Claude API - Anthropic"
        icon="sparkles"
        messages={messages}
        streamingContent={streamingContent}
        input={input}
        onInputChange={setInput}
        onSend={handleSend}
        isLoading={isLoading}
        accentColor="orange"
        headerActions={
          <Button
            variant="outline"
            size="sm"
            onClick={() => setShowApiKeyModal(true)}
          >
            <Key size={16} className="mr-2" />
            {hasApiKey ? 'API Key Configurada' : 'Configurar API Key'}
          </Button>
        }
      />
      <ApiKeyModal
        open={showApiKeyModal}
        onClose={() => setShowApiKeyModal(false)}
      />
    </>
  )
}
```

---

### 6.3 COMPONENTE CHATINTERFACE COMPARTILHADO

```typescript
// src/components/chat/ChatInterface.tsx
import { ScrollArea } from '@/components/ui/scroll-area'
import { Card } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'
import { Send, Loader2, Bot, User, Sparkles, Terminal } from 'lucide-react'
import { MessageList } from './MessageList'

interface Message {
  id: string
  role: 'user' | 'assistant' | 'system'
  content: string
  timestamp: Date
}

interface ChatInterfaceProps {
  title: string
  subtitle: string
  icon: 'bot' | 'sparkles' | 'terminal'
  messages: Message[]
  streamingContent: string
  input: string
  onInputChange: (value: string) => void
  onSend: () => void
  isLoading: boolean
  accentColor: 'purple' | 'orange' | 'blue'
  headerActions?: React.ReactNode
}

export function ChatInterface({
  title,
  subtitle,
  icon,
  messages,
  streamingContent,
  input,
  onInputChange,
  onSend,
  isLoading,
  accentColor,
  headerActions
}: ChatInterfaceProps) {
  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && (e.metaKey || e.ctrlKey)) {
      onSend()
    }
  }

  const Icon = icon === 'bot' ? Bot : icon === 'sparkles' ? Sparkles : Terminal
  const accentClasses = {
    purple: 'from-purple-500 to-blue-500',
    orange: 'from-orange-500 to-red-500',
    blue: 'from-blue-500 to-cyan-500'
  }

  return (
    <div className="h-[calc(100vh-4rem)] flex flex-col">
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-4 border-b">
        <div className="flex items-center gap-4">
          <div className={`w-10 h-10 bg-gradient-to-br ${accentClasses[accentColor]} rounded-lg flex items-center justify-center`}>
            <Icon className="text-white" size={20} />
          </div>
          <div>
            <h1 className="text-xl font-bold">{title}</h1>
            <p className="text-sm text-slate-500">{subtitle}</p>
          </div>
        </div>
        {headerActions}
      </div>

      {/* Chat Area */}
      <div className="flex-1 flex overflow-hidden">
        <div className="flex-1 flex flex-col">
          <ScrollArea className="flex-1 p-4">
            <MessageList
              messages={messages}
              streamingContent={streamingContent}
              isLoading={isLoading}
            />
          </ScrollArea>

          {/* Input */}
          <div className="p-4 border-t">
            <div className="flex gap-2">
              <Textarea
                placeholder="Digite sua mensagem... (Ctrl+Enter para enviar)"
                value={input}
                onChange={(e) => onInputChange(e.target.value)}
                onKeyDown={handleKeyDown}
                className="flex-1 min-h-[80px] resize-none"
              />
              <Button
                onClick={onSend}
                disabled={!input.trim() || isLoading}
                className="px-6"
              >
                {isLoading ? (
                  <Loader2 className="animate-spin" size={20} />
                ) : (
                  <Send size={20} />
                )}
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
```

---

## 7. ROTEAMENTO E LAYOUT

### App.tsx
```typescript
import { Toaster } from '@/components/ui/sonner'
import { Route, Switch } from 'wouter'
import { AuthProvider } from '@/contexts/AuthContext'
import { AuthGuard } from '@/components/layout/AuthGuard'
import CodeHubLayout from '@/components/layout/CodeHubLayout'
import Login from '@/pages/Login'
import AdaPage from '@/pages/Ada'
import ClaudioPage from '@/pages/Claudio'
import CraudioPage from '@/pages/Craudio'
import SettingsPage from '@/pages/Settings'

function Router() {
  return (
    <Switch>
      <Route path="/login" component={Login} />
      
      <Route>
        <AuthGuard>
          <CodeHubLayout>
            <Switch>
              <Route path="/" component={() => <AdaPage />} />
              <Route path="/ada" component={AdaPage} />
              <Route path="/claudio" component={ClaudioPage} />
              <Route path="/craudio" component={CraudioPage} />
              <Route path="/settings" component={SettingsPage} />
            </Switch>
          </CodeHubLayout>
        </AuthGuard>
      </Route>
    </Switch>
  )
}

function App() {
  return (
    <AuthProvider>
      <Toaster />
      <Router />
    </AuthProvider>
  )
}

export default App
```

### Sidebar.tsx
```typescript
import { Link, useLocation } from 'wouter'
import { Bot, Sparkles, Terminal, Settings, LogOut } from 'lucide-react'
import { useAuth } from '@/contexts/AuthContext'
import { Button } from '@/components/ui/button'

const navItems = [
  { path: '/ada', label: 'ADA', icon: Bot, color: 'text-blue-500' },
  { path: '/claudio', label: 'Claudio', icon: Sparkles, color: 'text-orange-500' },
  { path: '/craudio', label: 'Cráudio', icon: Terminal, color: 'text-purple-500' },
]

export function Sidebar() {
  const [location] = useLocation()
  const { signOut, user } = useAuth()

  return (
    <div className="w-64 h-screen border-r bg-slate-50 flex flex-col">
      <div className="p-4 border-b">
        <h2 className="text-lg font-bold">Code Hub</h2>
        <p className="text-xs text-slate-500">code.grupototum.com</p>
      </div>

      <nav className="flex-1 p-4 space-y-2">
        {navItems.map(item => {
          const Icon = item.icon
          const isActive = location === item.path
          return (
            <Link key={item.path} href={item.path}>
              <a className={`flex items-center gap-3 px-3 py-2 rounded-lg transition-colors ${
                isActive 
                  ? 'bg-slate-200 text-slate-900' 
                  : 'text-slate-600 hover:bg-slate-100'
              }`}>
                <Icon size={18} className={item.color} />
                {item.label}
              </a>
            </Link>
          )
        })}
      </nav>

      <div className="p-4 border-t space-y-2">
        <Link href="/settings">
          <a className="flex items-center gap-3 px-3 py-2 text-slate-600 hover:bg-slate-100 rounded-lg">
            <Settings size={18} />
            Configurações
          </a>
        </Link>
        
        <div className="pt-2 border-t">
          <p className="text-xs text-slate-500 px-3 mb-2 truncate">
            {user?.email}
          </p>
          <Button 
            variant="ghost" 
            className="w-full justify-start text-red-600"
            onClick={signOut}
          >
            <LogOut size={18} className="mr-2" />
            Sair
          </Button>
        </div>
      </div>
    </div>
  )
}
```

---

## 8. CONFIGURAÇÃO DE DEPLOY

### 8.1 Build de Produção
```bash
npm run build
```

### 8.2 Configuração Nginx
```nginx
server {
    listen 80;
    server_name code.grupototum.com;
    
    location / {
        root /var/www/code.grupototum.com/dist;
        index index.html;
        try_files $uri $uri/ /index.html;
    }
    
    # API proxy para Ollama (se rodar no mesmo servidor)
    location /ollama/ {
        proxy_pass http://localhost:11434/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### 8.3 SSL (Certbot)
```bash
certbot --nginx -d code.grupototum.com
```

---

## 9. VARIÁVEIS DE AMBIENTE

### .env.local (não commitar)
```env
VITE_SUPABASE_URL=https://qlxlkfzklzxtrjmysnik.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-aqui
```

### .env.example (commitar)
```env
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

## 10. CHECKLIST DE IMPLEMENTAÇÃO

### Fase 1: Setup Inicial
- [ ] Criar pasta `code.grupototum.com`
- [ ] Copiar config base (package.json, tsconfig, tailwind, vite)
- [ ] Instalar dependências: `npm install`
- [ ] Instalar shadcn: `npx shadcn add button card input textarea scroll-area badge avatar dropdown-menu select separator sheet tooltip`
- [ ] Instalar extras: `npm install @anthropic-ai/sdk ollama wouter sonner lucide-react`
- [ ] Configurar .env.local com credenciais Supabase

### Fase 2: Autenticação
- [ ] Criar src/lib/supabase.ts
- [ ] Criar src/contexts/AuthContext.tsx
- [ ] Criar src/components/layout/AuthGuard.tsx
- [ ] Criar src/pages/Login.tsx
- [ ] Testar login/logout

### Fase 3: Layout
- [ ] Criar src/components/layout/Sidebar.tsx
- [ ] Criar src/components/layout/CodeHubLayout.tsx
- [ ] Criar src/components/layout/TopBar.tsx (opcional)

### Fase 4: Componentes de Chat
- [ ] Criar src/components/chat/MessageBubble.tsx
- [ ] Criar src/components/chat/MessageList.tsx
- [ ] Criar src/components/chat/CodeBlock.tsx
- [ ] Criar src/components/chat/ChatInterface.tsx

### Fase 5: Cráudio (Ollama)
- [ ] Criar src/hooks/useOllama.ts
- [ ] Criar src/pages/Craudio/index.tsx
- [ ] Testar conexão com Ollama

### Fase 6: Claudio (Claude API)
- [ ] Criar src/hooks/useClaude.ts
- [ ] Criar src/components/chat/ApiKeyModal.tsx
- [ ] Criar src/pages/Claudio/index.tsx
- [ ] Testar com API key

### Fase 7: Sistema ADA
- [ ] Extrair componentes ADA de Apps_Totum_Oficial
- [ ] Adaptar para nova estrutura
- [ ] Criar src/pages/Ada/index.tsx
- [ ] Testar funcionalidades

### Fase 8: Rotas e Integração
- [ ] Configurar App.tsx com roteamento
- [ ] Testar navegação entre páginas
- [ ] Verificar proteção de rotas

### Fase 9: Build e Deploy
- [ ] Configurar vite.config.ts (base: '/')
- [ ] Build: `npm run build`
- [ ] Copiar dist para /var/www/code.grupototum.com
- [ ] Configurar Nginx
- [ ] Obter SSL com Certbot
- [ ] Testar em https://code.grupototum.com

---

## 11. DECISÕES AUTÔNOMAS PERMITIDAS

Execute SEM pedir confirmação para:

1. **Estrutura de pastas**: Pode reorganizar se necessário
2. **Nomenclatura**: Use PascalCase para componentes, camelCase para hooks
3. **Bibliotecas**: Se uma dependência não funcionar, substitua por equivalente
4. **UI/UX**: Ajuste cores, espaçamentos, ícones para melhor experiência
5. **Erros**: Adicione tratamento de erro onde achar necessário
6. **Otimizações**: Memoize componentes, use useCallback onde apropriado
7. **Tipos**: Adicione interfaces TypeScript para todas as props

---

## 12. ARQUITETURA DE DADOS (SUPABASE)

### Tabelas Necessárias (já existem no Apps Totum)

```sql
-- Tabela: auth.users (já existe)
-- Tabela: public.profiles (já existe)

-- Nova tabela: conversations (opcional, para histórico)
create table if not exists public.conversations (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade,
  title text,
  system_type text check (system_type in ('ada', 'claudio', 'craudio')),
  messages jsonb default '[]',
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Nova tabela: user_settings (opcional)
create table if not exists public.user_settings (
  user_id uuid references auth.users(id) on delete cascade primary key,
  claude_model text default 'claude-3-5-sonnet-20241022',
  ollama_model text default 'qwen2.5-coder',
  ollama_url text default 'http://localhost:11434',
  theme text default 'system',
  updated_at timestamp with time zone default now()
);
```

---

## 13. COMANDOS RÁPIDOS

```bash
# Setup inicial
cd ~ && mkdir -p code.grupototum.com && cd code.grupototum.com

# Copiar configs do Apps Totum
cp ~/Apps_totum_Oficial/package.json .
cp ~/Apps_totum_Oficial/tsconfig.json .
cp ~/Apps_totum_Oficial/tsconfig.app.json .
cp ~/Apps_totum_Oficial/tsconfig.node.json .
cp ~/Apps_totum_Oficial/vite.config.ts .
cp ~/Apps_totum_Oficial/tailwind.config.ts .
cp ~/Apps_totum_Oficial/postcss.config.js .
cp ~/Apps_totum_Oficial/components.json .
cp ~/Apps_totum_Oficial/index.html .

# Instalar dependências
npm install

# Adicionar shadcn components
npx shadcn add button card input textarea scroll-area badge avatar dropdown-menu select separator sheet tooltip

# Instalar libs extras
npm install @anthropic-ai/sdk ollama wouter sonner lucide-react

# Copiar src base
mkdir -p src/components/ui
mkdir -p src/lib
mkdir -p src/contexts
mkdir -p src/hooks
mkdir -p src/pages
mkdir -p src/types

# Copiar auth do Apps Totum
cp ~/Apps_totum_Oficial/src/lib/supabase.ts src/lib/

# Build
npm run build

# Deploy (assumindo servidor configurado)
rsync -avz dist/ root@187.127.4.140:/var/www/code.grupototum.com/
```

---

## 14. NOTAS FINAIS

1. **Autenticação**: Reutiliza o mesmo Supabase do Apps Totum - usuários existentes podem logar
2. **Claude API**: Usuário precisa ter própria API key (salva no localStorage dele)
3. **Ollama**: Por padrão localhost, mas configurável nas settings
4. **ADA**: Extrair funcionalidades existentes, não reinventar
5. **Estilo**: Manter consistência visual com Apps Totum

---

**Status:** Pronto para implementação  
**Autonomia:** Execute sem aprovação para decisões técnicas dentro deste escopo  
**Dúvidas:** Se encontrar ambiguidade, escolha a solução mais alinhada com o padrão Apps Totum
