CREATE DATABASE IF NOT EXISTS sistema_rh;
USE sistema_rh;

CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(45) NOT NULL
);

CREATE TABLE turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    turno VARCHAR(7) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL
);

CREATE TABLE cargo (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(45) NOT NULL,
    nivel_hierarquico VARCHAR(45) NOT NULL
);

CREATE TABLE treinamento (
    id_treinamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_treinamento VARCHAR(45) NOT NULL,
    duracao TIME NOT NULL
);

CREATE TABLE setor (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome_setor VARCHAR(45) NOT NULL,
    id_departamento INT NOT NULL,
    CONSTRAINT fk_setor_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE processo_seletivo (
    id_processo_seletivo INT AUTO_INCREMENT PRIMARY KEY,
    inicio DATE NOT NULL,
    fim DATE NULL, 
    nome_processo_seletivo VARCHAR(45) NOT NULL,
    id_departamento INT NOT NULL,
    CONSTRAINT fk_processo_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(45) NOT NULL,
    descricao VARCHAR(45) NULL, -- Opcional
    id_processo_seletivo INT NOT NULL,
    CONSTRAINT fk_vagas_processo FOREIGN KEY (id_processo_seletivo) REFERENCES processo_seletivo(id_processo_seletivo)
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(45) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone BIGINT NOT NULL,
    email VARCHAR(100) NOT NULL, -- Opcional
    data_nascimento DATE NOT NULL,
    status CHAR(1) NOT NULL,
    aposentado CHAR(1) NOT NULL,
    id_turno INT NOT NULL,
    id_cargo INT NOT NULL,
    id_setor INT NOT NULL,
    CONSTRAINT fk_func_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno),
    CONSTRAINT fk_func_cargo FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
    CONSTRAINT fk_func_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);

-- BLOCK 4: OPERACIONAIS E HISTÓRICOS
CREATE TABLE historico_vinculos (
    id_historico_vinculos INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_saida DATE NULL, -- Fica NULL enquanto estiver trabalhando
    tipo_contrato VARCHAR(45) NOT NULL,
    id_funcionario INT NOT NULL,
    CONSTRAINT fk_vinculos_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE ferias (
    id_ferias INT AUTO_INCREMENT PRIMARY KEY,
    inicio DATE NOT NULL,
    fim DATE NOT NULL,
    status_ferias VARCHAR(45) NOT NULL,
    id_funcionario INT NOT NULL,
    CONSTRAINT fk_ferias_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE historico_salarial (
    id_historico_salarial INT AUTO_INCREMENT PRIMARY KEY,
    data_referencia DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_funcionario INT NOT NULL,
    CONSTRAINT fk_salario_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE movimentacao_carreira (
    id_mov_carreira INT AUTO_INCREMENT PRIMARY KEY,
    data_movimentacao DATE NOT NULL,
    tipo_movimentacao VARCHAR(45) NOT NULL,
    id_funcionario INT NOT NULL,
    id_cargo INT NOT NULL,
    CONSTRAINT fk_mov_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    CONSTRAINT fk_mov_cargo FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE inter_funcionario_treinamento (
    id_inter_funcionario_treinamento INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_treinamento INT NOT NULL,
    CONSTRAINT fk_inter_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    CONSTRAINT fk_inter_treino FOREIGN KEY (id_treinamento) REFERENCES treinamento(id_treinamento)
);

CREATE TABLE folha_de_ponto (
    id_ponto INT AUTO_INCREMENT PRIMARY KEY,
    data_referencia DATE NOT NULL,
    data_entrada DATE NULL, -- NULL em caso de falta
    data_saida DATE NULL,   -- NULL em caso de falta ou esquecimento
    hora_entrada TIME NULL, -- NULL em caso de falta
    hora_saida TIME NULL,   -- NULL em caso de falta
    tipo_ocorrencia VARCHAR(45) NOT NULL, -- Not Null com valor padrão
    justificado VARCHAR(45) NOT NULL,        -- Not Null com valor padrão
    motivo_ajuste VARCHAR(45) NULL, -- Só preenche se houver justificativa
    id_funcionario INT NOT NULL,
    CONSTRAINT fk_ponto_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);