
DECLARE @DOC AS VARCHAR (9)
DECLARE @PROD AS VARCHAR (20), @NUMSERIE AS VARCHAR (20)
SET @DOC = '000003843';
SET @PROD = 'AR-2000HV';
SET @NUMSERIE = 'AO8018';
WITH   CTE_SALD AS (
SELECT 
	B6_CLIFOR	AS ENTIDADE,
	B6_PRODUTO	AS PRODUTOB6 ,
	D1_COD		AS PRODUTOD1,
	B6_LOCAL	AS ARMAZEM,
	B6_DOC		AS NFB6,
	D1_DOC		AS NFD1,
	B6_SERIE	AS SERIENOTA,
	B6_TIPO		AS TIPO,
	B6_IDENT	AS IDENTB6,
	D1_IDENTB6	AS IDENTD1,
	B6_PODER3	AS MOVIMENTO
	FROM SB6010 INNER JOIN SD1010 ON  B6_IDENT = D1_IDENTB6  
	WHERE  SB6010.D_E_L_E_T_ = '')

		SELECT	CTE_SALD.*,
				SDB010.DB_DOC AS NFSDB,
				SDB010.DB_PRODUTO AS PRODUTO,
				SDB010.DB_LOCAL AS ARMAZEM,
				SDB010.DB_NUMSERI FROM CTE_SALD INNER JOIN SDB010 ON CTE_SALD.NFB6 = SDB010.DB_DOC AND CTE_SALD.PRODUTOB6 = SDB010.DB_PRODUTO
					WHERE	SDB010.D_E_L_E_T_ = '' AND 
							--SDB010.DB_DOC = @DOC AND
							SDB010.DB_PRODUTO = @PROD AND
							SDB010.DB_NUMSERI = @NUMSERIE
							ORDER BY CTE_SALD.PRODUTOB6,DB_NUMSERI 


SELECT	DB_PRODUTO, 
		B6_PRODUTO,
		B6_QUANT,
		DB_NUMSERI, 
		DB_LOCAL, 
		B6_LOCAL, 
		DB_DOC, 
		B6_DOC,
		DB_CLIFOR,
		B6_CLIFOR,
		B6_TIPO,
		B6_PODER3,
		B6_SALDO,
		DB_NUMSEQ
			FROM SDB010 INNER JOIN SB6010 ON DB_NUMSEQ = B6_IDENT AND DB_DOC = B6_DOC
				WHERE B6_CLIFOR = '001030' and B6_PRODUTO = 'AR-2000HV'

				SELECT * FROM SB6010 WHERE B6_CLIFOR = '001030' and B6_PRODUTO = 'AR-2000HV'
				SELECT * FROM SDB010 WHERE DB_NUMSEQ = '041770'
