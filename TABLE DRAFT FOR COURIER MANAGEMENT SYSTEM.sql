Create database MANAGEMENT_SYSTEM;
Use MANAGEMENT_SYSTEM;

Create table CUSTOMER (
CustomerID INT Primary Key, 
FirstName VARCHAR(10) NOT NULL, 
LastName VARCHAR(10) NOT NULL, 
Delivery_Address VARCHAR(30) NOT NULL, 
Email VARCHAR(25) NOT NULL, 
Phone VARCHAR(11) UNIQUE NOT NULL
);

Create table COURIER (
CourierID INT Primary Key, 
FirstName VARCHAR(10) NOT NULL, 
LastName VARCHAR(10)NOT NULL, 
VehicleType VARCHAR(15), 
Phone VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE SHIPMENT (
    ShipmentID INT PRIMARY KEY,
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
    ShipmentID INT,
    CourierID INT,
    Status VARCHAR(15) DEFAULT 'Processing',
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (ShipmentID) REFERENCES SHIPMENT(ShipmentID),
    FOREIGN KEY (CourierID) REFERENCES COURIER(CourierID)
);

CREATE TABLE TRACKINGINFO (
    TrackingID INT PRIMARY KEY,
    ShipmentID INT,
    Location VARCHAR(25),
    Status VARCHAR(15),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShipmentID) REFERENCES SHIPMENT(ShipmentID)
);

CREATE TABLE PAYMENT (
    CustomerID INT,
    OrderID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
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
    ComplaintDate DATE NOT NULL,
    ResolutionDate DATE,
    Status VARCHAR(20) DEFAULT 'Open' CHECK (Status IN ('Open', 'In Progress', 'Resolved')),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (CourierID) REFERENCES COURIER(CourierID)
);

CREATE TABLE DISCOUNT (
	OrderID INT PRIMARY KEY,
    DiscountCode VARCHAR(20) UNIQUE,
    DiscountAmount DECIMAL(5, 2),
    IsActive BOOLEAN DEFAULT true, 
    ExpiryDate DATE
);

CREATE TABLE EMPLOYEE_PAYROLL (
    COURIERID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    Bonus DECIMAL(8, 2),
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (COURIERID) REFERENCES COURIER(COURIERID)
);

