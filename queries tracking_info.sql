SELECT * FROM couriermanagementsystem.trackinginfo;

-- Query to Display Shipment Status Grouped by Status
SELECT Status, COUNT(*) FROM TRACKINGINFO GROUP BY Status;

-- Query to Find ShipmentIDs with 'Shipped' Status
SELECT ShipmentID FROM TRACKINGINFO WHERE Status = 'Shipped';

-- Query to Get ShipmentIDs for 'Order Confirmation Received'
SELECT ShipmentID FROM TRACKINGINFO WHERE Status = 'Order Confirmation Received';

-- Query to Display ShipmentIDs and Corresponding Status
SELECT ShipmentID, Status FROM TRACKINGINFO;

-- Subquery to Get the Oldest Shipment
SELECT * FROM TRACKINGINFO ORDER BY TrackingID ASC LIMIT 1;

-- Subquery to Get Shipment with 'Shipment Processing' Status
SELECT * FROM TRACKINGINFO WHERE Status = 'Shipment Processing';

-- Subquery to Get ShipmentIDs for 'Order Confirmation Received'
SELECT ShipmentID FROM TRACKINGINFO WHERE Status = 'Order Confirmation Received';
