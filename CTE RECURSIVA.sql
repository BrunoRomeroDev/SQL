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
 
