Create Database CourierManagementSystem;
Use CourierManagementSystem;

Create table CUSTOMER (
CustomerID INT Primary Key, 
FirstName VARCHAR(10) NOT NULL, 
LastName VARCHAR(10) NOT NULL, 
Delivery_Address VARCHAR(30) NOT NULL, 
Email VARCHAR(25) NOT NULL, 
Phone VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE CUSTOMER_FEEDBACK (
    CustomerID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comment VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

CREATE TABLE CUSTOMER_COMPLAINTS (
	CustomerID INT,
    OrderID INT,
    CourierID INT,
    Description VARCHAR(255) NOT NULL,
    Resolution VARCHAR(255),
    ResolutionDate DATE,
    Status VARCHAR(20) DEFAULT 'Open' CHECK (Status IN ('Open', 'In Progress', 'Resolved')),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (CourierID) REFERENCES COURIER(CourierID)
);

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Delivery_Address, Email, Phone) VALUES
(1011, 'ASIM', 'KHAN', '707 Pineapple Dr, #15', 'ASIM@GMAIL.COM', '09876543212'),
(1012, 'SANIA', 'SARIM', 'BLOCK 2 HOUSE-7', 'SANIA@GMAIL.COM', '09835743212'),
(1013, 'LEEJA', 'KHALID', '505 Walnut Ave, Apt 6', 'KHALID@GMAIL.COM', '03696543212'),
(1014, 'SAAD', 'AZEEM', '404 Birch St, #10', 'SAAD@GMAIL.COM', '0987654468'),
(1015, 'SHAHEER', 'SALMAN', '123 Main St, Apt 4', 'SHAHEER@GMAIL.COM', '1234567890'),
(1016, 'NIGHAT', 'JEHAN', '456 Elm St, Unit 12', 'NIGHAT@GMAIL.COM', '2345678901'),
(1017, 'SAMRA', 'ZESHAAN', '789 Oak Ave, Suite B', 'SAMRA@GMAIL.COM', '3456789012'),
(1018, 'FARHAN', 'KHAN', '101 Pine Ln, #22', 'FARHAN@GMAIL.COM', '4567890123'),
(1019, 'AMMAD', 'ALI', '202 Cedar Blvd, Apt 8', 'AMMAD@GMAIL.COM', '5678901234'),
(1020, 'HAMZA', 'RIZWAN', '303 Maple Ct, Unit 3A', 'HAMZA@GMAIL.COM', '6789012345');


INSERT INTO CUSTOMER_FEEDBACK (CustomerID, Rating, Comment) VALUES
(1011, 4, 'Great service!'),
(1012, 5, 'Excellent experience!'),
(1013, 3, 'Satisfactory, but could be better.'),
(1014, 2, 'Not happy with the delivery time.'),
(1015, 5, 'Outstanding service, highly recommended.'),
(1016, 4, 'Good communication during the delivery.'),
(1017, 1, 'Very poor service, package damaged.'),
(1018, 3, 'Average experience, can improve.'),
(1019, 5, 'Fast and reliable delivery.'),
(1020, 4, 'Impressed with the professionalism of the courier.');

INSERT INTO CUSTOMER_COMPLAINTS (CustomerID, CourierID, OrderID, Description, Resolution, ResolutionDate, Status) VALUES
(1011, 8, 10111011, 'Late delivery', 'Investigating', '2023-03-01', 'Open'),
(1019, 6, 10191019, 'Missing items', 'Refund processed', '2023-02-21', 'Resolved'),
(1012, 2, 10121012, 'Damaged package', 'Replacement sent', '2023-02-28', 'Resolved'),
(1014, 8, 10141014, 'Incorrect order', 'Investigating', '2023-02-26', 'In Progress');
