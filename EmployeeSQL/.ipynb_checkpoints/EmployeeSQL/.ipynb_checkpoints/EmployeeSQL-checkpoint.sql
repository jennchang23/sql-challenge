--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

DROP VIEW IF EXISTS employee_salaries;

CREATE VIEW employee_salaries AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
LEFT JOIN employees
ON employees.emp_no = salaries.emp_no;

SELECT *
FROM employee_salaries;

--2. List employees who were hired in 1986.

DROP VIEW IF EXISTS hires_1986;

CREATE VIEW hires_1986 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' 
	and hire_date < '1987-01-01';

SELECT *
FROM hires_1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

DROP VIEW IF EXISTS dept_managers;

CREATE VIEW dept_managers AS
SELECT dept_manager.dept_no, dept.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no
LEFT JOIN dept
ON dept_manager.dept_no = dept.dept_no;

SELECT *
FROM dept_managers;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

DROP VIEW IF EXISTS employee_depts;

CREATE VIEW employee_depts AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept.dept_name
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN dept
ON dept_emp.dept_no = dept.dept_no;

SELECT *
FROM employee_depts;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

DROP VIEW IF EXISTS employees_herculesB;

CREATE VIEW employees_herculesB AS
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
WHERE employees.first_name = 'Hercules'
	AND LEFT(employees.last_name, 1) = 'B';

SELECT *
FROM employees_herculesB;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

DROP VIEW IF EXISTS employees_SalesDept;

CREATE VIEW employees_SalesDept AS
SELECT employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN dept
ON dept_emp.dept_no = dept.dept_no
WHERE dept_name ILIKE 'Sales';

SELECT *
FROM employees_SalesDept;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

DROP VIEW IF EXISTS employees_salesANDdev;

CREATE VIEW employees_salesANDdev AS
SELECT employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN dept
ON dept_emp.dept_no = dept.dept_no
WHERE dept_name ILIKE 'Sales'
	OR dept_name ILIKE 'Development';

SELECT *
FROM employees_salesANDdev;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

DROP VIEW IF EXISTS employee_lastnames;

CREATE VIEW employee_lastnames AS
SELECT employees.last_name, COUNT(employees.last_name) as "employee_count"
FROM employees
GROUP BY last_name
ORDER BY "employee_count" DESC;

SELECT *
FROM employee_lastnames;
