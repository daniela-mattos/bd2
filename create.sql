
create table area (
    id_area number(4) primary key,
    nome_area varchar(50)
);

create table curso (
    id_curso number(4) primary key,
    nome_curso varchar(40),
    n_semestres number(2),
    turno varchar(5),
    id_area number(4)
);

create sequence s_curso NOCACHE;

alter table curso add constraint FK_area_curso foreign key
(id_area) references area;

create table disciplina (
    id_disciplina number(4) primary key,
    codigo varchar(2),
    nome_disciplina varchar(40),
    n_creditos number(2),
    id_curso number(4)
);

create sequence s_disciplina NOCACHE;

alter table disciplina add constraint FK_curso_disciplina foreign key
(id_curso) references curso;


create table aluno (
    id_aluno number(4) primary key,
    nome_aluno varchar(100),
    data_de_nascimento varchar(10)
);

create sequence s_aluno NOCACHE;

create table professor (
    id_professor number(4) primary key,
    nome_professor varchar(100),
    n_horas number(4),
    id_area number(4)
);

create sequence s_professor NOCACHE;

alter table professor add constraint FK_area_professor foreign key
(id_area) references area;

create table turma (
    id_turma number(4) primary key,
    id_disciplina number(4),
    id_professor number(4),
    semestre number(2),
    turno varchar(5),
    max_alunos number(4)
);

create sequence s_turma NOCACHE;

alter table turma add constraint FK_disciplina_turma foreign key
(id_disciplina) references disciplina;

alter table turma add constraint FK_professor_turma foreign key
(id_professor) references professor;

create table turma_aluno (
    id_turma number(4) ,
    id_aluno number(4),
    media_final number(10),

    constraint PK_turma_aluno primary key (id_turma, id_aluno)
);

alter table turma_aluno add constraint FK_turma_aluno foreign key
(id_turma) references turma;

alter table turma_aluno add constraint FK_turma_aluno_turma foreign key
(id_aluno) references aluno;

create table aluno_curso (
    id_aluno number(4),
    id_curso number(4),
    data_inicio varchar(10),
    data_fim varchar(10),
    turno varchar(5),

    constraint PK_aluno_curso primary key (id_aluno, id_curso)
);

alter table aluno_curso add constraint FK_aluno_curso foreign key
(id_aluno) references aluno;

alter table aluno_curso add constraint FK_curso_aluno_curso foreign key
(id_curso) references curso;

