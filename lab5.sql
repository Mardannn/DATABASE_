--1
CREATE DATABASE LAB_5;

--2
CREATE TABLE ccustomers(
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);
INSERT INTO ccustomers(customer_id, cust_name, city, grade, salesman_id)
VALUES(3002, 'Nick Rimando', 'New York', 100, 5001),
      (3005, 'Graham Zusi', 'California', 200, 5002),
      (3001, 'Brad Guzan', 'London', NULL, 5005),
      (3004, 'Fabian Johns', 'Paris', 300, 5006),
      (3007, 'Brad Davis', 'New York', 200, 5001),
      (3009, 'Geoff Camero', 'Berlin', 100, 5003),
      (3008, 'Julian Green', 'London', 300, 5002);

CREATE TABLE orders(
    ord_no INT,
    purch_amt REAL,
    ord_Date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

--3
SELECT sum(purch_amt) AS sum_purchase FROM orders;
--4
SELECT avg(purch_amt) AS average_purchase FROM orders;
--5
SELECT count(cust_name) AS customers_name FROM ccustomers;
--6
SELECT min(purch_amt) AS min_purchase FROM orders;
/*
егер null болса
SELECT purch_amt FROM orders
    ORDER BY purch_amt ASC nulls last LIMIT 1;
*/

--7
SELECT * FROM ccustomers WHERE cust_name LIKE '%b';
--8
SELECT * FROM orders
WHERE  customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
--9
SELECT * FROM ccustomers
WHERE  customer_id IN (SELECT customer_id FROM orders WHERE purch_amt>10);
--10
SELECT sum(grade) AS sum_grade FROM ccustomers;
--11
SELECT * FROM ccustomers
WHERE cust_name IS NOT NULL;
--12
SELECT max(grade) AS max_grade FROM ccustomers;