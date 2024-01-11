--DATA ANALYSIS
--1.List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees as e
INNER JOIN salaries as s on
e.emp_no=s.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM employees 
WHERE hire_date LIKE '%1986';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager as dm
INNER JOIN departments as d on
d.dept_no = dm.dept_no
INNER JOIN employees as e on 
e.emp_no= dm.emp_no

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select 
	d.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM departments as d
INNER JOIN dept_emp on
dept_emp.dept_no = d.dept_no
INNER JOIN employees as e on
e.emp_no = dept_emp.emp_no

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	first_name,
	last_name,
	sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name
from employees as e
INNER JOIN dept_emp on
dept_emp.emp_no = e.emp_no
WHERE dept_no IN(
	SELECT 
		dept_no
	FROM departments
	WHERE dept_name = 'Sales')
	
--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	departments.dept_name
FROM employees as e
INNER JOIN dept_emp on
dept_emp.emp_no = e.emp_no
INNER JOIN departments on 
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no IN (
	SELECT 
		dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	or dept_name = 'Development')
	
--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name,
	count(last_name)
from employees
GROUP BY "last_name" 
ORDER BY 2 DESC