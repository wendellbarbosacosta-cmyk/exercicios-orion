-- 1. Criação da tabela de cursos
-- Utiliza SERIAL para que o banco gerencie o ID sequencialmente de forma automática.
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL
);

-- 2. Criação da tabela de alunos com Chave Estrangeira (FK)
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    curso_id INTEGER NOT NULL,
    CONSTRAINT fk_curso
        FOREIGN KEY (curso_id) 
        REFERENCES cursos(id)
);

-- 3. Inserção de 3 cursos
INSERT INTO cursos (nome_curso) VALUES
('Data Science e IA'),
('Desenvolvimento Web'),
('Arquitetura de Software');

-- 4. Inserção de 4 alunos relacionando-os com os cursos criados
INSERT INTO alunos (nome, email, curso_id) VALUES
('Wendell Costa', 'wendell@email.com', 1),
('Danilo Silva', 'danilo@email.com', 2),
('Maria Oliveira', 'maria@email.com', 1),
('João Souza', 'joao@email.com', 3);

-- 5. Consulta para validar a inserção
SELECT * FROM alunos;