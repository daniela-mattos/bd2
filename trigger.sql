CREATE OR REPLACE TRIGGER Verifica_Data
BEFORE
INSERT OR UPDATE OF data_admissao
ON Funcionario
FOR EACH ROW
DECLARE
    data_adms date:= sysdate;
BEGIN
 SELECT data_admissao
 INTO data_adms
 FROM Funcionario
 WHERE id_funcionario = :new.id_funcionario;
 IF (:new.data_admissao < data_adms)
 THEN raise_application_error(-20601,
 'Data de admissão inválida.');
 END IF;
 EXCEPTION
 WHEN no_data_found THEN
 NULL;
END;
 
ALTER TABLE funcionario
ADD data_admissao date;
select * from funcionario
select sysdate,current_date from dual;

UPDATE funcionario
SET data_admissao = '2008-11-11'
WHERE id_funcionario = 1;
