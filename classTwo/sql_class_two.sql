SELECT      I.SKU,      I.SKU_Description,      W.WarehouseID,      W.WarehouseCity,      W.WarehouseState FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID WHERE      W.WarehouseCity = 'Atlanta'      OR W.WarehouseCity = 'Bangor'      OR W.WarehouseCity = 'Chicago';


SELECT      I.SKU,      I.SKU_Description,      W.WarehouseID,      W.WarehouseCity,      W.WarehouseState FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID WHERE      W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');


SELECT      I.SKU,      I.SKU_Description,      W.WarehouseID,      W.WarehouseCity,      W.WarehouseState FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID WHERE      W.WarehouseCity <> 'Atlanta'     AND W.WarehouseCity <> 'Bangor'     AND W.WarehouseCity <> 'Chicago';


SELECT      I.SKU,      I.SKU_Description,      W.WarehouseID,      W.WarehouseCity,      W.WarehouseState FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID WHERE      W.WarehouseCity not 
IN ('Atlanta', 'Bangor', 'Chicago');

SELECT      CONCAT(SKU_Description, ' is located in ', WarehouseCity) AS ItemLocation FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID;

SELECT      SKU,      SKU_Description,      WarehouseID FROM      INVENTORY WHERE      WarehouseID IN (         SELECT WarehouseID         FROM WAREHOUSE         WHERE Manager = 'Lucille Smith'     );

SELECT      I.SKU,      I.SKU_Description,      I.WarehouseID FROM      INVENTORY I, WAREHOUSE W WHERE      I.WarehouseID = W.WarehouseID     AND W.Manager = 'Lucille Smith';

SELECT      I.SKU,      I.SKU_Description,      I.WarehouseID FROM      INVENTORY I JOIN      WAREHOUSE W ON I.WarehouseID = W.WarehouseID WHERE      W.Manager = 'Lucille Smith';

