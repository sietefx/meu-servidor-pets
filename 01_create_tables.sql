-- Criar o banco de dados primeiro (opcional)
-- CREATE DATABASE pet_care_db;
-- USE pet_care_db;

-- Desativar verificação de chaves estrangeiras temporariamente
SET FOREIGN_KEY_CHECKS = 0;

-- Tabela Tutor
CREATE TABLE Tutor (
    tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    senha_hash VARCHAR(255)
);

-- Tabela Pet
CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    tutor_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    sexo VARCHAR(20),
    idade INT,
    peso DECIMAL(5,2),
    foto TEXT,
    FOREIGN KEY (tutor_id) REFERENCES Tutor(tutor_id) ON DELETE CASCADE
);

-- Tabela Evento_de_Saude
CREATE TABLE Evento_de_Saude (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    tipo_evento VARCHAR(50) NOT NULL,
    data_evento DATE NOT NULL,
    descricao TEXT,
    profissional_responsavel VARCHAR(100),
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id) ON DELETE CASCADE
);

-- Tabela Documento
CREATE TABLE Documento (
    documento_id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT NOT NULL,
    nome_arquivo VARCHAR(200),
    tipo_arquivo VARCHAR(20),
    data_upload DATE,
    arquivo TEXT,
    FOREIGN KEY (evento_id) REFERENCES Evento_de_Saude(evento_id) ON DELETE CASCADE
);

-- Tabela Lembrete
CREATE TABLE Lembrete (
    lembrete_id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT NOT NULL,
    data_lembrete DATE NOT NULL,
    mensagem TEXT,
    status VARCHAR(20),
    FOREIGN KEY (evento_id) REFERENCES Evento_de_Saude(evento_id) ON DELETE CASCADE
);

-- Tabela Compartilhamento
CREATE TABLE Compartilhamento (
    compartilhamento_id INT AUTO_INCREMENT PRIMARY KEY,
    tutor_id INT NOT NULL,
    pet_id INT NOT NULL,
    tipo_compartilhamento VARCHAR(50),
    data_compartilhamento DATE,
    destino VARCHAR(120),
    FOREIGN KEY (tutor_id) REFERENCES Tutor(tutor_id) ON DELETE CASCADE,
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id) ON DELETE CASCADE
);

-- Reativar verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;

-- Adicionar índices para melhor performance (opcional)
CREATE INDEX idx_pet_tutor ON Pet(tutor_id);
CREATE INDEX idx_evento_pet ON Evento_de_Saude(pet_id);
CREATE INDEX idx_documento_evento ON Documento(evento_id);
CREATE INDEX idx_lembrete_evento ON Lembrete(evento_id);
CREATE INDEX idx_compartilhamento_tutor ON Compartilhamento(tutor_id);
CREATE INDEX idx_compartilhamento_pet ON Compartilhamento(pet_id);