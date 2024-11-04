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



