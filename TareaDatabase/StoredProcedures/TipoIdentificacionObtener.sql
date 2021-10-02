CREATE PROCEDURE [dbo].[TipoIdentificacionObtener]

      @IdTipoIdentificacion INT = NULL

AS BEGIN
  SET NOCOUNT ON

  SELECT TI.IdTipoIdentificacion,
         TI.Descripcion
    FROM [dbo].[TipoIdentificacion] AS TI
    WHERE
    (@IdTipoIdentificacion IS NULL OR IdTipoIdentificacion = @IdTipoIdentificacion)
END