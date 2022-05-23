-- Declaração
DECLARE FuncionarioCursor CURSOR FOR   
    SELECT 
        [Id],
        [Desempenho]
    FROM 
        dbo.Funcionario
    ORDER BY 
        [Nome] 
  
-- Inicialização
OPEN FuncionarioCursor 

-- Variáveis
DECLARE @Id INT 
DECLARE @Desempenho INT 
  
-- Leitura da primeira linha do cursor
FETCH NEXT FROM FuncionarioCursor   
INTO @Id, @Desempenho 

-- Início do laço
WHILE @@FETCH_STATUS = 0  
BEGIN  

    -- Operações
    IF @Desempenho >= 90
        EXEC dbo.Promover @Id
    ELSE IF @Desempenho >= 70
        EXEC dbo.Bonificar @Id

    -- Leitura da próxima linha do cursor
    FETCH NEXT FROM FuncionarioCursor   
    INTO @Id, @Desempenho 

END   

-- Encerramento
CLOSE FuncionarioCursor 
DEALLOCATE FuncionarioCursor 