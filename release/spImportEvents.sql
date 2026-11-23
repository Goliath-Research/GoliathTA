ALTER      procedure spImportEvents
as
begin
  set nocount on;
  set xact_abort on;

  declare @LastImported int; -- Último nIndex importado (ImportEventsState.LastIndex)
  declare @LastIndex    int; -- MAX(tb_reportslist.nIndex)

  -- El último nIndex importado se guarda en ImportEventsState, una tabla que
  -- sólo actualiza este procedimiento y que el servicio de datos no publica.
  -- Acceso.ID no sirve para esto: los clientes del servicio pueden escribirlo.

  if object_id(N'dbo.ImportEventsState') is null
    select -1 as LastIndex into dbo.ImportEventsState;

  begin transaction;

  select @LastImported = LastIndex from dbo.ImportEventsState with (updlock, holdlock);

  -- Calcular el último nIndex a importar

  set @LastIndex = (select max(nIndex) from [Tiempo y Asistencia].dbo.tb_reportslist where nEvent = 55);

  -- Un registro de Acceso que ocupe el nIndex de un evento a importar y no
  -- coincida con él no proviene de esta importación: se reemplaza por el evento.

  delete a
    FROM
      Acceso a with (holdlock)
        inner join [Tiempo y Asistencia].dbo.tb_reportslist br
        on a.ID = br.nIndex
        inner join [Tiempo y Asistencia].dbo.tb_userinfo Usr
        on br.nUserID = Usr.nUserID
    WHERE (br.nEvent = 55) AND (br.nIndex > @LastImported) AND (br.nIndex <= @LastIndex)
      AND ((a.Fecha <> br.dtDateTime) OR (a.UserID <> br.nUserID) OR (a.DeviceID <> br.nDeviceID));

  -- Importar todos los eventos (desde el último importado hasta el recientemente calculado)

  insert into Acceso(ID, Fecha, UserID, UserName, DeviceID)
    SELECT
      br.nIndex,
      br.dtDateTime,
      br.nUserID,
      Usr.strUserName,
      br.nDeviceID
    FROM
      [Tiempo y Asistencia].dbo.tb_reportslist br 
        inner join [Tiempo y Asistencia].dbo.tb_userinfo Usr
        on br.nUserID = Usr.nUserID
    WHERE (br.nEvent = 55) AND (br.nIndex > @LastImported) AND (br.nIndex <= @LastIndex)
      AND NOT EXISTS (select * from Acceso a where a.ID = br.nIndex);

  update dbo.ImportEventsState
    set LastIndex = @LastIndex
    where @LastIndex > LastIndex;

  commit transaction;

end;
