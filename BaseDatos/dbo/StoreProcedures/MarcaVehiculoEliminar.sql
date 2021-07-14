﻿CREATE PROCEDURE [dbo].[MarcaVehiculoEliminar]
@MarcaVehiculoId INT
AS
 BEGIN
   SET NOCOUNT ON
   BEGIN TRANSACTION TRASA

   BEGIN TRY 

	   DELETE FROM MarcaVehiculo
	   WHERE MarcaVehiculoId = @MarcaVehiculoId
   
   COMMIT TRANSACTION TRASA

     SELECT 0 AS CodeError, '' AS MsgError

   END TRY

   BEGIN CATCH
     SELECT 
	     ERROR_NUMBER() AS CodeError
	   , ERROR_MESSAGE() AS MsgError

	   ROLLBACK TRANSACTION TRASA
   END CATCH

 END