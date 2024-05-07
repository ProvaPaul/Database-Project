-- Description of each table
DESC Employees;
DESC Customers;
DESC MenuItems;
DESC Orders;
DESC OrderDetails;
DESC Suppliers;
DESC Inventory;
DESC Payments;

-- Data according to each table
SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM MenuItems;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Suppliers;
SELECT * FROM Inventory;
SELECT * FROM Payments;
-- Add operation (adding column)
ALTER TABLE Employees ADD temporary_column VARCHAR2(50);
DESC Employees;
SELECT * FROM Employees;

-- Drop operation (dropping column)
ALTER TABLE Employees DROP COLUMN temporary_column;
DESC Employees;
SELECT * FROM Employees;

-- Modify operation (modifying column data type)
ALTER TABLE Employees MODIFY HireDate DATE;
DESC Employees;
SELECT * FROM Employees;

-- Rename operation (renaming column)
ALTER TABLE Employees RENAME COLUMN FirstName TO First_Name;
DESC Employees;
SELECT * FROM Employees;

ALTER TABLE Employees RENAME COLUMN First_Name TO FirstName;
DESC Employees;
SELECT * FROM Employees;

-- Update operation (updating a value)
UPDATE Employees SET HireDate = DATE '2022-06-29' WHERE EmployeeID = 8;
DESC Employees;
SELECT * FROM Employees;

UPDATE Employees SET HireDate = DATE '2022-06-26' WHERE EmployeeID =8;
DESC Employees;
SELECT * FROM Employees;

-- Delete operation (deleting a row from Employees table)
DELETE FROM Employees WHERE EmployeeID = 5;
DESC Employees;
SELECT * FROM Employees;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate) VALUES (5, 'A', '13000', 'Manager', DATE '2022-01-10');
SELECT * FROM Employees;

-- Calculated field
SELECT (EmployeeID / 2) AS EmployeeID_divided_by_two FROM Employees;

-- Applying conditions
SELECT Email FROM Customers WHERE CustomerID = 1;

-- Range search
SELECT Email, Name FROM Customers WHERE CustomerID BETWEEN 1 AND 5;
SELECT Email, Name FROM Customers WHERE CustomerID NOT BETWEEN 1 AND 5;

-- Set membership
SELECT Email, Name FROM Customers WHERE CustomerID IN (1, 5);
SELECT Email, Name FROM Customers WHERE CustomerID NOT IN (1, 5);

-- Ordering by column values
SELECT Email,Name  FROM Customers ORDER BY CustomerID; 
-- Single Column Ordering
SELECT Email,Name FROM Customers ORDER BY CustomerID DESC;

-- Use of DISTINCT
SELECT DISTINCT CustomerID FROM Customers;

-- Aggregate functions
SELECT MAX(CustomerID) FROM Customers;
SELECT MIN(CustomerID) FROM Customers;
SELECT SUM(CustomerID) FROM Customers;
SELECT COUNT(CustomerID) FROM Customers;
SELECT COUNT(*) FROM Customers;
SELECT COUNT(DISTINCT CustomerID) FROM Customers;
SELECT AVG(CustomerID) FROM Customers;
SELECT AVG(NVL(CustomerID, 0)) FROM Customers;

-- Pattern Matching
SELECT CustomerID FROM Customers WHERE Email LIKE '%ma%';
SELECT CustomerID FROM Customers WHERE Email LIKE 'a%';
SELECT CustomerID FROM Customers WHERE Email LIKE '%com';

-- GROUP BY clause
SELECT COUNT(EmployeeID), Position FROM Employees GROUP BY Position;
SELECT COUNT(EmployeeID), Position FROM Employees WHERE Position = 'Manager' GROUP BY Position;

-- HAVING clause
SELECT COUNT(EmployeeID), Position FROM Employees GROUP BY Position HAVING COUNT(EmployeeID) > 1;

-- IN
SELECT CustomerID, Name, Email FROM Customers WHERE Name IN ('A', 'D', 'I');

-- Nested query
SELECT FirstName FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE Position = 'Manager');
-- Select all records from the MenuItems table where the MenuItemID is greater than some of the MenuItemIDs greater than or equal to 14
SELECT * FROM MenuItems WHERE MenuItemID > SOME(SELECT MenuItemID FROM MenuItems WHERE MenuItemID >= 4);

-- Select all records from the MenuItems table where the MenuItemID is greater than all of the MenuItemIDs greater than or equal to 4
SELECT * FROM MenuItems WHERE MenuItemID > ALL(SELECT MenuItemID FROM MenuItems WHERE MenuItemID >= 3);


