-- Create table for employees.csv
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees (
 	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT
	*
FROM
	employees;
	
-- Create table for departments.csv
DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT
	*
FROM
	dept;
	
-- Create table for dept_emp.csv
DROP TABLE IF EXISTS dept_emp CASCADE;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

SELECT
	*
FROM
	dept_emp;

-- Create table for dept_manager.csv
DROP TABLE IF EXISTS dept_manager CASCADE;

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT
	*
FROM
	dept_manager;
	
-- Create table for salaries.csv
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT
	*
FROM
	salaries;

-- Create table for titles.csv
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT
	*
FROM
	titles;


