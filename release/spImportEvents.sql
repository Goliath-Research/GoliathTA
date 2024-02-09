ALTER      procedure spImportEvents
as
begin
  declare @FirstIndex int; -- MAX(Acceso.ID) + 1
  declare @LastIndex  int; -- MAX(tb_reportslist.nIndex)

  -- Calcular el primer nIndex que se podría importar

  set @FirstIndex = (select max(ID) from Acceso) + 1;
  if @FirstIndex is null
    set @FirstIndex = 0;
  
  -- Calcular el último nIndex a importar

  set @LastIndex = (select max(nIndex) from [Tiempo y Asistencia].dbo.tb_reportslist where nEvent = 55);

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
    WHERE (br.nEvent = 55) AND (br.nIndex BETWEEN @FirstIndex AND @LastIndex);

end;
