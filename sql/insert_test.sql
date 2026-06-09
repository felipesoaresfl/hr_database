-- 1. Departamentos
INSERT INTO departamento (nome_departamento) VALUES 
('Recursos Humanos'),
('Tecnologia da Informação'),
('Operações e Logística'),
('Comercial e Vendas'),
('Financeiro');

-- 2. Turnos
INSERT INTO turno (turno, hora_inicio, hora_fim) VALUES 
('1º T', '06:00:00', '14:00:00'),
('2º T', '14:00:00', '22:00:00'),
('3º T', '22:00:00', '06:00:00'), -- Turno Noturno
('Comerc', '08:00:00', '17:00:00'),
('Flex', '10:00:00', '19:00:00');

-- 3. Cargos
INSERT INTO cargo (nome_cargo, nivel_hierarquico) VALUES 
('Auxiliar Operacional', 'Operacional'),
('Analista de Sistemas', 'Pleno'),
('Supervisor de Logística', 'Especialista'),
('Gerente de RH', 'Gerencial'),
('Diretor Comercial', 'Diretoria');

-- 4. Treinamentos
INSERT INTO treinamento (nome_treinamento, duracao) VALUES 
('Integração de Novos Colaboradores', '04:00:00'),
('Segurança do Trabalho e CIPA', '08:00:00'),
('LGPD no Ambiente Corporativo', '02:00:00'),
('Liderança e Gestão de Conflitos', '16:00:00'),
('Excel Avançado e Dashboards', '20:00:00');

-- 5. Setores
INSERT INTO setor (nome_setor, id_departamento) VALUES 
('Recrutamento e Seleção', 1),
('Desenvolvimento de Software', 2),
('Armazenagem e Estoque', 3),
('Vendas Internas', 4),
('Contas a Pagar', 5);

-- 6. Processos Seletivos
INSERT INTO processo_seletivo (inicio, fim, nome_processo_seletivo, id_departamento) VALUES 
('2026-01-10', '2026-02-15', 'Talentos Tech 2026', 2),
('2026-05-01', NULL, 'Expansão Comercial Nordeste', 4), -- Processo em aberto (2026)
('2025-11-01', '2025-12-20', 'Estágio em Finanças', 5),
('2026-05-20', NULL, 'Líder de Atendimento', 1),       -- Processo em aberto (2026)
('2024-06-01', '2024-07-01', 'Operadores de Logística', 3);

-- 7. Vagas
INSERT INTO vagas (nome_cargo, descricao, id_processo_seletivo) VALUES 
('Analista de Sistemas', 'Desenvolvimento Java e MySQL', 1),
('Consultor de Vendas', 'Prospecção de novos clientes PJ', 2),
('Estagiário Financeiro', 'Suporte em rotinas de conciliação', 3),
('Business Partner', 'Atuação generalista de RH', 4),
('Auxiliar Operacional', 'Separação e conferência de carga', 5);

-- 8. Funcionários
INSERT INTO funcionarios (nome_funcionario, cpf, telefone, email, data_nascimento, status, aposentado, id_turno, id_cargo, id_setor) VALUES 
('Carlos Augusto Silva', '12345678901', 11991234123, 'carlos.silva@empresa.com', '1958-03-12', 'A', 'S', 3, 1, 3), -- Aposentado e Ativo no 3º Turno
('Mariana Costa Oliveira', '98765432100', 21981234567, 'mariana.costa@empresa.com', '1988-08-25', 'A', 'N', 3, 2, 2), -- Ativa no 3º Turno
('Roberto Almeida Santos', '45612378902', 31971112233, 'roberto.santos@empresa.com', '1975-11-02', 'A', 'N', 4, 3, 3),
('Fernanda Souza Lima', '78945612305', 71992223344, 'fernanda.lima@empresa.com', '1982-05-14', 'A', 'N', 4, 4, 1),
('Ricardo Pereira Melo', '32165409877', 81987654321, 'ricardo.melo@empresa.com', '1995-01-30', 'I', 'N', 1, 1, 3); -- Inativo (Demitido)

