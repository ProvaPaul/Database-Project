--Insert and Set Default pl/sql Values
SET SERVEROUTPUT ON;
DECLARE 
  v_employee_id Employees.EmployeeID%TYPE := 9;
  v_first_name Employees.FirstName%TYPE := 'John';
  v_last_name Employees.LastName%TYPE := 'Doe';
  v_position Employees.Position%TYPE := 'Manager';
  v_hire_date Employees.HireDate%TYPE := SYSDATE;
  v_email Employees.Email%TYPE := 'john.doe@example.com';
  v_dob Employees.DateOfBirth%TYPE := DATE '1985-05-15';
  v_emergency_contact Employees.EmergencyContact%TYPE := '1234567890';
  v_address Employees.Address%TYPE := '123 Maple Street';
BEGIN
  INSERT INTO Employees VALUES (v_employee_id, v_first_name, v_last_name, v_position, v_hire_date, v_email, v_dob, v_emergency_contact, v_address);
  DBMS_OUTPUT.PUT_LINE('Insert successful');
END;
/




--Row Type
SET SERVEROUTPUT ON;
DECLARE 
  v_employee_row Employees%ROWTYPE;
BEGIN
  SELECT * INTO v_employee_row FROM Employees WHERE EmployeeID = 9;
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_row.FirstName || ' ' || v_employee_row.LastName);
END;
/


--Cursor and Row Count
SET SERVEROUTPUT ON;
DECLARE 
  CURSOR employee_cursor IS SELECT * FROM Employees;
  v_employee_row Employees%ROWTYPE;
BEGIN
  OPEN employee_cursor;
  FETCH employee_cursor INTO v_employee_row;
  WHILE employee_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_row.EmployeeID || ', Name: ' || v_employee_row.FirstName || ' ' || v_employee_row.LastName);
    FETCH employee_cursor INTO v_employee_row;
  END LOOP;
  CLOSE employee_cursor;
END;
/


--FOR LOOP / WHILE LOOP / ARRAY with EXTEND() Function
SET SERVEROUTPUT ON;
DECLARE
  TYPE NameArray IS VARRAY(9) OF VARCHAR2(100);
  v_names NameArray := NameArray();
  v_name VARCHAR2(100);
BEGIN
  FOR i IN 1..9 LOOP -- Loop through all employee IDs from 1 to 9
    BEGIN
      SELECT FirstName INTO v_name FROM Employees WHERE EmployeeID = i;
      v_names.EXTEND; -- Extend the array for each new name
      v_names(v_names.LAST) := v_name;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
    END;
  END LOOP;
END;
/

--IF / ELSEIF / ELSE
SET SERVEROUTPUT ON;
DECLARE 
  v_order_total Orders.TotalAmount%TYPE;
BEGIN
  FOR rec IN (SELECT * FROM Orders) LOOP
    v_order_total := rec.TotalAmount;
    IF v_order_total > 1000 THEN
      DBMS_OUTPUT.PUT_LINE('Order ID ' || rec.OrderID || ' is a high value order.');
    ELSIF v_order_total BETWEEN 500 AND 1000 THEN
      DBMS_OUTPUT.PUT_LINE('Order ID ' || rec.OrderID || ' is a medium value order.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Order ID ' || rec.OrderID || ' is a low value order.');
    END IF;
  END LOOP;
END;
/


--PL/SQL Procedure to Fetch Employee Details by ID
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE GetEmployeeDetails (p_emp_id IN Employees.EmployeeID%TYPE) IS
  v_first_name Employees.FirstName%TYPE;
  v_last_name Employees.LastName%TYPE;
  v_position Employees.Position%TYPE;
  v_hire_date Employees.HireDate%TYPE;
  v_email Employees.Email%TYPE;
  v_dob Employees.DateOfBirth%TYPE;
  v_emergency_contact Employees.EmergencyContact%TYPE;
  v_address Employees.Address%TYPE;