-- Set operations

-- UNION ALL operation
SELECT Name, PhoneNumber FROM Customers WHERE CustomerID >1 AND CustomerID <3
UNION ALL
SELECT FirstName, LastName FROM Employees WHERE EmployeeID > 4 AND EmployeeID <5;

-- UNION operation
SELECT CustomerID FROM Customers WHERE CustomerID <3
UNION
SELECT CustomerID FROM Orders where CustomerID <6;

-- INTERSECT operation
SELECT CustomerID FROM Customers
INTERSECT
SELECT CustomerID FROM Orders;
-- Simple join examples

-- Join
SELECT o.OrderID, o.CustomerID, od.OrderDetailID FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID;

-- Natural Join
SELECT CustomerID, Name, PhoneNumber FROM Customers NATURAL JOIN Orders;
--full outer join
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Position, e.HireDate, c.CustomerID, c.Name, c.Email, c.PhoneNumber
FROM Employees e
FULL OUTER JOIN Customers c ON e.EmployeeID = c.CustomerID;
--right  outer join

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Position, e.HireDate, c.CustomerID, c.Name, c.Email, c.PhoneNumber
FROM Employees e
RIGHT OUTER JOIN Customers c ON e.EmployeeID = c.CustomerID;

--left outer join

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Position, e.HireDate, c.CustomerID, c.Name, c.Email, c.PhoneNumber
FROM Employees e
LEFT OUTER JOIN Customers c ON e.EmployeeID = c.CustomerID;

-- View to retrieve order details including customer and menu item information
CREATE VIEW OrderDetailsView AS
SELECT o.OrderID, c.Name AS CustomerName, m.Name AS MenuItem, od.Quantity, od.Price
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN MenuItems m ON od.MenuItemID = m.MenuItemID;

--Cascading Actions in Referential Integrity
CREATE TABLE Customers2(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
CREATE TABLE Orders2(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers2(CustomerID)
    on delete cascade
);
-- Inserting into Customers table
INSERT INTO Customers2 (CustomerID, Name, Email, PhoneNumber) VALUES (1, 'Mou', 'mou@example.com', '1234567890');
INSERT INTO Customers2 (CustomerID, Name, Email, PhoneNumber) VALUES(2, 'Sehu', 'sehu@example.com', '2345678901');
INSERT INTO Customers2 (CustomerID, Name, Email, PhoneNumber) VALUES(3, 'Adi', 'adi@example.com', '3456789012');
INSERT INTO Customers2 (CustomerID, Name, Email, PhoneNumber) VALUES (4, 'Sohan', 'sohan@example.com', '4567890123');
-- Inserting into Orders table
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES(1, 1,DATE '2024-01-01', 675);
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES(2, 2,DATE '2024-01-02', 350);
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES(3, 3,DATE '2024-01-03', 250);
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES (4, 4, DATE '2024-01-04', 800);
delete from Customers2 where CustomerID=2;

select * from Customers2;
select * from Orders2;

-- Creating the Employees table with constraints
CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Position VARCHAR(100) NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('active', 'inactive', 'pending')),
    HireDate DATE NOT NULL,
    TerminationDate DATE,
    CONSTRAINT check_hire_termination_dates CHECK (
        (Status = 'inactive' AND TerminationDate IS NOT NULL AND HireDate <= TerminationDate) OR
        (Status = 'inactive' AND TerminationDate IS NOT NULL) OR
        (Status = 'pending' AND TerminationDate IS NULL) OR
        (Status = 'active' AND TerminationDate IS NULL)
    )
);
-- Inserting data into the Employees table
INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Email, Age, Position, Status, HireDate, TerminationDate) 
VALUES (2, 'Alice', 'Smith', 'alice.smith@example.com', 25, 'Waiter', 'inactive', DATE '2021-05-20', DATE '2022-03-15');
--Constraints on a Single Relation
CREATE TABLE emp (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18)
);
CREATE TABLE emp2 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18 AND age <= 120),
    status VARCHAR(10) CHECK (status IN ('active', 'inactive', 'pending')),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT check_age_status CHECK (
        (status = 'active' AND age >= 18 AND age <= 65) OR
        (status = 'inactive' AND age >= 18 AND age <= 120) OR
        (status = 'pending' AND age >= 18 AND age <= 100) OR
        (end_date > start_date)
    )
);
insert into emp values(1,'ss','ss@gmail.com',25);
insert into emp2 values(3,'ss','ss@gmail.com',25,'active','03-APR-2007','04-APR-2009');
