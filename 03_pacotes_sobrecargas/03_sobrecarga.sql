-- cabeçalho do pacote --

PROCEDURE INCLUIR_CLIENTE (
    p_id in cliente.id%type,
    p_razao_social in cliente.razao_social%type,
    p_segmercado_id cliente.segmercado_id%type
);

-- corpo do pacote --

PROCEDURE INCLUIR_CLIENTE (
    p_id in cliente.id%type,
    p_razao_social in cliente.razao_social%type,
    p_segmercado_id cliente.segmercado_id%type
)
IS
    v_codigo_erro number(5);
    v_mensagem_erro varchar2(200);
    v_dummy number;
    v_verifica_segmento boolean;
    e_segmento exception;
BEGIN
    v_verifica_segmento :=     verifica_segmento_mercado(p_segmercado_id);
    IF v_verifica_segmento = false THEN
        RAISE e_segmento;
    END IF;
    INSERT INTO cliente (ID, RAZAO_SOCIAL, SEGMERCADO_ID, DATA_INCLUSAO)
        VALUES (p_id, UPPER(p_razao_social), p_segmercado_id, SYSDATE);
    COMMIT;   
EXCEPTION
    WHEN dup_val_on_index then
        raise_application_error(-20010,'Cliente já cadastrado');
    WHEN e_segmento then
        raise_application_error (-20011,'Segmento de mercado inexistente');
    WHEN OTHERS then
        v_codigo_erro := sqlcode;
        v_mensagem_erro := sqlerrm;
        raise_application_error (-20000,to_char(v_codigo_erro)||v_mensagem_erro);
END;

EXECUTE CLIENTE_PAC.INCLUIR_CLIENTE(15, 'INCLUIR CLIENTE COM 5 PARAMETROS', '99999',2, 90000);

SELECT * FROM CLIENTE;

EXECUTE CLIENTE_PAC.INCLUIR_CLIENTE(16, 'INCLUIR CLIENTE COM 3 PARAMETROS', 2);