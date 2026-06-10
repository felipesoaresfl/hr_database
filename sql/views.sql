-- Pergunta A: Quantos funcionários aposentados estão atualmente ativos na empresa?
CREATE VIEW vw_aposentados_ativos AS
SELECT COUNT(*) AS total_aposentados_ativos
FROM funcionarios
WHERE aposentado = 'S' AND status = 'A';

SELECT * FROM vw_aposentados_ativos;

-- Pergunta B:  Quais departamentos possuem o maior número de colaboradores efetivos no 3º turno?
CREATE VIEW vw_departamentos_3turno AS
SELECT 
		d.nome_departamento, 
		COUNT(f.id_funcionario) AS total_colaboradores
FROM 
	funcionarios AS f
JOIN setor AS s ON f.id_setor = s.id_setor
JOIN departamento AS d ON s.id_departamento = d.id_departamento
JOIN turno AS t ON f.id_turno = t.id_turno
WHERE t.turno = '3º T'
GROUP BY d.id_departamento, d.nome_departamento
ORDER BY total_colaboradores DESC;

SELECT * FROM vw_departamentos_3turno;

-- Pergunta C: Qual é a média salarial dos funcionários por cargo, por setor e por turno?

CREATE VIEW vw_ultimo_salario_funcionario AS
SELECT 
id_funcionario, 
salario
FROM historico_salarial AS hs
WHERE id_historico_salarial = (
    SELECT MAX(id_historico_salarial) 
    FROM historico_salarial 
    WHERE id_funcionario = hs.id_funcionario
);

CREATE VIEW vw_media_salarial_detalhada AS
SELECT 
c.nome_cargo, 
s.nome_setor, 
t.turno, 
ROUND(AVG(us.salario), 2) AS media_salarial
FROM funcionarios AS f
JOIN cargo AS c ON f.id_cargo = c.id_cargo
JOIN setor AS s ON f.id_setor = s.id_setor
JOIN turno AS t ON f.id_turno = t.id_turno
JOIN vw_ultimo_salario_funcionario AS us ON f.id_funcionario = us.id_funcionario
GROUP BY c.nome_cargo, s.nome_setor, t.turno;

SELECT * FROM vw_media_salarial_detalhada;

--  Pergunta D: Quantos e quais funcionários estão com férias programadas para os próximos 60 dias?

CREATE VIEW vw_ferias_proximos_60_dias AS
SELECT 
f.nome_funcionario, 
fe.inicio, 
fe.fim, 
fe.status_ferias
FROM ferias AS fe
JOIN funcionarios AS f ON fe.id_funcionario = f.id_funcionario
WHERE fe.status_ferias = 'Agendada'
  AND fe.inicio BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY);
  
SELECT * FROM vw_ferias_proximos_60_dias;

SELECT 
COUNT(*) AS total_funcionarios_ferias
FROM vw_ferias_proximos_60_dias;
  
--  Pergunta E: Quantos processos seletivos estão abertos no momento e para quais vagas?

CREATE VIEW vw_processos_seletivos_vagas AS
SELECT 
ps.nome_processo_seletivo, 
COUNT(v.id_vaga) AS total_vagas
FROM processo_seletivo AS ps
LEFT JOIN vagas AS v ON ps.id_processo_seletivo = v.id_processo_seletivo
WHERE ps.fim IS NULL OR ps.fim >= CURDATE()
GROUP BY ps.id_processo_seletivo, ps.nome_processo_seletivo;

CREATE VIEW vw_detalhes_vagas_abertas AS
SELECT 
v.nome_cargo AS nome_vaga, 
ps.nome_processo_seletivo
FROM vagas AS v
JOIN processo_seletivo AS ps ON v.id_processo_seletivo = ps.id_processo_seletivo
WHERE ps.fim IS NULL OR ps.fim >= CURDATE();

SELECT 
COUNT(*) AS total_processos_abertos
FROM vw_processos_seletivos_vagas;

SELECT 
nome_vaga 
FROM vw_detalhes_vagas_abertas;

--  Pergunta F: Quais são os 10 colaboradores possuem maior tempo de empresa?

