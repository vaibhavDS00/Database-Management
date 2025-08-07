#PROCEDURES
USE PROCEDURES;
#Q-1 Create a procedure to fetch all records from a "Customers" table.
DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customers;
END //
DELIMITER ;

CALL GetAllCustomers();

#Q-2 Create a procedure that takes a customer ID as input and returns that customer’s information.
DELIMITER //
CREATE PROCEDURE GetCustomerById(IN cust_id INT)
BEGIN
    SELECT * FROM Customers WHERE ID = cust_id;
END //
DELIMITER ;

CALL GetCustomerById(2);

#Q-3 Write a procedure to update the salary of an employee given their ID and new salary.
DELIMITER //
CREATE PROCEDURE UpdateSalary(IN emp_id INT, IN new_salary DECIMAL(10,2))
BEGIN
    UPDATE Employees SET Salary = new_salary WHERE ID = emp_id;
END //
DELIMITER ;

CALL UpdateSalary(5, 12000.50);

#Q-4 Create a procedure that deletes a customer by ID.
DELIMITER //
CREATE PROCEDURE DeleteCustomer(IN cust_id INT)
BEGIN
    DELETE FROM Customers WHERE ID = cust_id;
END //
DELIMITER ;

CALL DeleteCustomer(7);

#Q-5 Write a procedure to count the number of customers in a particular city.
DELIMITER //
CREATE PROCEDURE CountCustomersByCity(IN city_name VARCHAR(50), OUT cust_count INT)
BEGIN
    SELECT COUNT(*) INTO cust_count FROM Customers WHERE City = city_name;
END //
DELIMITER ;

CALL CountCustomersByCity('London', @customer_count);
SELECT @customer_count;

#Q-6 How do you show all stored procedures in the current database?
SHOW PROCEDURE STATUS WHERE Db = 'CountCustomersByCity';

#Q-7 Create a procedure that inserts a new row into "Orders" table using parameters.
DELIMITER //
CREATE PROCEDURE CreateOrder(
    IN cust_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    INSERT INTO Orders(CustomerID, Amount) VALUES (cust_id, amount);
END //
DELIMITER ;

CALL CreateOrder(3, 250.75);

#Q-8 Write a procedure with an output parameter returning the highest salary in Employees.
DELIMITER //
CREATE PROCEDURE GetMaxSalary(OUT max_sal DECIMAL(10,2))
BEGIN
    SELECT MAX(Salary) INTO max_sal FROM Employees;
END //
DELIMITER ;

CALL GetMaxSalary(@max_salary);
SELECT @max_salary;

#Q-9 How can you modify an existing procedure?
DROP PROCEDURE IF EXISTS GetMaxSalary;

#Q-10 Example: Procedure using a loop to sum numbers from 1 to N (parameter).
DELIMITER //
CREATE PROCEDURE SumToN(IN n INT, OUT total INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    SET total = 0;
    WHILE i <= n DO
        SET total = total + i;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL SumToN(10, @sum);
SELECT @sum; -- Returns 55




