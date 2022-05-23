USE master	
GO
-- Iniciando a pesquisa nas tabelas de sistemas
SELECT A.NAME, A.TYPE, B.TEXT
  FROM SYSOBJECTS  A (nolock)
  JOIN SYSCOMMENTS B (nolock) 
    ON A.ID = B.ID
--WHERE B.TEXT LIKE '%livro%'  --- Informação a ser procurada no corpo da view
  --AND A.TYPE = 'V'                     --- Tipo de objeto a ser localizado no caso VIEW
 ORDER BY A.NAME
GO

