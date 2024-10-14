/* 1-Criar uma view com id_curso,nome,turno, n_semestres where turno='Noite' e 
utilizar a cláusula WITH CHECK OPTION. Fazer testes de insert e delete.
*/
Create or replace view vcursos as
select id_curso, nome_curso, turno, n_semestres
from curso
where turno = 'Noite'
WITH CHECK OPTION;

insert into vcursos values(s_id_curso.nextval,'Biologia','Manhã',6); //não adiciona
  //não deleta item que não seja turno 'Noite'


/* 2 - Criar uma view com alguma função como sum, count ou avg e verificar de aceita algum comando DML como 
insert, update e delete.
*/
create or replace view vmedia_alunos as
select id_turma, AVG(media_final) as media
from turma_aluno
group by id_turma;

insert into vmedia_alunos values(23, 6);// Não funciona nenhum comando DML porque o campo "total" não existe na tabela

/* 3 - Criar uma view com inner join que permita a utilização de dois comandos DML
*/
create or replace view varea_curso as
select a.nome_area, c.nome_curso
from area a inner join curso c
on a.id_area = c.id_area
//por mostrar dados de duas tabelas diferentes, não aceita comandos DML, principalmente insert.

/* 4 - Criar uma view que apresenta o nome dos alunos que foram aprovados em todas as disciplinas do curso 1.
- tentando (fazer usando as quantidades) */

select a.nome_aluno 
from aluno a inner join turma_aluno ta
on a.id_aluno = ta.id_aluno
inner join turma t
on ta.id_turma = t.id_turma
inner join disciplina d
on t.id_disciplina = d.id_disciplina
where ta.media_final >= 7 and d.id_curso = 1
group by a.nome_aluno
  having count(*) = (select count(*)
  from disciplina
  where id_curso=1);

select * from aluno
select * from varea_curso
select * from vmedia_alunos
select * from vcursos
select * from curso
select * from area
select * from turma_aluno
select * from disciplina
