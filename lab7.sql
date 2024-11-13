DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    department_id INT
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget NUMERIC(15, 2) NOT NULL
);
--1
CREATE INDEX index_countries_name ON countries (name);
--2
CREATE INDEX index_employees_name_surname ON employees (name, surname);
--3
CREATE UNIQUE INDEX index_employees_salary_range ON employees (salary);
--4
CREATE INDEX index_employees_name_substring ON employees ((substring(name from 1 for 4)));
--5
CREATE INDEX index_departments_budget ON departments (budget);
CREATE INDEX index_employees_salary ON employees (salary);
