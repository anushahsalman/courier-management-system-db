SELECT * FROM couriermanagementsystem.employee_payroll;

-- Increase Bonus by 500 for Employee ID 9
UPDATE EMPLOYEE_PAYROLL SET Bonus = Bonus + 500 WHERE COURIERID = 9;

-- Increase Salary by 10% for Employee ID 2
UPDATE EMPLOYEE_PAYROLL SET Salary = Salary * 1.1 WHERE COURIERID = 2;

-- Subquery to Get Maximum Salary
SELECT MAX(Salary) FROM EMPLOYEE_PAYROLL;

-- Subquery to Get Total Number of Employees
SELECT COUNT(*) FROM EMPLOYEE_PAYROLL;

-- Subquery to Get Employees with Bonus Greater Than 1000
SELECT * FROM EMPLOYEE_PAYROLL WHERE Bonus > 1000;

-- Subquery to Get Employees with No Bonus
SELECT * FROM EMPLOYEE_PAYROLL WHERE Bonus IS NULL;

-- Subquery to Get Top 3 Salaries
SELECT Salary FROM EMPLOYEE_PAYROLL ORDER BY Salary DESC LIMIT 3;

-- Subquery to Get Employees with Salary Above Average
SELECT * FROM EMPLOYEE_PAYROLL WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEE_PAYROLL);

-- Subquery to Get Employees with Salary Between 45000 and 50000
SELECT * FROM EMPLOYEE_PAYROLL WHERE Salary BETWEEN 45000 AND 50000;


