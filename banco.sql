-- 1. Tabela de Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20) DEFAULT 'leitor',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Light Novels (Obras)
CREATE TABLE obras (
    id SERIAL PRIMARY KEY,
    autor_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    titulo VARCHAR(200) NOT NULL,
    sinopse TEXT NOT NULL,
    capa_url VARCHAR(255),
    status VARCHAR(20) DEFAULT 'em_andamento',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabela de Capítulos
CREATE TABLE capitulos (
    id SERIAL PRIMARY KEY,
    obra_id INT REFERENCES obras(id) ON DELETE CASCADE,
    numero_capitulo INT NOT NULL,
    titulo_capitulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    publicado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);