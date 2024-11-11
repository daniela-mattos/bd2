/* Salva resultado em uma tabela */
/*1. Fazer um procedimento que escreve na tela as seguintes informações dos funcionários de um determinado departamento: o nome do funcionário, o cargo e o salário. (o id do departamento é passado como parâmetro)
*/
CREATE OR REPLACE PROCEDURE ex1 (p_id_departamento IN funcionario.id_departamento%type)
IS
CURSOR c_func_cargo IS
SELECT nome_funcionario, nome_cargo,salario
FROM Funcionario f inner join cargo c
on f.id_cargo = c.id_cargo
where f.id_departamento = p_id_departamento;

r_fc c_func_cargo%rowtype;

BEGIN

open c_func_cargo;
LOOP
FETCH c_func_cargo INTO r_fc;
IF c_func_cargo%NOTFOUND
THEN -- se encontrar o fim do cursor
EXIT;
END IF;
DBMS_OUTPUT.PUT_LINE(r_fc.nome_funcionario||' ' ||r_fc.nome_cargo||' ' ||r_fc.salario);
END LOOP;
close c_func_cargo;
END;
/


CREATE OR REPLACE PROCEDURE ex1 (p_id_departamento IN funcionario.id_departamento%type)
IS
CURSOR c_func_cargo IS
SELECT nome_funcionario, nome_cargo,salario
FROM Funcionario f inner join cargo c
on f.id_cargo = c.id_cargo
where f.id_departamento = p_id_departamento;

BEGIN

for res in c_func_cargo LOOP
DBMS_OUTPUT.PUT_LINE(res.nome_funcionario||' ' ||res.nome_cargo||' ' ||res.salario);
END LOOP;
END;
/



/*2. Fazer uma função que retorna a soma de salários dos funcionários de um departamento.
*/
CREATE OR REPLACE FUNCTION soma_salario(p_id_departamento IN NUMBER)
RETURN NUMBER
IS
v_salario NUMBER;
BEGIN
select sum(salario)
into v_salario
from funcionario
where id_departamento=p_id_departamento;

return v_salario;
end;

/

/*3. Fazer uma função que recebe como parâmetro o id do funcionário e retorna o nome do departamento do funcionário.
*/
CREATE OR REPLACE FUNCTION retorna_depto(p_id_funcionario IN NUMBER)

RETURN VARCHAR2
IS
v_nome VARCHAR2(20);
BEGIN

select d.nome_departamento
into v_nome
from funcionario f inner join departamento d
on f.id_departamento = d.id_departamento
where f.id_funcionario=p_id_funcionario;

return v_nome;
end;

/

/*4. Fazer um procedimento que escreve em uma tabela o nome do departamento e a soma de salários para este departamento.
*/
CREATE OR REPLACE PROCEDURE ex4
IS
CURSOR c_depto_salario IS
SELECT d.nome_departamento,sum(f.salario) total
FROM Funcionario f inner join departamento d
on f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

v_count number:=0;

BEGIN

for r_depto in c_depto_salario loop
  select count(*)
  into v_count
  from soma_depto
  where nome=r_depto.nome_departamento;
  if v_count=0
  then insert into soma_depto(nome,soma) values(r_depto.nome_departamento,r_depto.total);
  else update soma_depto
           set soma=r_depto.total
           where nome=r_depto.nome_departamento;
   end if;
   
END LOOP;
END;



/*Rascunhos*/
/* Mostra resultado em tela */
DECLARE
    CURSOR c_departamento IS
    SELECT d.nome_departamento, SUM(f.salario) AS total_salario
    FROM departamento d inner join funcionario f 
    on d.id_departamento = f.id_departamento
    GROUP BY d.nome_departamento;
    
BEGIN
    FOR r_departamento IN c_departamento LOOP
        DBMS_OUTPUT.PUT_LINE(r_departamento.nome_departamento);
        DBMS_OUTPUT.PUT_LINE(r_departamento.total_salario);
    END LOOP;
END; 

/* Falta revisar o IN

DECLARE
    CURSOR c_funcionario (p_departamento number) IS
    SELECT nome_funcionario, id_cargo, salario
    FROM funcionario 
    WHERE id_departamento = p_departamento;
BEGIN
    FOR r_funcionario IN c_funcionario(?) LOOP
        DBMS_OUTPUT.PUT_LINE(r_funcionario.nome_funcionario);
        DBMS_OUTPUT.PUT_LINE(r_funcionario.salario);
        DBMS_OUTPUT.PUT_LINE(r_funcionario.id_cargo);
    END LOOP;
END; 
*/
