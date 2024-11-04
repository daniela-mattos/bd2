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
