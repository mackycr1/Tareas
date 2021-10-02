DROP TABLE IF EXISTS #TipoIdnetificacionTemp

SELECT IdTipoIdentificacion, Descripcion
INTO #TipoIdnetificacionTemp
FROM
(
    VALUES 
    (1, 'Cedula'),
    (2, 'Pasaporte'),
    (3, 'Cedula Juridica')
) AS TEMP (IdTipoIdentificacion, Descripcion)

/******************************************************************************
UPDATE : Upades any existing data
******************************************************************************/
UPDATE TI 
SET TI.Descripcion = TITEMP.Descripcion
FROM [dbo].[TipoIdentificacion] AS TI
INNER JOIN #TipoIdnetificacionTemp AS TITEMP
ON TI.IdTipoIdentificacion = TITEMP.IdTipoIdentificacion


/******************************************************************************
INSERT : Inserts any record that does not exist
******************************************************************************/
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] ON

INSERT INTO [dbo].[TipoIdentificacion]
(
    IdTipoIdentificacion,
    Descripcion
)
SELECT IdTipoIdentificacion, 
       Descripcion
FROM #TipoIdnetificacionTemp


/******************************************************************************
SELECT : Select the data we inserted or updated on the Tipo Identificacion Table
******************************************************************************/
EXCEPT
SELECT IdTipoIdentificacion, 
       Descripcion
FROM [dbo].[TipoIdentificacion]

SET IDENTITY_INSERT [dbo].[TipoIdentificacion] OFF
GO