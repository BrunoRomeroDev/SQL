--CRIA��O DE UMA SEQUENCE PAR AUXILIAR NA ATUALIZA��O DA TABELA

/* CREATE SEQUENCE CountBy1  
    START WITH 1  
    INCREMENT BY 1 
	CYCLE ;  
GO 
DROP SEQUENCE CountBy1 ;  
GO

ALTER SEQUENCE CountBy1  
    RESTART WITH 1  
    INCREMENT BY 1  
;  
GO  

CREATE SEQUENCE DecSeq  
    AS INT   
    START WITH 1  
    INCREMENT BY 1  
    MINVALUE 001  
    MAXVALUE 999  
    CYCLE  
    
*/ 

-- UPDATE DENTRO DE UM TRANSACAO UTILIZANDO UMA SEQUENCE PR� CRIADA.
BEGIN TRANSACTION UPDA1
UPDATE DA1010 SET DA1_ITEM = CAST(NEXT VALUE FOR CountBy1 AS VARCHAR) WHERE R_E_C_N_O_ <= 100
ROLLBACK
SELECT * FROM DA1010