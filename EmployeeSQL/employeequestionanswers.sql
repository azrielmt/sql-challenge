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


-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT count(last_name) as frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;