-- Tutores
INSERT INTO Tutor (nome, email, telefone, senha_hash)
VALUES 
('Gabriel Felix', 'gabriel@example.com', '49988334455', 'hash123'),
('Maria Silva', 'maria@example.com', '48999112233', 'hash456');

-- Pets
INSERT INTO Pet (tutor_id, nome, especie, raca, sexo, idade, peso)
VALUES
(1, 'Luna', 'Cachorro', 'Shih-tzu', 'Fêmea', 3, 4.8),
(1, 'Thor', 'Gato', 'SRD', 'Macho', 2, 3.4),
(2, 'Bidu', 'Cachorro', 'Beagle', 'Macho', 5, 10.2);

-- Eventos de Saúde
INSERT INTO Evento_de_Saude (pet_id, tipo_evento, data_evento, descricao, profissional_responsavel)
VALUES
(1, 'Vacina', '2025-01-10', 'Vacina V10 aplicada', 'Dra. Marina'),
(1, 'Consulta', '2025-02-15', 'Consulta de rotina', 'Dr. João'),
(2, 'Exame', '2025-03-05', 'Exame de sangue completo', 'Dra. Paula');

-- Documentos
INSERT INTO Documento (evento_id, nome_arquivo, tipo_arquivo, data_upload, arquivo)
VALUES
(3, 'exame_sangue_luna.pdf', 'PDF', '2025-03-06', 'link_arquivo.pdf');

-- Lembretes
INSERT INTO Lembrete (evento_id, data_lembrete, mensagem, status)
VALUES
(1, '2026-01-10', 'Reforço da vacina V10', 'Pendente'),
(3, '2025-03-12', 'Retorno para avaliação dos exames', 'Enviado');

-- Compartilhamento
INSERT INTO Compartilhamento (tutor_id, pet_id, tipo_compartilhamento, data_compartilhamento, destino)
VALUES
(1, 1, 'PDF', '2025-02-20', 'Clinivet Centro');