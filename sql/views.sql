CREATE VIEW vw_aposentados_ativos AS
SELECT COUNT(*) AS total_aposentados_ativos
FROM funcionarios
WHERE aposentado = 'S' AND status = 'A';

SELECT * FROM vw_aposentados_ativos;