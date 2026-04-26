CREATE DATABASE IF NOT EXISTS sistema_inscricao_matricula
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE sistema_inscricao_matricula;

CREATE TABLE estudante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_estudante INT UNIQUE,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  senha VARCHAR(100),
  data_nascimento DATE
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE curso (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE inscricao (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudante_id INT,
  data_inscricao DATE,
  estado ENUM ('Cocluida', 'Ativa', 'Cancelada') DEFAULT 'ativa',
  FOREIGN KEY (estudante_id) REFERENCES estudante(id)
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE matricula (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudante_id INT,
  curso_id INT,
  semestre VARCHAR(20),
  data_matricula DATE,
  estado ENUM ('Pendente', 'Aprovada', 'Rejeitada') DEFAULT 'Pendente',
  FOREIGN KEY (estudante_id) REFERENCES estudante(id),
  FOREIGN KEY (curso_id) REFERENCES curso(id)
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pagamento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudante_id INT,
  matricula_id INT,
  valor DECIMAL(10,2),
  tipo VARCHAR(50), -- Ex: Matrícula, Inscricao
  comprovativo VARCHAR(255),
  data_pagamento DATE,
  estado ENUM ('Pendente', 'Aprovada', 'Rejeitada') DEFAULT 'Pendente',
  FOREIGN KEY (estudante_id) REFERENCES estudante(id),
  FOREIGN KEY (matricula_id) REFERENCES matricula(id)
);

-- INSERCAO DE DADOS 
INSERT INTO estudante (id, numero_estudante, nome, email, senha, data_nascimento) VALUES 
(DEFAULT, '710240047', 'Fatima Bibi Usman', 'fbibi@gmail.com', '1234567', 2000-06-24),
(DEFAULT, '710240040', 'Maria Amelia', 'maria@gmail.com', '7654321', 1994-07-20);


INSERT INTO curso (id, nome) VALUES
(1, 'Administracao Publica'),
(2, 'Contabilidade e Auditoria'),
(3, 'Direito'),
(4,  'Gestao de Recursos Humanos'),
(5, 'Gestao Ambiental'),
(6, 'Economia e Gestao'),
(7, 'Engenharia de Minas'),
(8, 'Geologia'),
(9,  'Engenharia de Processamento Mineral'),
(10, 'Tecnologias de Informacao');

INSERT INTO matricula (id, estudante_id, curso_id, semestre, data_matricula, estado) VALUES
(1, 2, 10, 'segundo', '2023-11-30', DEFAULT); 

SELECT * FROM estudante;
SELECT * FROM curso;
SELECT * FROM inscricao;
SELECT * FROM matricula;
SELECT * FROM pagamento;



