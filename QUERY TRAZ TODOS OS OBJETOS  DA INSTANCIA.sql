SELECT name AS object_name   
  ,SCHEMA_NAME(schema_id) AS schema_name  
  ,type_desc  
  ,create_date  
  ,modify_date  
FROM sys.objects 
WHERE modify_date > GETDATE() - 30  
ORDER BY modify_date; 


--QUERY TRAZ TODOS OS OBJETOS (CONTRAINTS, VIEWS, SEQUENCE,BANCO, STORE PROCEDURE, ETC.)
--CRIADOS A PARTIR DE UMA DATATODOS