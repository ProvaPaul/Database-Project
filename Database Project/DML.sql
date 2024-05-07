-- Inserting into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (1, 'Abir', 'Rahman', 'Manager', DATE '2022-01-10', 'abir@example.com', DATE '1990-05-15', '1234567890', '123 Main St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (2, 'Samir', 'Bissash', 'Assistant_Manager', DATE '2022-02-15', 'samir@example.com', DATE '1995-07-20', '2345678901', '456 Elm St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (3, 'Mahir', 'Rahman', 'Chef', DATE '2022-03-12', 'mahir@example.com', DATE '1992-09-30', '3456789012', '789 Oak St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (4, 'Sara', 'Ahmed', 'Barista', DATE '2023-05-20', 'sara@example.com', DATE '1993-11-25', '4567890123', '234 Maple Ave');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (5, 'Kamal', 'Hossain', 'Waiter', DATE '2023-06-15', 'kamal@example.com', DATE '1994-08-18', '5678901234', '567 Pine St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (6, 'Tina', 'Das', 'Barista', DATE '2023-07-10', 'tina@example.com', DATE '1996-01-05', '6789012345', '678 Cedar St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (7, 'Raj', 'Chakma', 'Chef', DATE '2023-08-05', 'raj@example.com', DATE '1989-03-22', '7890123456', '789 Oak St');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address) VALUES (8, 'Priya', 'Devi', 'Waiter', DATE '2023-09-01', 'priya@example.com', DATE '1997-07-12', '8901234567', '890 Elm St');
-- Inserting into Customers table
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (1, 'Mou', 'mou@example.com', '1234567890', DATE '2023-01-01', 50, 'No specific preferences', 'Regular customer');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (2, 'Sehu', 'sehu@example.com', '2345678901', DATE '2023-02-02', 30, 'Prefers vegan options', 'Allergic to nuts');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (3, 'Adi', 'adi@example.com', '3456789012', DATE '2023-03-03', 20, 'Enjoys spicy food', 'First-time visitor');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (4, 'Sohan', 'sohan@example.com', '4567890123', DATE '2023-04-04', 10, 'Likes desserts', 'Regular customer');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (5, 'Rima', 'rima@example.com', '5678901234', DATE '2023-05-05', 40, 'Prefers organic food', 'Allergic to seafood');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (6, 'Neha', 'neha@example.com', '6789012345', DATE '2023-06-06', 60, 'Enjoys vegetarian meals', 'Regular customer');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (7, 'Raju', 'raju@example.com', '7890123456', DATE '2023-07-07', 25, 'Prefers gluten-free options', 'Allergic to dairy');
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, RegistrationDate, LoyaltyPoints, Preferences, Notes) VALUES (8, 'Anjali', 'anjali@example.com', '8901234567', DATE '2023-08-08', 35, 'Likes spicy food', 'Regular customer');
-- Inserting into MenuItems table
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (1, 'Espresso', 'Strong coffee', 250, 'Beverage', 'Calories: 5, Protein: 0g, Fat: 0g, Carbs: 0g', '1 oz');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (2, 'Latte', 'Coffee with milk', 350, 'Beverage', 'Calories: 150, Protein: 8g, Fat: 5g, Carbs: 12g', '12 oz');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (3, 'Blueberry Muffin', 'Fresh muffins with blueberries', 275, 'Pastry', 'Calories: 300, Protein: 5g, Fat: 10g, Carbs: 45g', '1 piece');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (4, 'Cappuccino', 'Coffee with frothy milk', 400, 'Beverage', 'Calories: 200, Protein: 7g, Fat: 6g, Carbs: 18g', '8 oz');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (5, 'Croissant', 'Buttery pastry', 200, 'Pastry', 'Calories: 250, Protein: 4g, Fat: 12g, Carbs: 30g', '1 piece');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (6, 'Mocha', 'Coffee with chocolate', 450, 'Beverage', 'Calories: 350, Protein: 9g, Fat: 8g, Carbs: 25g', '16 oz');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (7, 'Bagel', 'Bread roll', 150, 'Bakery', 'Calories: 200, Protein: 6g, Fat: 2g, Carbs: 40g', '1 piece');
INSERT INTO MenuItems (MenuItemID, Name, Description, Price, Category, NutritionInfo, ServingSize) VALUES (8, 'Tea', 'Hot beverage', 300, 'Beverage', 'Calories: 0, Protein: 0g, Fat: 0g, Carbs: 0g', '12 oz');
-- Inserting into Orders table
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (1, 1, 1, DATE '2024-01-01', 675, 'Completed', 'Great service!', 'WELCOME10', '123 Main St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (2, 2, 2, DATE '2024-01-02', 350, 'Completed', 'Quick delivery', 'NEWCUSTOMER', '456 Elm St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (3, 3, 3, DATE '2024-01-03', 250, 'Completed', 'Excellent food quality', NULL, '789 Oak St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (4, 4, 4, DATE '2024-01-04', 800, 'Completed', 'Satisfied with the service', 'LOYALTY25', '234 Maple Ave');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (5, 5, 5, DATE '2024-01-05', 700, 'Completed', 'Delicious food!', 'REPEAT10', '567 Pine St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (6, 6, 6, DATE '2024-01-06', 600, 'Completed', 'Will order again', NULL, '678 Cedar St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (7, 7, 7, DATE '2024-01-07', 900, 'Completed', 'Fast delivery', 'FREESHIP', '789 Oak St');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status, Feedback, CouponCode, DeliveryAddress) VALUES (8, 8, 8, DATE '2024-01-08', 1000, 'Completed', 'Great experience', 'LOYALTY50', '890 Elm St');
--Inserting into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (1, 1, 1, 1, 250, 250, 0, 250);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (2, 2, 2, 1, 350, 350, 0, 350);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (3, 3, 3, 1, 275, 275, 0, 275);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (4, 4, 4, 2, 400, 800, 0, 800);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (5, 5, 5, 3, 200, 600, 100, 500);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (6, 6, 6, 1, 450, 450, 0, 450);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (7, 7, 7, 4, 150, 600, 50, 550);
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice) VALUES (8, 8, 8, 2, 300, 600, 0, 600);

--Inserting into Suppliers table
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (1, 'Good Eats', 'Sam Cook', '456-789-0123', 'good.eats@example.com', 4.5, 2, '123 Food St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (2, 'Daily Brew', 'Linda Bean', '567-890-1234', 'daily.brew@example.com', 4.0, 3, '456 Coffee St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (3, 'Morning Fresh', 'John Smith', '678-901-2345', 'morning.fresh@example.com', 4.2, 2, '789 Bakery St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (4, 'Sunrise Bakery', 'Emily Jones', '789-012-3456', 'sunrise.bakery@example.com', 4.8, 1, '234 Pastry St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (5, 'Fresh Delights', 'Daniel Lee', '890-123-4567', 'fresh.delights@example.com', 4.3, 2, '567 Bakery St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (6, 'Green Valley Farms', 'Sophia Brown', '901-234-5678', 'green.valley@example.com', 4.7, 3, '678 Farm St');
INSERT INTO Suppliers (SupplierID, Name, ContactName, PhoneNumber, Email, Rating, DeliveryDays, Address) VALUES (7, 'Golden Grains', 'David Wilson', '012-345-6789', 'golden.grains@example.com', 4.6, 2, '789 Grain St');
-- Inserting into Inventory table
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (1, 1, 1, 100, DATE '2024-01-10', 200, 20, DATE '2023-12-20');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (2, 2, 2, 150, DATE '2024-01-10', 300, 25, DATE '2023-12-21');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (3, 3, 3, 50, DATE '2024-01-15', 250, 15, DATE '2023-12-22');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (4, 4, 4, 200, DATE '2024-01-20', 400, 30, DATE '2023-12-23');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (5, 5, 5, 300, DATE '2024-01-25', 150, 40, DATE '2023-12-24');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (6, 6, 6, 150, DATE '2024-01-30', 350, 20, DATE '2023-12-25');
INSERT INTO Inventory (InventoryID, MenuItemID, SupplierID, Quantity, RestockDate, UnitPrice, ReorderLevel, LastOrderDate) VALUES (7, 7, 7, 400, DATE '2024-02-05', 100, 35, DATE '2023-12-26');
-- Inserting into Payments table
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (1, 1, 1, DATE '2024-01-01', 675, 'Credit Card', '1234567890', 'Visa', 'AUTH123');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (2, 2, 2, DATE '2024-01-02', 350, 'Debit Card', '2345678901', 'Mastercard', 'AUTH234');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (3, 3, 3, DATE '2024-01-03', 250, 'Cash', NULL, NULL, NULL);
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (4, 4, 4, DATE '2024-01-04', 800, 'Credit Card', '3456789012', 'Visa', 'AUTH345');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (5, 5, 5, DATE '2024-01-05', 700, 'Mobile Payment', '4567890123', 'PayPal', 'AUTH456');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (6, 6, 6, DATE '2024-01-06', 600, 'Credit Card', '5678901234', 'American Express', 'AUTH567');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (7, 7, 7, DATE '2024-01-07', 900, 'Debit Card', '6789012345', 'Visa', 'AUTH678');
INSERT INTO Payments (PaymentID, OrderID, EmployeeID, PaymentDate, AmountPaid, PaymentMethod, TransactionID, CardType, AuthorizationCode) VALUES (8, 8, 8, DATE '2024-01-08', 1000, 'Cash', NULL, NULL, NULL);