BEGIN
  SELECT FirstName, LastName, Position, HireDate, Email, DateOfBirth, EmergencyContact, Address 
  INTO v_first_name, v_last_name, v_position, v_hire_date, v_email, v_dob, v_emergency_contact, v_address
  FROM Employees
  WHERE EmployeeID = p_emp_id;

  DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first_name || ', Last Name: ' || v_last_name || 
                       ', Position: ' || v_position || ', Hire Date: ' || v_hire_date ||
                       ', Email: ' || v_email || ', Date of Birth: ' || v_dob ||
                       ', Emergency Contact: ' || v_emergency_contact || ', Address: ' || v_address);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee found with ID ' || p_emp_id);
END;
/

--PL/SQL Function to Calculate Total Sales
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION CalculateTotalSales RETURN DECIMAL IS
  total_sales DECIMAL(10, 2);
BEGIN
  SELECT SUM(TotalAmount) INTO total_sales FROM Orders;
  RETURN total_sales;
END;
/

DECLARE
  total DECIMAL;
BEGIN
  total := CalculateTotalSales;
  DBMS_OUTPUT.PUT_LINE('Total Sales: ' || total);
END;
/


--PL/SQL Trigger to Automatically Update Inventory on Order
CREATE OR REPLACE TRIGGER UpdateInventory
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
  UPDATE Inventory
  SET Quantity = Quantity - :NEW.Quantity
  WHERE MenuItemID = :NEW.MenuItemID;

  IF SQL%ROWCOUNT = 0 THEN
    -- Optionally, raise an error if no inventory was found to update
    RAISE_APPLICATION_ERROR(-20001, 'No inventory record found for MenuItemID: ' || :NEW.MenuItemID);
  END IF;
END;
/

--PL/SQL Procedure to Add New Order and Order Details
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE AddOrder(
  p_customer_id Customers.CustomerID%TYPE,
  p_order_date DATE,
  p_menu_items SYS.ODCINUMBERLIST,
  p_quantities SYS.ODCINUMBERLIST
) IS
  v_order_id Orders.OrderID%TYPE;
BEGIN
  INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
  VALUES (p_customer_id, p_order_date, 0)
  RETURNING OrderID INTO v_order_id;

  FOR i IN 1..p_menu_items.COUNT LOOP
    INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, Price, Subtotal, Discount, FinalPrice)
    SELECT v_order_id, p_menu_items(i), p_quantities(i), Price, Price * p_quantities(i), 0, Price * p_quantities(i)
    FROM MenuItems WHERE MenuItemID = p_menu_items(i);
  END LOOP;

  UPDATE Orders
  SET TotalAmount = (SELECT SUM(FinalPrice) FROM OrderDetails WHERE OrderID = v_order_id)
  WHERE OrderID = v_order_id;

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/

--create a trigger that automatically updates the TotalAmount in the Orders table and reduces the inventory quantity in the Inventory table when a new order detail is inserted into the OrderDetails table
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER UpdateOrderAndInventory
AFTER INSERT ON OrderDetails
FOR EACH ROW
DECLARE
    v_new_inventory INT;
BEGIN
    UPDATE Inventory
    SET Quantity = Quantity - :NEW.Quantity
    WHERE MenuItemID = :NEW.MenuItemID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No inventory record found for MenuItemID: ' || :NEW.MenuItemID);
    END IF;

    SELECT Quantity INTO v_new_inventory FROM Inventory WHERE MenuItemID = :NEW.MenuItemID;
    DBMS_OUTPUT.PUT_LINE('Updated Inventory for MenuItemID ' || :NEW.MenuItemID || ': ' || v_new_inventory);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No inventory record found for MenuItemID ' || :NEW.MenuItemID);
END;
/


--PL/SQL Block to Display Project Details
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Project Name: Cafe Management System');
  DBMS_OUTPUT.PUT_LINE('Created by: Prova Rani Paul');
  DBMS_OUTPUT.PUT_LINE('Roll: 2007037');
END;
/