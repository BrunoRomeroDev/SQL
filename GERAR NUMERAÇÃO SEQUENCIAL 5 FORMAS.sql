------------------------------------------------------------------
-- Performance na geração de números sequencias
------------------------------------------------------------------
-- Observação: Ativar o Execution Plan: Control + M
 
--------------------------------------------------
-- Loop tradicional
--------------------------------------------------
set nocount on
--/*
declare @sequencia int = 1
declare @retorno table (numero int)
declare @cronometro datetime = getdate()
while @sequencia <= 100000
    begin
        insert into @retorno values (@sequencia)
        set @sequencia = @sequencia + 1
    end
select * from @retorno
print 'WHILE: ' + convert(varchar, getdate() - @cronometro, 114)
go
--*/
 
--------------------------------------------------
-- CTE recursiva
--------------------------------------------------
declare @cronometro datetime = getdate()
;with cte as (
    select 1 as sequencia
    union all
    select sequencia + 1 as sequencia from cte where sequencia < 100000
)
select * from cte option (maxrecursion 0)
print 'CTE Recursiva: ' + convert(varchar, getdate() - @cronometro, 114)
go
 
--------------------------------------------------
-- CTEs Agrupadas
--------------------------------------------------
declare @cronometro datetime = getdate()
;with
    cte_ancora (sequencia) as ( -- gera 10 números 1
            select 1 union all select 1 union all select 1 union all select 1 union all select 1 
            union all
            select 1 union all select 1 union all select 1 union all select 1 union all select 1
    ),
    cte_sequencia (sequencia) as ( -- usa o cross join para combinar todos os registros de um resultset com todos os registros de outro resultset
        select 1 from cte_ancora
        cross join cte_ancora as [10*10=100]
        cross join cte_ancora as [100*10=1K]
        cross join cte_ancora as [1000*10=10K]
        cross join cte_ancora as [10000*10=100K])
select
    row_number() over (order by (select null)) linha
from cte_sequencia
print 'CTEs Agrupadas: ' + convert(varchar, getdate() - @cronometro, 114)
go
 
 
 
--------------------------------------------------
-- Row constructor
--------------------------------------------------
declare @cronometro datetime = getdate()
select
    1 + ate9.n + 10*ate99.n + 100*ate999.n + 1000*ate9999.n + 10000*ate99999.n as sequencia
from (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ate9(n), -- até 9
     (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ate99(n), -- até 99
     (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ate999(n), -- até 999
     (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ate9999(n), -- até 9999
     (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ate99999(n) -- até 99999
order by 1
print 'Row Constructor: ' + convert(varchar, getdate() - @cronometro, 114)
go
 
--------------------------------------------------
-- Select em tabelas de sistema
--------------------------------------------------
declare @cronometro datetime = getdate()
select top (100000) 
    row_number() over (order by (select null)) sequencia
FROM sys.all_objects a
cross join sys.all_objects b
print 'Select sys.all_objects: ' + convert(varchar, getdate() - @cronometro, 114)
go


/*

técnica	tempo
Select sys.all_objects	00:00:00:567
CTEs Agrupadas			00:00:00:570
Row Constructor			00:00:00:670
CTE Recursiva			00:00:00:843
WHILE					00:00:02:880

técnica	Custo relativo
CTE Recursiva			0%
Select sys.all_objects	8%
CTEs Agrupadas			10%
Row Constructor			82%
WHILE					N/A
 