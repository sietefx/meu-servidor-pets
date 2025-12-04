-- UPDATE 1 — Atualizar peso do pet
UPDATE Pet
SET peso = 5.2
WHERE pet_id = 1;

-- UPDATE 2 — Alterar status de lembrete
UPDATE Lembrete
SET status = 'Pendente'
WHERE lembrete_id = 2;

-- UPDATE 3 — Ajustar descrição do evento
UPDATE Evento_de_Saude
SET descricao = 'Consulta anual de rotina'
WHERE evento_id = 2;


-- DELETE 1 — Remover documento
DELETE FROM Documento
WHERE documento_id = 1;

-- DELETE 2 — Remover lembrete cancelado
DELETE FROM Lembrete
WHERE lembrete_id = 2;

-- DELETE 3 — Remover evento incorreto
DELETE FROM Evento_de_Saude
WHERE evento_id = 3;