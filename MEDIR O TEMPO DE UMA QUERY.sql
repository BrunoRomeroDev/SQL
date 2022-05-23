-- Salvar data hora na variável @cronometro
declare @cronometro datetime = getdate()
 
-- Executar o código que você deseja medir
;with cte as (
    select 1 as sequencia
    union all
    select sequencia + 1 as sequencia from cte where sequencia < 100000
)
select * from cte option (maxrecursion 0)
 
-- Demonstrar o tempo transcorrido
print convert(varchar, getdate() - @cronometro, 114)
go
 
/*
Resultado:
(100000 row(s) affected)
00:00:00:830
*/