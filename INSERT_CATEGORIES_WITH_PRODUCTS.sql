CREATE PROCEDURE INSERT_CATEGORIES_WITH_PRODUCTS(@Quantity INT)
AS
	BEGIN TRY
		BEGIN TRANSACTION INSERT_CATEGORIES_WITH_PRODUCTS;
				PRINT 'ON COMMIT TRANSACTION';
				DECLARE @I_Categories AS INT = 1;
				WHILE @I_Categories<=@Quantity
					BEGIN
						PRINT 'ON CATEGORY WHILE LOOP';
						INSERT INTO categoria_producto(nombre_categoria)
						VALUES (CONCAT('Categoria #', @I_Categories));
						DECLARE @I_Products AS INT = 1;
						WHILE @I_Products<=@Quantity
							BEGIN
								PRINT 'ON PRODUCT WHILE LOOP';
								INSERT INTO producto(nombre_producto, id_categoria_producto)
								VALUES (CONCAT('Producto #', @I_Products),@I_Categories);
								SET @I_Products+=1;
							END;
						SET @I_Categories+=1;
					END;
		COMMIT TRANSACTION INSERT_CATEGORIES_WITH_PRODUCTS;
	END TRY  
	
	BEGIN CATCH  
		PRINT 'ON ROLLBACK TRANSACTION'+ CHAR(13) + ERROR_MESSAGE();		
		ROLLBACK TRANSACTION INSERT_CATEGORIES_WITH_PRODUCTS;
	END CATCH 
GO