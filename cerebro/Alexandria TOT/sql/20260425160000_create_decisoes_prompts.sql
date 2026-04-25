CREATE TABLE IF NOT EXISTS decisoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    contexto TEXT NOT NULL,
    decisao TEXT NOT NULL,
    responsavel TEXT NOT NULL,
    impacto TEXT,
    status TEXT DEFAULT 'ativa',
    tags TEXT[],
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS prompts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agente TEXT NOT NULL,
    versao INTEGER NOT NULL DEFAULT 1,
    nome TEXT NOT NULL,
    conteudo TEXT NOT NULL,
    diff TEXT,
    data TIMESTAMPTZ DEFAULT NOW(),
    ativo BOOLEAN DEFAULT TRUE,
    UNIQUE(agente, versao)
);

-- Índices úteis
CREATE INDEX IF NOT EXISTS idx_decisoes_data ON decisoes(data);
CREATE INDEX IF NOT EXISTS idx_decisoes_status ON decisoes(status);
CREATE INDEX IF NOT EXISTS idx_decisoes_tags ON decisoes USING GIN(tags);
CREATE INDEX IF NOT EXISTS idx_prompts_agente ON prompts(agente);
CREATE INDEX IF NOT EXISTS idx_prompts_ativo ON prompts(ativo);

-- Trigger para updated_at na tabela decisoes
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_decisoes_updated_at ON decisoes;
CREATE TRIGGER update_decisoes_updated_at
    BEFORE UPDATE ON decisoes
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();