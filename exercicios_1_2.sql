Exercício 2 - Parte 1


1. Apresentar o nome do curso e as disciplinas:

select c.nome_curso, d.nome_disciplina
from curso c inner join disciplina d
on c.id_curso = d.id_curso;


2. Apresentar o nome do professor e a sua área:

select p.nome_professor, a.nome_area
from professor p inner join area a
on p.id_area = a.id_area;


3. Apresentar o código da turma, o semestre, o nome do aluno e a nota final:

select t.id_turma, t.semestre, al.nome_aluno, ta.media_final
from turma t inner join turma_aluno ta
on t.id_turma = ta.id_turma
inner join aluno al
on ta.id_aluno = al.id_aluno;


4. Apresentar o nome do aluno, o nome do curso para os alunos que já concluíram o curso:

select a.nome_aluno, c.nome_curso
from aluno a inner join aluno_curso ac
on a.id_aluno = ac.id_aluno
inner join curso c
on c.id_curso = ac.id_curso
where ac.data_fim is not null;


Exercício 2 - parte 2

5. Apresentar código da turma , o nome da disciplina e o nome do professor:

select t.id_turma, d.nome_disciplina, p.nome_professor
from turma t inner join disciplina d
on t.id_disciplina = d.id_disciplina
inner join professor p
on t.id_professor = p.id_professor;


6. Apresentar o nome da disciplina e a nota_final das disciplinas cursadas pelo Aluno Bruno no semestre 2018/1;

select d.nome_disciplina, ta.media_final
from disciplina d inner join turma t
on d.id_disciplina = t.id_disciplina
inner join turma_aluno ta
on t.id_turma = ta.id_turma
inner join aluno a
on ta.id_aluno = a.id_aluno
where a.nome_aluno = 'Bruno'
and t.semestre = '2018/1';


7. Apresentar o nome dos alunos que foram aprovados na disciplina de BDI no semestre de 2018/1:

select a.nome_aluno from aluno a
inner join turma_aluno ta
on ta.id_aluno = a.id_aluno
inner join turma t
on t.id_turma = ta.id_turma
where id_disciplina = 100
and ta.media_final > 6
and t.semestre = '2018/1'


8. Apresentar o total de alunos matriculados nas turmas do semestre 2018/1.

select count(ta.id_aluno) as total_alunos
from turma_aluno ta inner join turma t
on t.id_turma = ta.id_turma
where t.semestre = '2018/1'


9. Apresentar a média geral na disciplina de BDI em 2018/1.

select avg(ta.media_final) as media_bdi
from turma_aluno ta inner join turma t
on ta.id_turma = t.id_turma
where t.id_disciplina = 102


10. Apresentar o código da turma, nome da disciplina e quantidade de alunos para as turma de 2018/1.

select t.id_turma, d.nome_disciplina, count(ta.id_aluno) as total_alunos
from turma t inner join disciplina d
on t.id_disciplina = d.id_disciplina
inner join turma_aluno ta
on t.id_turma = ta.id_turma
where t.semestre = '2018/1'


11. Apresentar o código da turma, nome da disciplina para as turma de 2018/1 com mais de 30 alunos.

select t.id_turma, d.nome_disciplina
from turma t inner join disciplina d
on t.id_disciplina = d.id_disciplina
inner join turma_aluno ta
on t.id_turma = ta.id_turma
group by t.id_turma, d.nome_disciplina
having count(ta.id_aluno) > 30;

12. Apresentar o nome da área e o total de cursos da área. Se a área não tiver nenhum curso deve aparecer o total de cursos 0.

select a.nome_area, count(c.id_curso) as total_cursos
from area a left join curso c
on a.id_area = c.id_area
group by a.nome_area