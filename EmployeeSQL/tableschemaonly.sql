DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255)NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM dept_manager;