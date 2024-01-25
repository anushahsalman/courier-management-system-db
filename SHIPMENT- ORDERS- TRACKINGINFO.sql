CREATE TABLE SHIPMENT (
    ShipmentID varchar(20) PRIMARY KEY,
    SenderID INT,
    Weight VARCHAR(10)  NOT NULL,
    Status VARCHAR(15) DEFAULT 'Pending',
    PickupDate DATE,
    DeliveryDate DATE,
    FOREIGN KEY (SenderID) REFERENCES CUSTOMER(CustomerID) 
);

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ShipmentID varchar(20),
    CourierID INT,
    Status VARCHAR(30) DEFAULT 'Processing',
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (ShipmentID) REFERENCES SHIPMENT(ShipmentID),
    FOREIGN KEY (CourierID) REFERENCES COURIER(CourierID)
);

CREATE TABLE TRACKINGINFO (
    TrackingID INT PRIMARY KEY,
    ShipmentID varchar(10),
    Status VARCHAR(60),
    FOREIGN KEY (ShipmentID) REFERENCES SHIPMENT(ShipmentID)
);


INSERT INTO SHIPMENT (ShipmentID, SenderID, Weight, Status, PickupDate, DeliveryDate) VALUES
('SHIP2023001', 1011, '5kg', 'Pending', '2023-01-10', '2023-01-20'),
('SHIP2023002', 1012, '8kg', 'Shipped', '2023-02-15', '2023-02-25'), 
('SHIP2023003', 1013, '12kg', 'Delivered', '2023-03-20', '2023-03-30'),
('SHIP2023004', 1014, '6kg', 'Pending', '2023-04-25', '2023-05-05'),
('SHIP2023005', 1015, '10kg', 'Shipped', '2023-05-30', '2023-06-09'),
('SHIP2023006', 1016, '7kg', 'Delivered', '2023-06-15', '2023-06-25'),
('SHIP2023007', 1017, '9kg', 'Pending', '2023-07-20', '2023-07-30'),
('SHIP2023008', 1018, '11kg', 'Shipped', '2023-08-25', '2023-09-04'),
('SHIP2023009', 1019, '15kg', 'Delivered', '2023-09-10', '2023-09-20'),
('SHIP2023010', 1020, '8kg', 'Pending', '2023-10-25', '2023-10-25');

INSERT INTO ORDERS (OrderID, CustomerID, ShipmentID, CourierID, Status, OrderDate) VALUES
(10111011, 1011, 'SHIP2023001', 1, 'Processing', '2023-01-05'),
(10121012, 1012, 'SHIP2023002', 2, 'Processing', '2023-02-10'),
(10131013, 1013, 'SHIP2023003', 3, 'Shipped', '2023-03-15'),
(10141014, 1014, 'SHIP2023004', 4, 'Shipped', '2023-04-20'),
(10151015, 1015, 'SHIP2023005', 5, 'Processing', '2023-05-25'),
(10161016, 1016, 'SHIP2023006', 6, 'Out for Delivery', '2023-06-13'),
(10171017, 1017, 'SHIP2023007', 7, 'Out for Delivery', '2023-07-05'),
(10181018, 1018, 'SHIP2023008', 8, 'Delivered', '2023-08-10'),
(10191019, 1019, 'SHIP2023009', 9, 'Processing', '2023-09-15'),
(10201020, 1020, 'SHIP2023010', 10, 'Processing', '2023-10-20');

INSERT INTO TRACKINGINFO (TrackingID, ShipmentID, Status)
VALUES
(3001, 'SHIP2023001', 'Shipment Processing'),
(3002, 'SHIP2023002', 'Order Confirmation Received'),
(3003, 'SHIP2023003', 'Shipped from Warehouse'),
(3004, 'SHIP2023004', 'In Transit to Destination'),
(3005, 'SHIP2023005', 'Shipment Processing'),
(3006, 'SHIP2023006', 'Out for Delivery'),
(3007, 'SHIP2023007', 'Out for Delivery'),
(3008, 'SHIP2023008', 'Delivered Successfully'),
(3009, 'SHIP2023009', 'Order Confirmation Received'),
(3010, 'SHIP2023010', 'Payment Verification');
