--Para saber si existe un indice
EXECUTE sp_helper 'Heros'
--Creacion de un Index
CREATE UNIQUE nonclustered Index [AK_person_exercise] On [dbo].[Heros]
{
  [rowId] asc
}
Go