INSERT INTO historico_vinculos (data_inicio, data_saida, tipo_contrato, id_funcionario) VALUES 
('2015-01-10', '2024-03-01', 'Efetivo', 1), -- Mudou de CLT para Efetivo
('2024-06-01', NULL, 'PJ', 1),         
('2020-05-01', NULL, 'Efetivo', 2),         
('2018-02-15', NULL, 'Efetivo', 3),         
('2021-10-01', NULL, 'Efetivo', 4),         
('2022-03-01', '2025-11-30', 'Efetivo', 5);

INSERT INTO ferias (inicio, fim, status_ferias, id_funcionario) VALUES 
('2026-06-15', '2026-07-14', 'Agendada', 2),   -- Férias da Mariana nos próximos 60 dias
('2026-07-01', '2026-07-15', 'Agendada', 3),   -- Férias do Roberto nos próximos 60 dias
('2026-12-20', '2027-01-18', 'Agendada', 4),   -- Férias da Fernanda no fim do ano
('2025-01-05', '2025-02-03', 'Finalizada', 1), -- Férias passadas do Carlos
('2026-01-10', '2026-01-20', 'Cancelada', 5);  -- Férias do Ricardo que foram canceladas antes dele sair

INSERT INTO historico_salarial (data_referencia, salario, id_funcionario) VALUES 
('2024-06-01', 3500.00, 1), 
('2020-05-01', 5000.00, 2), 
('2023-01-01', 6200.00, 2), 
('2018-02-15', 7500.00, 3), 
('2021-10-01', 12000.00, 4),
('2022-03-01', 3000.00, 5);

INSERT INTO movimentacao_carreira (data_movimentacao, tipo_movimentacao, id_funcionario, id_cargo) VALUES 
-- Histórico do Carlos (ID 1)
('2015-01-10', 'Admissão', 1, 1),          -- Entrou originalmente como Auxiliar Operacional
('2026-02-01', 'Aumento Salarial', 1, 1),  -- Recebeu um aumento recente por mérito como PJ
-- Histórico da Mariana (ID 2)
('2020-05-01', 'Admissão', 2, 1),          -- Entrou na empresa como Auxiliar Operacional
('2025-08-10', 'Promoção', 2, 2),          -- Foi promovida para Analista de Sistemas nos últimos 12 meses (Valida a View J)
-- Histórico do Roberto (ID 3)
('2018-02-15', 'Admissão', 3, 3),          -- Entrou direto como Supervisor de Logística
('2023-05-12', 'Transferência', 3, 3),     -- Foi transferido de filial/setor mantendo o mesmo cargo
-- Histórico da Fernanda (ID 4)
('2021-10-01', 'Admissão', 4, 4),          -- Entrou como Gerente de RH
-- Histórico do Ricardo (ID 5)
('2022-03-01', 'Admissão', 5, 1);

INSERT INTO inter_funcionario_treinamento (id_funcionario, id_treinamento) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), 
(1, 2), (3, 2),                 
(2, 3), (4, 3),                 
(4, 4),                         
(2, 5);

INSERT INTO folha_de_ponto (data_referencia, data_entrada, data_saida, hora_entrada, hora_saida, tipo_ocorrencia, justificado, motivo_ajuste, id_funcionario) VALUES 
('2026-06-01', '2026-06-01', '2026-06-01', '08:00:00', '17:00:00', 'Normal', 'Não', NULL, 3),
('2024-02-12', NULL, NULL, NULL, NULL, 'Falta', 'Não', NULL, 1), 
('2025-03-03', NULL, NULL, NULL, NULL, 'Falta', 'Não', NULL, 2), 
('2026-02-16', NULL, NULL, NULL, NULL, 'Falta', 'Não', NULL, 1), 
('2026-02-17', '2026-02-17', '2026-02-17', '11:15:00', '17:00:00', 'Atraso', 'Não', NULL, 3);