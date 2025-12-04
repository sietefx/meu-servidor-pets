-- 1. Listar pets de um tutor específico
SELECT nome, especie, raca 
FROM Pet
WHERE tutor_id = 1;

-- 2. Eventos ordenados pela data
SELECT e.*, p.nome AS pet 
FROM Evento_de_Saude e
JOIN Pet p ON p.pet_id = e.pet_id
ORDER BY data_evento DESC;

-- 3. Buscar documentos anexados a eventos de exames
SELECT d.nome_arquivo, e.descricao 
FROM Documento d
JOIN Evento_de_Saude e ON e.evento_id = d.evento_id
WHERE e.tipo_evento = 'Exame';

-- 4. Listar lembretes pendentes
SELECT l.*, p.nome 
FROM Lembrete l
JOIN Evento_de_Saude e ON e.evento_id = l.evento_id
JOIN Pet p ON p.pet_id = e.pet_id
WHERE l.status = 'Pendente';

-- 5. Limitar resultados (TOP 2 últimos eventos)
SELECT *
FROM Evento_de_Saude
ORDER BY data_evento DESC
LIMIT 2;