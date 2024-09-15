

INSERT INTO area (id_area, nome_area)
VALUES (1, 'Tecnologia da Informacao');

INSERT INTO area (id_area, nome_area)
VALUES (2, 'Letras');

INSERT INTO area (id_area, nome_area)
VALUES (3, 'Ciencias');

INSERT INTO area (id_area, nome_area)
VALUES (4, 'Engenharia');


INSERT INTO curso (id_curso, nome_curso, n_semestres, turno, id_area)
VALUES (s_curso.NEXTVAL, 'Engenharia Eletrica', 8, 'Noite', 4);

INSERT INTO curso (id_curso, nome_curso, n_semestres, turno, id_area)
VALUES (s_curso.NEXTVAL, 'Sistemas para internet', 8, 'Manha', 1);

INSERT INTO curso (id_curso, nome_curso, n_semestres, turno, id_area)
VALUES (s_curso.NEXTVAL, 'Português', 8, 'Noite', 2);

INSERT INTO curso (id_curso, nome_curso, n_semestres, turno, id_area)
VALUES (s_curso.NEXTVAL, 'Biologia', 8, 'Tarde', 3);


INSERT INTO disciplina (id_disciplina, nome_disciplina, n_creditos, id_curso)
VALUES (s_disciplina.NEXTVAL, 'Banco de Dados', 60, 2);

INSERT INTO disciplina (id_disciplina, nome_disciplina, n_creditos, id_curso)
VALUES (s_disciplina.NEXTVAL, 'Introducao a LP', 30, 3);

INSERT INTO disciplina (id_disciplina, nome_disciplina, n_creditos, id_curso)
VALUES (s_disciplina.NEXTVAL, 'Fisica', 60, 1);

INSERT INTO disciplina (id_disciplina, nome_disciplina, n_creditos, id_curso)
VALUES (s_disciplina.NEXTVAL, 'Citologia', 60, 4);


INSERT INTO aluno (id_aluno, nome_aluno, data_nascimento)
VALUES (s_aluno.NEXTVAL, 'Alan Dart', '07/05/1979');

INSERT INTO aluno (id_aluno, nome_aluno, data_nascimento)
VALUES (s_aluno.NEXTVAL, 'Bart Pirt', '17/03/2001');

INSERT INTO aluno (id_aluno, nome_aluno, data_nascimento)
VALUES (s_aluno.NEXTVAL, 'Call Ist', '07/10/1989');

INSERT INTO aluno (id_aluno, nome_aluno, data_nascimento)
VALUES (s_aluno.NEXTVAL, 'Dala Vant', '10/12/2010');


INSERT INTO professor (id_professor,nome_professor,n_horas,id_area)
VALUES (s_professor.NEXTVAL, 'Trex Alont', 20, 1);

INSERT INTO professor (id_professor,nome_professor,n_horas,id_area)
VALUES (s_professor.NEXTVAL, 'Cris Totler', 20, 4);

INSERT INTO professor (id_professor,nome_professor,n_horas,id_area)
VALUES (s_professor.NEXTVAL, 'Marc Felx', 40, 2);

INSERT INTO professor (id_professor,nome_professor,n_horas,id_area)
VALUES (s_professor.NEXTVAL, 'Darw Pels', 60, 3);


INSERT INTO turma (id_turma,id_disciplina,id_professor,semestre,turno,max_alunos)
VALUES (s_turma.NEXTval, 6, 3, 1, 'noite', 50);

INSERT INTO turma (id_turma,id_disciplina,id_professor,semestre,turno,max_alunos)
VALUES (s_turma.NEXTval, 5, 1, 2, 'manha', 50);

INSERT INTO turma (id_turma,id_disciplina,id_professor,semestre,turno,max_alunos)
VALUES (s_turma.NEXTval, 7, 2, 1, 'manha', 50);

INSERT INTO turma (id_turma,id_disciplina,id_professor,semestre,turno,max_alunos)
VALUES (s_turma.NEXTval, 8, 4, 4, 'noite', 50);


INSERT INTO turma_aluno (id_turma,id_aluno,media_final)
VALUES (1, 2, 9);

INSERT INTO turma_aluno (id_turma,id_aluno,media_final)
VALUES (2, 3, 7);

INSERT INTO turma_aluno (id_turma,id_aluno,media_final)
VALUES (3, 4, 8);

INSERT INTO turma_aluno (id_turma,id_aluno,media_final)
VALUES (4, 5, 10);



INSERT INTO aluno_curso (id_aluno,id_curso,data_inicio,data_fim,turno)
VALUES (2, 3, '01/08/2024', '01/12/2024', 'manha');

INSERT INTO aluno_curso (id_aluno,id_curso,data_inicio,data_fim,turno)
VALUES (3, 2, '01/08/2024', '01/12/2024', 'manha');

INSERT INTO aluno_curso (id_aluno,id_curso,data_inicio,data_fim,turno)
VALUES (4, 1, '01/08/2024', '01/12/2024', 'manha');

INSERT INTO aluno_curso (id_aluno,id_curso,data_inicio,data_fim,turno)
VALUES (5, 4, '01/08/2024', '01/12/2024', 'manha');
