-- 1. INNER JOIN: Mostra o nome do aluno e o nome do curso em que ele está matriculado
SELECT alunos.nome AS "Nome do Aluno", cursos.nome_curso AS "Nome do Curso"
FROM alunos
INNER JOIN cursos ON alunos.curso_id = cursos.id;

-- 2. WHERE e JOIN: Filtra os alunos de um curso específico (ex: "Desenvolvimento Web")
SELECT alunos.nome AS "Nome do Aluno", cursos.nome_curso AS "Nome do Curso"
FROM alunos
INNER JOIN cursos ON alunos.curso_id = cursos.id
WHERE cursos.nome_curso = 'Desenvolvimento Web';

-- 3. UPDATE: Muda o curso de um aluno específico (Maria Oliveira vai para o curso 2)
UPDATE alunos
SET curso_id = 2
WHERE nome = 'Maria Oliveira';

-- SELECT de confirmação após o UPDATE (Para você provar que a Maria mudou de curso)
SELECT alunos.nome AS "Nome do Aluno", cursos.nome_curso AS "Nome do Curso"
FROM alunos
INNER JOIN cursos ON alunos.curso_id = cursos.id;

-- 4. DESAFIO EXTRA: LEFT JOIN e WHERE para descobrir quais cursos não têm alunos matriculados
SELECT cursos.nome_curso AS "Cursos Sem Alunos"
FROM cursos
LEFT JOIN alunos ON cursos.id = alunos.curso_id
WHERE alunos.id IS NULL;