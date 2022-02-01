-- adicionar no inicio do corpo do package

FUNCTION OBTER_CATEGORIA_CLIENTE (
    p_faturamento_previsto IN cliente.faturamento_previsto%type
)
    RETURN cliente.categoria%type
IS
BEGIN
    IF p_faturamento_previsto <= 10000 THEN 
        RETURN 'PEQUENO';
    ELSIF p_faturamento_previsto <= 50000 THEN
        RETURN 'MEDIO';
    ELSIF p_faturamento_previsto <= 100000  THEN
        RETURN 'MEDIO GRANDE';
    ELSE
        RETURN 'GRANDE';
    END IF;   
END;

FUNCTION VERIFICA_SEGMENTO_MERCADO (
    p_id in segmercado.id%type
)
    RETURN boolean
IS
    v_dummy number(1);
BEGIN
    SELECT 1 into v_dummy
        FROM segmercado
        WHERE id = p_id;
    RETURN true;
EXCEPTION   
    WHEN no_data_found then
        RETURN false;
END;

-- adicionar dentro do BEGIN de format_CNPJ

DBMS_OUTPUT.PUT_LINE('Chamei a rotina FORMAT_CNPJ interna');

-- executar como user_app

SET SERVEROUTPUT ON;
EXECUTE CLIENTE_PAC.INCLUIR_CLIENTE(18,'INCLUIR CLIENTE PELO PACOTE USANDO PROC INTERNA', '22222', 2, 50000);