--  Q1
SELECT * FROM customers;

-- Q2
SELECT DISTINCT country from customers;

-- Q3
SELECT * FROM customers WHERE customer_id LIKE 'BL%'; 

-- Q4
SELECT * FROM orders LIMIT 100;

-- Q5
SELECT * FROM customers WHERE postal_code IN ('1010', '3012', '12209', '05023');

-- Q6
SELECT * FROM orders WHERE ship_region IS NOT NULL;

-- Q7
SELECT customer_id, contact_name, country, city FROM customers ORDER BY country, city;

-- Q8
INSERT INTO customers(customer_id, company_name, contact_name) VALUES ('GCDPY', 'Grand Circus', 'Grant Chirpus');
SELECT contact_name FROM customers WHERE contact_name = 'Grant Chirpus'; --for testing

--  Q9
UPDATE orders SET ship_region = 'EuroZone' WHERE ship_country = 'France';
SELECT * from orders WHERE ship_country = 'France';  --for testing

-- Q10
DELETE FROM order_details WHERE quantity = 1;

-- Q11
SELECT AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details;

-- Q12
SELECT order_id, AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details GROUP BY order_id;

-- Q13
SELECT customer_id FROM orders WHERE order_id = 10290;

-- Q14
SELECT * FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id;
SELECT * FROM orders LEFT JOIN customers ON orders.customer_id = customers.customer_id;
SELECT * FROM orders RIGHT JOIN customers ON orders.customer_id = customers.customer_id;

-- Q15
SELECT employees.employee_id, employees.city, orders.order_id, orders.ship_city, orders.ship_country FROM employees INNER JOIN orders ON orders.ship_city = employees.city WHERE employees.city = 'London';

-- Q16
SELECT orders.ship_name FROM orders JOIN order_details ON orders.order_id = order_details.order_id 
JOIN products ON order_details.product_id = products.product_id WHERE products.discontinued = 1;

-- Q17
SELECT first_name, reports_to FROM employees WHERE reports_to ISNULL;

-- Q18
SELECT employee_id, first_name, reports_to FROM employees WHERE reports_to = 2;
	-- I feel like there should be a programmatic way to do this instead of hardcoding '2'?
	-- I tried: SELECT employee_id, first_name, reports_to FROM employees WHERE reports_to = SELECT employee_id FROM employees WHERE first_name = 'Andrew';
	-- ... but that didn't work.

-- Q19
CREATE INDEX cust_id_index ON orders(customer_id);