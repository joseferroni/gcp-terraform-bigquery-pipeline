MERGE `gcp_proyect_xxxxxx.produccion_datasets.ventas_nativa` AS nat
USING `gcp_proyect_xxxxxx.sandbox_datasets.ventas_externa` AS ext
ON nat.OrderID = ext.OrderID
WHEN NOT MATCHED THEN
  INSERT (OrderID, Product, Category, Brand, Platform, City, Price, Quantity, TotalAmount, Rating, Reviews, OrderDate)
  VALUES (OrderID, Product, Category, Brand, Platform, City, Price, Quantity, TotalAmount, Rating, Reviews, OrderDate)
