-- adicionar no cabeçalho de CLIENTE_PAC

g_cli_lim_fatur_pequeno NUMBER(10) := 10000;
g_cli_lim_fatur_medio NUMBER(10) := 50000;
g_cli_lim_fatur_medio_grande NUMBER(10) := 100000;

-- alterar o corpo do pacote CLIENTE_PAC no método obter_categoria_cliente

IF p_faturamento_previsto <= g_cli_lim_fatur_pequeno THEN
    RETURN 'PEQUENO';
ELSIF p_faturamento_previsto <= g_cli_lim_fatur_medio THEN
    RETURN 'MEDIO';
ELSIF p_faturamento_previsto <= g_cli_lim_fatur_medio_grande  THEN
    RETURN 'MEDIO GRANDE';
ELSE
    RETURN 'GRANDE';
END IF;  

-- user_app

EXECUTE APP_INCLUIR_CLIENTE (30, 'INCLUIDO USADO PACKAGE', '33343', 2, 100000);

SELECT * FROM CLIENTE;

SET SERVEROUTPUT ON;
EXEC dbms_output.put_line(CLIENTE_PAC.g_cli_lim_fatur_medio_grande);

-- alterar o valor da constante no package

g_cli_lim_fatur_medio_grande NUMBER(10) := 90000;

-- user_app

SET SERVEROUTPUT ON;

EXECUTE APP_INCLUIR_CLIENTE (35, 'INCLUIDO USADO PACKAGE', '33343', 2, 100000);

SELECT * FROM CLIENTE;