-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE,
    Email VARCHAR(100),
    DateOfBirth DATE,
    EmergencyContact VARCHAR(15),
    Address VARCHAR(200)
);
-- Creating the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    RegistrationDate DATE,
    LoyaltyPoints INT,
    Preferences VARCHAR(200),
    Notes VARCHAR(200)
);
-- Creating the MenuItems table
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    NutritionInfo VARCHAR(200),
    ServingSize VARCHAR(50)
);
-- Creating the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,  -- Assuming you want to track which employee took the order
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    Feedback VARCHAR(200),
    CouponCode VARCHAR(50),
    DeliveryAddress VARCHAR(200),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- Creating the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    FinalPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);
-- Creating the Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactName VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Rating DECIMAL(3,2),
    DeliveryDays INT,
    Address VARCHAR(200)
);
-- Creating the Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    MenuItemID INT,
    SupplierID INT,
    Quantity INT,
    RestockDate DATE,
    UnitPrice DECIMAL(10, 2),
    ReorderLevel INT,
    LastOrderDate DATE,
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
-- Creating the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    EmployeeID INT,  -- Assuming you want to track which employee processed the payment
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    TransactionID VARCHAR(50),
    CardType VARCHAR(30),
    AuthorizationCode VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
