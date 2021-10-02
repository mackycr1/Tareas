CREATE PROCEDURE [dbo].[TipoIdentificacionEliminar]

	@IdTipoIdentificacion INT

AS BEGIN
	SET NOCOUNT ON
	BEGIN TRANSACTION TRANS

		BEGIN TRY
			
			DELETE FROM [dbo].[TipoIdentificacion] 
			WHERE IdTipoIdentificacion = @IdTipoIdentificacion
	
			COMMIT TRANSACTION TRANS
			SELECT 0 AS CodeError, '' AS MsgError
		END TRY

		BEGIN CATCH

			SELECT  ERROR_NUMBER() AS CodeError,
					ERROR_MESSAGE() AS MsgError
   
			ROLLBACK TRANSACTION TRANS
		END CATCH
 END
 GO