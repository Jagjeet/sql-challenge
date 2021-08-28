-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT 
	e.id as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	e.sex,
	s.salary
FROM employees e INNER JOIN salaries s ON e.id = s.employee_id;

-- List first name, last name, and hire date for employees who were hired in 1986.
-- https://www.postgresqltutorial.com/postgresql-extract/
SELECT 
	first_name as "first name",
	last_name as "last name",
	hire_date as "hire date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986 

-- List the manager of each department with the following information: 
-- department number, department name, the manager’s employee number, last name, first name.
-- https://www.sqlshack.com/sql-multiple-joins-for-beginners-with-examples/
SELECT 
	dm.department_id as "department number",
	d.department_name as "department name",
	e.id as "employee number",
	e.last_name as "last name",
	e.first_name as "first name"
FROM employees e 
	INNER JOIN department_managers dm
	ON e.id = dm.employee_id
	INNER JOIN departments d
	ON dm.department_id = d.id;	

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT
	e.id as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.department_name as "department name"
FROM employees e
	INNER JOIN department_employees de
	ON e.id = de.employee_id
	INNER JOIN departments d
	ON de.department_id = d.id;	

-- List first name, last name, and sex for employees 
-- whose first name is “Hercules” and last names begin with “B.”
-- https://stackoverflow.com/questions/46978821/postgres-regex-begins-with-and-ends-with
SELECT 
	first_name as "first name",
	last_name as "last name",
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- This query also could work using regular expressions
SELECT 
	first_name as "first name",
	last_name as "last name",
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name ~ '^[B]{1}[\w]*$'

-- List all employees in the Sales department, including
-- their employee number, last name, first name, and department name.
SELECT
	e.id as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.department_name as "department name"
FROM employees AS e
	INNER JOIN department_employees de
	ON e.id = de.employee_id
	INNER JOIN departments d
	ON de.department_id = d.id
WHERE d.department_name = 'Sales';


-- List all employees in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.
SELECT
	e.id as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.department_name as "department name"
FROM employees AS e
	INNER JOIN department_employees de
	ON e.id = de.employee_id
	INNER JOIN departments d
	ON de.department_id = d.id
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
