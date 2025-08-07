#TRIGGER FUNCTION
USE TRIGGERS;
#Q-1 Write a query to create a trigger that prevents inserting employees with negative salary values into an Employees table.
CREATE TRIGGER prevent_negative_salary
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;

#Q-2 Write a trigger to automatically log any deleted row from the Orders table into a deleted_orders archive table.
CREATE TRIGGER log_deletions
AFTER DELETE ON Orders
FOR EACH ROW
INSERT INTO deleted_orders(order_id, deleted_at)
VALUES (OLD.order_id, NOW());

#Q-3 CREATE TRIGGER log_deletions
AFTER DELETE ON Orders
FOR EACH ROW
INSERT INTO deleted_orders(order_id, deleted_at)
VALUES (OLD.order_id, NOW());

#Q-4 Write a query to show all triggers in the current database.
SHOW TRIGGERS;

#Q-5 Create a trigger to ensure that the email column in the Customers table is always stored in lowercase when inserted.
CREATE TRIGGER lowercase_email
BEFORE INSERT ON Customers
FOR EACH ROW
SET NEW.email = LOWER(NEW.email);

#Q-6 Write a trigger to automatically update the employee_count in the Departments table when a new employee is inserted into the Employees table.
CREATE TRIGGER update_dept_count
AFTER INSERT ON Employees
FOR EACH ROW
UPDATE Departments
SET employee_count = employee_count + 1
WHERE department_id = NEW.department_id;

#Q-7 Write a trigger to reject any attempt to delete a product with stock greater than zero from the Products table.
CREATE TRIGGER prevent_delete_if_in_stock
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    IF OLD.stock > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with stock remaining';
    END IF;
END;

#Q-8 Create a BEFORE UPDATE trigger on Accounts that logs the old balance and the new balance into an audit table when a balance is changed.
CREATE TRIGGER log_account_update
BEFORE UPDATE ON Accounts
FOR EACH ROW
INSERT INTO account_audit(account_id, old_balance, new_balance, changed_at)
VALUES (OLD.account_id, OLD.balance, NEW.balance, NOW());

#Q-9 Write a query to remove a trigger named update_dept_count.
DROP TRIGGER IF EXISTS update_dept_count;

#Q-10 Create a trigger that prevents inserting two rows with the same phone number into the Contacts table.
CREATE TRIGGER unique_phone_number
BEFORE INSERT ON Contacts
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Contacts WHERE phone = NEW.phone) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate phone number';
    END IF;
END;

