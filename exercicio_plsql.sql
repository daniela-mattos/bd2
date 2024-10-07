CREATE OR REPLACE PROCEDURE retorna_funcionarios (p_id_funcionario IN NUMBER) IS
p_nome_funcionario VARCHAR(15);
p_cargo VARCHAR(15); 
p_salario NUMBER(6);
BEGIN
SELECT f.nome_funcionario, c.nome_cargo, salario
INTO p_nome_funcionario, p_cargo, p_salario
FROM funcionario f inner join cargo c
ON f.id_cargo = c.id_cargo
WHERE f.id_funcionario = p_id_funcionario;
DBMS_OUTPUT.PUT_LINE(p_nome_funcionario || p_cargo || p_salario);
END;
