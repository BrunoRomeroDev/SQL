



CREATE SEQUENCE CountBy1  
    START WITH 1  
    INCREMENT BY 1 ;  
GO 
DROP SEQUENCE CountBy1 ;  
GO 

SELECT  NEXT VALUE FOR CountBy1,* FROM DA1010 WHERE D_E_L_E_T_ = ''

