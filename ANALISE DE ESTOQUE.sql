
SELECT * FROM SBK010 WHERE BK_COD = 'UG-65EBL' -- SALDO INICIAL POR ENDERE�O 
	SELECT * FROM SDB010 WHERE DB_PRODUTO ='UG-65EBL' -- MOVIMENTA�AO DE ENDERE�O
		SELECT * FROM SBF010 WHERE BF_PRODUTO = 'UG-65EBL'-- SALDO POR ENDERE�O ATUAL 
		
SELECT * FROM SB9010 WHERE B9_COD = 'UG-65EBL'  --SALDO INICIAL  
	SELECT * FROM SD1010 WHERE D1_COD = 'UG-65EBL' -- Itens das NF de Entrada
	SELECT * FROM SD2010 WHERE D2_COD = 'UG-65EBL' -- Itens de Venda da NF
	SELECT * FROM SD3010 WHERE D3_COD = 'UG-65EBL' -- Movimenta��es Internas
	SELECT * FROM SD6010 WHERE D6_PRODUTO = 'UG-65EBL'-- Itens do Contrato
		SELECT * FROM SB2010 WHERE B2_COD = 'UG-65EBL' -- SALDO FISICO ATUAL 

SELECT * FROM SBJ010 --SALDO INICIAL DO LOTE 
	SELECT * FROM SD5010 --MOVIMENTA�AO POR LOTE
		SELECT * FROM SB8010 -- SALDO ATUAL POR LOTE 