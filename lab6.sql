DROP DATABASE IF EXISTS lab_6;
CREATE DATABASE lab_6;
\c lab_6
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations(location_id)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(25),
    salary INTEGER,
    department_id INTEGER REFERENCES departments(department_id)
);
INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Main St', '12345', 'Springfield', 'SP'),
    ('456 Oak St', '67890', 'Shelbyville', 'SH');

INSERT INTO departments (department_name, budget, location_id)
VALUES
    ('Sales', 100000, 1),
    ('Engineering', 150000, 2),
    ('Marketing', 120000, 1);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('John', 'Doe', 'jdoe@example.com', '555-1234', 60000, 1),
    ('Jane', 'Smith', 'jsmith@example.com', '555-5678', 75000, 2),
    ('Alice', 'Johnson', 'ajohnson@example.com', '555-8765', 50000, 1),
    ('Bob', 'Williams', 'bwilliams@example.com', '555-4321', 65000, 3);


SELECT employees.first_name, employees.last_name, employees.department_id, departments.department_name
FROM employees
JOIN departments ON departments.department_id = employees.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (80, 40);

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id;

SELECT d.department_id, d.department_name, e.employee_id
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
