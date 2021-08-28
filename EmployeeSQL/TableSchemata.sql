DROP TABLE IF EXISTS department_managers;
DROP TABLE IF EXISTS department_employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE departments (
    id VARCHAR NOT NULL,
    department_name VARCHAR NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE employees (
    id VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL, 
	title_id VARCHAR,
	hire_date DATE NOT NULL,
	sex VARCHAR(20) NOT NULL,
	birthdate DATE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (title_id) REFERENCES titles(id)
);

CREATE TABLE salaries (
    id SERIAL,
	salary DEC NOT NULL,
	employee_id VARCHAR NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE department_employees (
    id SERIAL,
	department_id VARCHAR NOT NULL,
	employee_id VARCHAR NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (department_id) REFERENCES departments(id),
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE department_managers (
    id SERIAL,
	department_id VARCHAR NOT NULL,
	employee_id VARCHAR NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (department_id) REFERENCES departments(id),
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- SELECT * FROM titles;
-- SELECT * FROM departments;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM department_employees;
-- SELECT * FROM department_managers;

COPY titles FROM '/Users/jagjeetkhalsa/Public/titles.csv' DELIMITER ',' CSV HEADER;
COPY departments FROM '/Users/jagjeetkhalsa/Public/departments.csv' DELIMITER ',' CSV HEADER;
COPY employees (id, title_id, birthdate, first_name, last_name, sex, hire_date) FROM '/Users/jagjeetkhalsa/Public/employees.csv' DELIMITER ',' CSV HEADER;
COPY salaries (employee_id, salary) FROM '/Users/jagjeetkhalsa/Public/salaries.csv' DELIMITER ',' CSV HEADER;
COPY department_employees (employee_id, department_id) FROM '/Users/jagjeetkhalsa/Public/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY department_managers (department_id, employee_id)FROM '/Users/jagjeetkhalsa/Public/dept_manager.csv' DELIMITER ',' CSV HEADER;

-- SELECT * FROM titles;
-- SELECT * FROM departments;
-- SELECT * FROM employees LIMIT 5;
-- SELECT * FROM salaries LIMIT 5;
-- SELECT * FROM department_employees LIMIT 5;
-- SELECT * FROM department_managers;

