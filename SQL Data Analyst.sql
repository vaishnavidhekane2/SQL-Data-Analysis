-- Customers Table
CREATE DATABASE customer;
use customer;

-- Create table what you u want to create the table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(150) UNIQUE,
  signup_date DATE,
  city VARCHAR(100)
);

-- Insert Values on the table
INSERT INTO customers VALUES (111, 'Rahul','sharma', 'rahul.sharma@example.com', '2025-01-15', 'Mumbai'),
(222, 'Sneha', 'Patil', 'sneha.patil@example.com', '2025-02-10', 'Pune'),
(333, 'Amit', 'gupta', 'amit.gupta@example.com', '2025-03-05', 'Delhi'),
(444, 'Priya', 'nair', 'priya.nair@example.com', '2025-04-20', 'Bengaluru'),
(555, 'Karan', 'mehta', 'karan.mehta@example.com', '2025-05-18', 'Kolhapur'),
(666, 'Anjali', 'deshmukh','anjali.deshmukh@example.com', '2025-06-12', 'Nagpur');

-- Select
select * from customers;
SELECT * FROM customers
ORDER BY customer_id ASC;

-- Count
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Add Column On the table
ALTER TABLE customers
ADD purchase_amount INT;

INSERT INTO customers (first_name, last_name, email, signup_date, city, purchase_amount) VALUES
('John', 'Doe', 'john@example.com', '2025-01-10', 'Mumbai', 2000),
('Priya', 'Sharma', 'priya@example.com', '2025-02-05', 'Pune', 3500),
('Amit', 'Patil', 'amit@example.com', '2025-02-20', 'Nashik', 1500),
('Sneha', 'Kadam', 'sneha@example.com', '2025-03-01', 'Mumbai', 4000);

desc customers;

--- Sum
SELECT SUM(purchase_amount) AS total_amount
FROM customers;

-- Avg
SELECT AVG(purchase_amount) AS total_amount
FROM customers;

-- Where
UPDATE customers set customer_id=999 where customer_id=111;
SELECT * FROM customers;

-- Subquery: Find customers who live in the city with the highest number of customers
SELECT *
FROM customers
WHERE city = (
    SELECT city
    FROM customers
    GROUP BY city
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Subquery
-- Find customers who signed up after the earliest signup date
SELECT *
FROM customers
WHERE signup_date > (
    SELECT MIN(signup_date) FROM customers
);

-- Subquery:  Find customers whose ID is greater than the average customer_id
SELECT *
FROM customers
WHERE customer_id > (
    SELECT AVG(customer_id) FROM customers
);

-- NEW TABLE
CREATE DATABASE ktm;
use ktm;

CREATE TABLE ktm(
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_amount DECIMAL(10,2)
);

INSERT INTO ktm VALUES
(1, 111, '2025-01-20', 1500),
(2, 222, '2025-02-12', 2000),
(3, 333, '2025-02-25', 750),
(4, 111, '2025-03-01', 3000),
(5, 555, '2025-03-04', 1200);

select * from ktm;
select * from customers;

-- Where 
update ktm set customer_id=999 where customer_id=111;

-- Subquery
-- Total amount of all orders (SUM)
SELECT SUM(amount) AS total_amount
FROM ktm;

-- Total and average amount per customer (GROUP BY)
SELECT customer_id,
       SUM(amount) AS total_spent,
       AVG(amount) AS avg_order
FROM ktm
GROUP BY customer_id;

-- Inner Join
SELECT *
FROM customers
INNER JOIN ktm
ON customers.customer_id = ktm.customer_id;

-- left Join
SELECT *
FROM customers 
LEFT JOIN ktm 
ON customer_id = customer_id;

-- Group By
SELECT 
    customer_id,
    SUM(amount) AS total_spent
FROM ktm
GROUP BY customer_id;






