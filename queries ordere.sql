SELECT * FROM couriermanagementsystem.customer;
UPDATE CUSTOMER SET FirstName = 'Daniyal' WHERE customerID = 1011;
ALTER TABLE CUSTOMER DROP COLUMN Phone ;
SELECT * FROM CUSTOMER WHERE Phone = '1234567890';
SELECT * FROM CUSTOMER WHERE Email LIKE 'KHALID%';
SELECT * FROM CUSTOMER WHERE LASTNAME LIKE 'JEHAN%';
SELECT FirstName, LastName, Delivery_Address FROM CUSTOMER ORDER BY LastName;
SELECT * FROM CUSTOMER WHERE FirstName like 'A%';
SELECT * FROM CUSTOMER WHERE FirstName like '%N';