CREATE TABLE DISCOUNT (
	OrderID INT PRIMARY KEY,
    DiscountCode VARCHAR(20) UNIQUE,
    DiscountAmount DECIMAL(5, 2),
    IsActive BOOLEAN DEFAULT true, 
    ExpiryDate DATE
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

INSERT INTO PAYMENT (CustomerID, OrderID, Amount, PaymentDate, PaymentMethod) VALUES
(1011, 10111011, 350.00, '2023-01-15', 'Credit Card'),
(1012, 10121012, 475.50, '2023-02-20', 'Easy Paisa'),
(1013, 10131013, 1100.00, '2023-03-25', 'Cash'),
(1014, 10141014, 465.25, '2023-04-10', 'Cash'),
(1015, 10151015, 120.75, '2023-05-025', 'Credit Card'),
(1016, 10161016, 680.50, '2023-06-19', 'Cash'),
(1017, 10171017, 650.25, '2023-07-18', 'Easy Paisa'),
(1018, 10181018, 900.00, '2023-08-22', 'Debit Card'),
(1019, 10191019, 550.75, '2023-09-20', 'Cash'),
(1020, 10201020, 170.25, '2023-10-25', 'Jazz Cash');

INSERT INTO DISCOUNT (OrderID, DiscountCode, DiscountAmount, IsActive, ExpiryDate) VALUES
(10111011, 'DISC50', 10.00, true, '2023-01-31'),
(10121012, 'SAVE20', 5.50, true, '2023-02-28'),
(10151015, 'FEBDEAL', 15.00, true, '2023-06-25'),
(10171017, 'SPRINGSALE', 8.25, true, '2023-07-30'),
(10191019, 'SUMMER25', 12.50, true, '2023-09-21'),
(10201020, 'FLASHSALE', 7.75, true, '2023-11-10');
