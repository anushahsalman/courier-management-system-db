SELECT * FROM couriermanagementsystem.orders;

-- Query to Update Order Status to 'Cancelled'
UPDATE ORDERS SET Status = 'Cancelled' WHERE OrderID = 10151015;

-- Query to Change Courier for a Specific Order
UPDATE ORDERS SET CourierID = 5 WHERE OrderID = 10161016;

-- Query to Display Orders Grouped by Status
SELECT Status, COUNT(*) FROM ORDERS GROUP BY Status;

-- Subquery to Get the Latest Order
SELECT * FROM ORDERS WHERE OrderDate = (SELECT MAX(OrderDate) FROM ORDERS);

-- Subquery to Get Orders Shipped by Courier NNAME GHAZANFAR
SELECT * FROM ORDERS WHERE CourierID = (SELECT CourierID FROM COURIER WHERE FIRSTName = 'GHAZANFAR');

-- Subquery to Get Orders with Processing Status
SELECT * FROM ORDERS WHERE Status = 'Delivered';

-- Subquery to Get Orders with a Specific ShipmentID
SELECT * FROM ORDERS WHERE ShipmentID = 'SHIP2023003';

-- Subquery to Get Orders Placed in a Specific Month
SELECT * FROM ORDERS WHERE MONTH(OrderDate) = 5;

-- Subquery to Get Orders with a Specific OrderID
SELECT * FROM ORDERS WHERE OrderID = 10141014;
