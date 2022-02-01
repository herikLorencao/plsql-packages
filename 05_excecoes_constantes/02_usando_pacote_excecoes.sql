-- adicionar no INCLUIR_CLIENTES do package CLIENTE_PAC

WHEN EXCEPTION_PAC.e_null then
    raise_application_error (-20012,'Preenchimento de campo obrigatório');

-- user_app --
EXECUTE APP_INCLUIR_CLIENTE (NULL, 'INCLUIDO POR USER_APP PARA TESTAR VALOR NULO', '23456', 1, 100000);