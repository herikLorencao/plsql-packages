EXECUTE DEPTREE_FILL('table', 'user_dev', 'cliente');

SELECT * FROM DEPTREE_TEMPTAB;

SELECT NESTED_LEVEL, SCHEMA, TYPE, NAME FROM DEPTREE ORDER BY SEQ#;

EXECUTE DEPTREE_FILL('procedure', 'user_dev', 'INCLUIR_CLIENTE');