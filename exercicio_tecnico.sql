/*
13. Apresentar o nome do professor e o total de disciplinas ministradas por este professor. 
Se o professor não ministrar nenhuma disciplina deve aparecer o valor 0. */

select p.nome_professor, count(t.id_disciplina) as total_disciplina
from professor p left outer join turma t
on p.id_professor = t.id_professor
group by p.nome_professor;

/*
15. Apresentar o nome dos alunos que fizeram a disciplina de Lógica em 2018/1 (utilizar exists).
+++ gemini +++ */

SELECT a.nome_aluno, a.id_aluno
FROM aluno a
WHERE EXISTS (
    SELECT 1
    FROM turma_aluno ta
    INNER JOIN turma t ON ta.id_turma = t.id_turma
    INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
    WHERE ta.id_aluno = a.id_aluno
    AND d.nome_disciplina = 'ProgramaçãoI'
    AND t.semestre = '2018/1'
);
200 201 

/*
14. Apresentar o nome dos cursos e o total de turmas ofertadas em 2018/1. 
Se o curso não tiver nenhuma turma ele deve aparecer também com o total de turma 0. */

select c.nome_curso, count(t.id_turma) as total_turma
from turma t inner join disciplina d
on t.id_disciplina = t.id_disciplina 
right outer join curso c
on c.id_curso = d.id_curso
and t.semestre = '2018/1' 
group by c.nome_curso;

/*
16. Apresentar o nome do aluno que tirou a maior nota na turma 102.*/

select a.nome_aluno, MAX(ta.media_final) 
from aluno a inner join turma_aluno ta
on a.id_aluno = ta.id_aluno
where ta.id_turma = 402
group by a.nome_aluno;

/*
17. Apresentar o nome do aluno que tirou a maior nota na disciplina de BDI em 2018/1.
+++gemini+++ */

SELECT a.nome_aluno, ta.media_final
FROM aluno a INNER JOIN turma_aluno ta 
ON a.id_aluno = ta.id_aluno
INNER JOIN turma t 
ON ta.id_turma = t.id_turma
INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE ta.media_final = (
    SELECT MAX(ta2.media_final)
    FROM turma_aluno ta2
    INNER JOIN turma t2 ON ta2.id_turma = t2.id_turma
    INNER JOIN disciplina d2 ON t2.id_disciplina = d2.id_disciplina
    WHERE d2.nome_disciplina = 'BDI' AND t2.semestre = '2018/1'
)
AND d.nome_disciplina = 'BDI'
AND t.semestre = '2018/1'; 


SELECT a.nome_aluno, MAX(ta.media_final) AS maior_nota_BDI
FROM aluno a
INNER JOIN turma_aluno ta ON a.id_aluno = ta.id_aluno
INNER JOIN turma t ON ta.id_turma = t.id_turma
INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE d.nome_disciplina = 'BDI'
AND t.semestre = '2018/1'
GROUP BY a.nome_aluno
HAVING MAX(ta.media_final) = (
    SELECT MAX(ta.media_final)
    FROM turma_aluno ta
    INNER JOIN turma t ON ta.id_turma = t.id_turma
    INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
    WHERE d.nome_disciplina = 'BDI'
    AND t.semestre = '2018/1'
);

/*
18. Apresentar o nome dos alunos do curso de Informática que nunca cursaram a disciplina de BDI. */

select a.nome_aluno, a.id_aluno 
from aluno a inner join turma_aluno ta
on a.id_aluno = ta.id_aluno
inner join turma t
on ta.id_turma = t.id_turma
inner join disciplina d
on t.id_disciplina = d.id_disciplina
inner join curso c
on d.id_curso = c.id_curso
where c.nome_curso = 'Informática'
and NOT EXISTS (
    SELECT 1
    FROM turma_aluno ta
    INNER JOIN turma t ON ta.id_turma = t.id_turma
    INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
    WHERE ta.id_aluno = a.id_aluno
    AND d.nome_disciplina = 'BDI'
    )
;

/*
19. Listar o nome dos cursos com o nome de sua respectiva área. Mesmo que o curso não tenha área ele deve aparecer. Utilizar COALESCE para colocar o texto Área não informada se o curso não tiver área. */


select c.nome_curso, COALESCE(a.nome_area, 'Área não informada') as area
from curso c inner join area a
on c.id_area = a.id_area

