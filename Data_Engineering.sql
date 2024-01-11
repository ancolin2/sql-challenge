--DATA ENGINEERING
--CREATE ALL 6 TABLES
CREATE TABLE titles(
	title_id VARCHAR (5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id))
;

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date VARCHAR(10),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no)
	FOREIGN KEY (emp_title_id) references titles(title_id))
;

CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no))
;

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no))
;

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no,emp_no)
	FOREIGN KEY (dept_no) references departments(dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no))
;

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no,salary)
	FOREIGN KEY (emp_no) references employees(emp_no))
;	
--IMPORT TABLES BY RIGHT-CLICKING TABLE AND IMPORT/EXPORT DATA
