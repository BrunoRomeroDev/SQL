-- Declara��o
DECLARE FuncionarioCursor CURSOR FOR   
    SELECT 
        [Id],
        [Desempenho]
    FROM 
        dbo.Funcionario
    ORDER BY 
        [Nome] 
  
-- Inicializa��o
OPEN FuncionarioCursor 

-- Vari�veis
DECLARE @Id INT 
DECLARE @Desempenho INT 
  
-- Leitura da primeira linha do cursor
FETCH NEXT FROM FuncionarioCursor   
INTO @Id, @Desempenho 

-- In�cio do la�o
WHILE @@FETCH_STATUS = 0  
BEGIN  

    -- Opera��es
    IF @Desempenho >= 90
        EXEC dbo.Promover @Id
    ELSE IF @Desempenho >= 70
        EXEC dbo.Bonificar @Id

    -- Leitura da pr�xima linha do cursor
    FETCH NEXT FROM FuncionarioCursor   
    INTO @Id, @Desempenho 

END   

-- Encerramento
CLOSE FuncionarioCursor 
DEALLOCATE FuncionarioCursor 