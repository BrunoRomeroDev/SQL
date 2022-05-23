




/*

		WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  
AS  
-- Define the CTE query.  
(  
    SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
)  
-- Define the outer query referencing the CTE name.  
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear  
FROM Sales_CTE  
GROUP BY SalesYear, SalesPersonID  
ORDER BY SalesPersonID, SalesYear; 

*/

----CTE SIMPLES CONSULTA(EQUIVALENTE A SUBQUERY)
WITH SC6010_CTE
AS
(SELECT C6_NUM,C6_PRODUTO FROM SC6010 WHERE D_E_L_E_T_ = '' )


SELECT C6_NUM, C6_PRODUTO,B1_DESC FROM SB1010 INNER JOIN SC6010_CTE ON SB1010.B1_COD = SC6010_CTE.C6_PRODUTO 

---CTE RECURSIVA
WITH CTE_Numerico (Nivel, Numero) 
AS
(
-- Âncora (nível 1)
SELECT 1 AS Nivel, 1 AS Numero
UNION ALL
-- Níveis recursivos (Níveis N)
SELECT Nivel + 1, Numero + Numero 
FROM CTE_Numerico
WHERE Numero < 2048
)
SELECT *
FROM CTE_Numerico
