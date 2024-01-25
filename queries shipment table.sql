SELECT * FROM couriermanagementsystem.shipment;
SELECT * FROM  shipment ORDER BY DELIVERYDATE ASC;

-- Subquery to Get the Total Weight of Shipments
SELECT SUM(CAST(Weight AS DECIMAL(10,2))) AS TotalWeight FROM SHIPMENT;

-- Subquery to Get ShipmentIDs with 'Pending' Status
SELECT ShipmentID FROM SHIPMENT WHERE Status = 'Pending';

-- Subquery to Find Shipments with Delivery Date IS NULL
SELECT * FROM SHIPMENT WHERE DeliveryDate IS NULL;

-- Subquery to Get Sender Information for a Specific Shipment
SELECT * FROM CUSTOMER WHERE CustomerID = (SELECT SenderID FROM SHIPMENT WHERE ShipmentID = 'SHIP2023001');

-- SELECT Status, COUNT(*) AS NumShipments FROM SHIPMENT GROUP BY Status
SELECT  COUNT(*) AS NumShipments FROM SHIPMENT GROUP BY Status;

-- Subquery to Get Shipments with Pickup Date After a 2023-06-01 Date:
SELECT * FROM SHIPMENT WHERE PickupDate > '2023-06-01';

-- Subquery to Get Shipments with WEIGHT MORE THAN 10KGS
SELECT * FROM SHIPMENT WHERE CAST(Weight AS DECIMAL(10,2)) > 10.0;

-- Alter the Weight Column to Allow More Characters
ALTER TABLE SHIPMENT MODIFY COLUMN Weight VARCHAR(15);

-- Add a New Column 'ShippingMethod' with Default Value
ALTER TABLE SHIPMENT ADD COLUMN ShippingMethod VARCHAR(20) DEFAULT 'Standard';

-- Drop the 'ShippingMethod' Column
ALTER TABLE SHIPMENT DROP COLUMN ShippingMethod;
