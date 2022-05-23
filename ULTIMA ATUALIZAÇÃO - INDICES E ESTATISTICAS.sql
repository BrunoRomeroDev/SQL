select name, Stats_date(id, indid) DataAtualizacao
from sysindexes
where id = Object_id('MINHA_TABELA')