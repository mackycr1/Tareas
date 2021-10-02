CREATE PROCEDURE [dbo].[TipoIdentificacionActualizar]
	
	@IdTipoIdentificacion INT,
	@Descripcion VARCHAR(50)

AS BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION TRANS

		BEGIN TRY
			UPDATE [dbo].[TipoIdentificacion]
			SET Descripcion = @Descripcion
			WHERE IdTipoIdentificacion = @IdTipoIdentificacion
	
			COMMIT TRANSACTION TRANS
			SELECT 0 AS CodeError, '' AS MsgError
		END TRY

		BEGIN CATCH
			SELECT ERROR_NUMBER() AS CodeError,
				   ERROR_MESSAGE() AS MsgError
   
			ROLLBACK TRANSACTION TRANS
		END CATCH
 END
 GO