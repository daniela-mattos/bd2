/* 
1-Escrever uma procedure que recebe como parâmetro o nome do departamento e verifica o número de funcionários deste departamento
apresentando na tela a seguinte mensagem:
0 – O departamento não possui funcionários
1-20 – Classificação – Departamento Pequeno
21-30 – Classificação – Departamento Médio
31 ou mais – Classificação – Departamento Grande */

CREATE OR REPLACE PROCEDURE mostra_classificacao (p_nome_departamento IN VARCHAR2) IS
v_total number(6);
BEGIN
    SELECT count(d.id_departamento)
    INTO v_total
    FROM funcionario f inner join departamento d
    ON f.id_departamento = d.id_departamento
    WHERE d.nome_departamento = p_nome_departamento;

    IF v_total = 0 THEN
        DBMS_OUTPUT.PUT_LINE('O departamento não possui funcionários');
    ELSIF v_total <= 20  THEN
        DBMS_OUTPUT.PUT_LINE('Classificação – Departamento Pequeno');
    ELSIF v_total <= 30 THEN
        DBMS_OUTPUT.PUT_LINE('Classificação – Departamento Médio');
    ELSIF v_total > 30 THEN
        DBMS_OUTPUT.PUT_LINE('Classificação – Departamento Grande');
    END IF;

END;

declare 
    v_nome varchar2(100);
begin
    mostra_classificacao ('Vendas');
end;

select * from funcionario

/* 
2- Alterar o exercício 1 e colocar o tipo do departamento como parâmetro OUT. */

CREATE OR REPLACE PROCEDURE retorna_classificacao (p_nome_departamento IN VARCHAR2, p_tipo_departamento OUT VARCHAR2) IS
v_total number(6);

BEGIN
    SELECT count(d.id_departamento)
    INTO v_total
    FROM funcionario f inner join departamento d
    ON f.id_departamento = d.id_departamento
    WHERE d.nome_departamento = p_nome_departamento;

    IF v_total = 0 THEN
        p_tipo_departamento := 'O departamento não possui funcionários';
    ELSIF v_total <= 20  THEN
        p_tipo_departamento := 'Classificação – Departamento Pequeno';
    ELSIF v_total <= 30 THEN
        p_tipo_departamento := 'Classificação – Departamento Médio';
    ELSIF v_total > 30 THEN
        p_tipo_departamento := 'Classificação – Departamento Grande';
    END IF;

END;

declare 
    v_nome varchar2(100);
begin
    retorna_classificacao ('Vendas', v_nome);
    DBMS_OUTPUT.PUT_LINE(v_nome);
end;

select * from departamento

/*
3. Fazer um procedimento que recebe como parâmetro o id do funcionário e
retorna em um parâmetro de saída o cargo do funcionário. */

CREATE OR REPLACE PROCEDURE retorna_cargo_funcionario (p_id_funcionario IN NUMBER,
    p_cargo_funcionario OUT VARCHAR2) IS
BEGIN
    SELECT nome_cargo
    INTO p_cargo_funcionario
    FROM funcionario f inner join cargo c
    ON f.id_funcionario = c.id_cargo
    where f.id_funcionario = p_id_funcionario;
END;

declare 
    v_nome varchar2(30);
begin
    retorna_cargo_funcionario (1, v_nome);
    DBMS_OUTPUT.PUT_LINE(v_nome);
end;

select * from cargo

/*
4 - Fazer uma função que recebe como parâmetro o nome do depto e retorna o somatório dos salários. */

CREATE OR REPLACE FUNCTION retorna_soma_salarios (p_nome_departamento IN VARCHAR) return
NUMBER IS
    v_soma NUMBER;
BEGIN
    Select SUM(f.salario)
    INTO v_soma
    From funcionario f inner join departamento d
    on f.id_departamento = d.id_departamento
    Where d.nome_departamento = p_nome_departamento;
    return v_soma;
END; 

declare 
    v_soma number(6);
begin
    v_soma := retorna_soma_salarios ('Vendas');
    DBMS_OUTPUT.PUT_LINE(v_soma);
end;

select * from funcionario
select * from departamento
