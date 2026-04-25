import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://cgpkfhrqprqptvehatad.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNncGtmaHJxcHJxcHR2ZWhhdGFkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NTIyNDI2MiwiZXhwIjoyMDkwODAwMjYyfQ.kV_iFypk00cXplJNUnSW8FEz04v2HD9z5lO5X9eJFag';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const decisoes = [
  {
    data: '2026-04-12',
    contexto: 'Criação de agentes/subagentes sem processo',
    decisao: 'NUNCA criar agente/subagente sem consultar POP-001 ou POP-002 e obter aprovação explícita',
    responsavel: 'Israel',
    impacto: 'Evita retrabalho, mantém governança',
    status: 'ativa',
    tags: ['governanca', 'agentes', 'pop']
  },
  {
    data: '2026-04-12',
    contexto: 'Erro com criação do R2D2',
    decisao: 'Criar regra permanente: Processo > Velocidade. Sempre.',
    responsavel: 'Israel',
    impacto: 'Documentação completada com aprovação retrativa',
    status: 'ativa',
    tags: ['governanca', 'processo', 'licao']
  },
  {
    data: '2026-04-15',
    contexto: 'Roteamento Telegram',
    decisao: 'Kimi Totum responde diretamente no Telegram. TOT NUNCA responde mensagens do Telegram diretamente.',
    responsavel: 'Israel',
    impacto: 'Evita duplicação de respostas',
    status: 'ativa',
    tags: ['roteamento', 'telegram', 'kimi-totum']
  },
  {
    data: '2026-04-25',
    contexto: 'Prioridade Alexandria',
    decisao: 'Alexandria é fonte única de verdade. Nenhum agente opera sem contexto da Alexandria.',
    responsavel: 'Israel',
    impacto: 'Toda sessão começa do zero → memória persistente',
    status: 'ativa',
    tags: ['alexandria', 'prioridade', 'memoria']
  },
  {
    data: '2026-04-25',
    contexto: 'Unificação pastas arquitetura',
    decisao: 'Unificar pastas arquitetura e arquiteturas. Subscrever arquivos antigos pelos novos.',
    responsavel: 'Israel',
    impacto: 'Elimina duplicidade de documentação',
    status: 'ativa',
    tags: ['organizacao', 'docs', 'arquitetura']
  },
  {
    data: '2026-04-25',
    contexto: 'Veredito arquitetura Discord',
    decisao: 'Discord é canal de alerta/comando, NUNCA cérebro. Apps Totum continua como interface primária.',
    responsavel: 'Israel + TOT',
    impacto: 'Evita migração desnecessária e quebra de produto',
    status: 'ativa',
    tags: ['discord', 'arquitetura', 'decisao']
  }
];

async function main() {
  console.log('Inserindo decisões na Alexandria...');
  const { data, error } = await supabase.from('decisoes').insert(decisoes).select();
  if (error) {
    console.error('Erro:', error);
    process.exit(1);
  }
  console.log(`✅ ${data.length} decisões inseridas com sucesso`);
}

main();