CREATE VIEW vw_top10_tempo_empresa AS
SELECT 
f.id_funcionario, 
f.nome_funcionario, 
SUM(DATEDIFF(COALESCE(v.data_saida, CURDATE()), v.data_inicio)) AS total_dias_empresa
FROM funcionarios f
JOIN historico_vinculos AS v ON f.id_funcionario = v.id_funcionario
GROUP BY f.id_funcionario, f.nome_funcionario
ORDER BY total_dias_empresa DESC
LIMIT 10;

SELECT 
nome_funcionario, 
total_dias_empresa
FROM vw_top10_tempo_empresa;

--  Pergunta G: Quantos e quais funcionários registraram faltas ou atrasos sem justificativa no período do Carnaval de 2024, 2025, e 2026?

CREATE VIEW vw_ocorrencias_carnaval AS
SELECT 
f.id_funcionario, 
f.nome_funcionario, 
p.data_referencia, 
p.tipo_ocorrencia, 
p.justificado
FROM folha_de_ponto AS p
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
WHERE p.tipo_ocorrencia IN ('Falta', 'Atraso')
  AND p.justificado = 'N'
  AND (
      p.data_referencia BETWEEN '2024-02-10' AND '2024-02-14' OR -- Carnaval 2024
      p.data_referencia BETWEEN '2025-02-28' AND '2025-03-05' OR -- Carnaval 2025
      p.data_referencia BETWEEN '2026-02-13' AND '2026-02-18'    -- Carnaval 2026
  );
  
SELECT 
COUNT(*) AS total_ocorrencias_carnaval
FROM vw_ocorrencias_carnaval;
  
SELECT 
nome_funcionario, 
data_referencia, 
tipo_ocorrencia
FROM vw_ocorrencias_carnaval
ORDER BY data_referencia;

--  Pergunta H: Qual é a taxa de rotatividade de funcionários (turnover) de cada ano nos últimos 5 anos?

CREATE VIEW vw_movimentacao_anual AS
SELECT 
    YEAR(data_inicio) AS ano,
    COUNT(*) AS total_admissoes,
    COUNT(data_saida) AS total_desligamentos
FROM historico_vinculos
GROUP BY YEAR(data_inicio);

CREATE VIEW vw_indicadores_turnover AS
SELECT 
    ano,
    total_admissoes,
    total_desligamentos,
    -- fórmula do turnover: ((admissões + desligamentos) / 2) / ativos * 100
    ROUND((((total_admissoes + total_desligamentos) / 2) / (total_admissoes - total_desligamentos + 1)) * 100, 2) AS taxa_turnover
FROM vw_movimentacao_anual;

SELECT 
ano,
total_admissoes,
total_desligamentos,
taxa_turnover
FROM vw_indicadores_turnover
WHERE ano >= YEAR(CURDATE()) - 5
ORDER BY ano DESC;

--  Pergunta I: Quais treinamentos corporativos tiveram maior participação dos colaboradores?

CREATE VIEW vw_participacao_treinamentos AS
SELECT 
    t.id_treinamento,
    t.nome_treinamento,
    COUNT(ift.id_funcionario) AS total_participantes
FROM treinamento AS t
LEFT JOIN inter_funcionario_treinamento AS ift ON t.id_treinamento = ift.id_treinamento
GROUP BY t.id_treinamento, t.nome_treinamento
ORDER BY total_participantes DESC;

SELECT 
nome_treinamento, 
total_participantes
FROM vw_participacao_treinamentos;

--  Pergunta J: Quais funcionários receberam promoções ou mudanças de cargo nos últimos 12 meses?

CREATE VIEW vw_promocoes_recentes AS
SELECT 
    f.id_funcionario,
    f.nome_funcionario,
    c.nome_cargo AS novo_cargo,
    mc.data_movimentacao AS data_promocao,
    mc.tipo_movimentacao
FROM movimentacao_carreira AS mc
JOIN funcionarios AS f ON mc.id_funcionario = f.id_funcionario
JOIN cargo c ON mc.id_cargo = c.id_cargo
WHERE mc.tipo_movimentacao IN ('Promoção', 'Mudança de cargo')
  AND mc.data_movimentacao >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH);
  
SELECT 
nome_funcionario, 
novo_cargo, 
data_promocao, 
tipo_movimentacao
FROM vw_promocoes_recentes;
