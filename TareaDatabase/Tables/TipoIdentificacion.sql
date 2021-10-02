CREATE TABLE [dbo].[TipoIdentificacion]
(
	[IdTipoIdentificacion] INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoIdentificacion PRIMARY KEY CLUSTERED(IdTipoIdentificacion), 
    [Descripcion] VARCHAR(20) NOT NULL
)WITH (DATA_COMPRESSION = PAGE)
GO
