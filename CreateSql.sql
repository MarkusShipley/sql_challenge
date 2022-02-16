-- Creating table schema
-- Create table employees

DROP TABLE employees
--FOREIGN KEY(emp_title_id) REFERENCES titles (title_id) CANNOT be added until the titles table is added.  
--All tables were created in an order whereby a table whose primary key is later used as a foreign key was created first
--The only exception is the employees table.  All or most table depend on emp_no as the foreign key so it needed to be created first
--Thus, the alter table command to add the foreign key to the employeee table is at the end of this code. 
--Tables are named after the data files and the columns named after the column headers in each csv file

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no)
);

select * from employees

-- Create table departments

DROP TABLE departments

CREATE TABLE departments (
  dept_no VARCHAR(10),
  dept_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (dept_no)
);

select * from departments

--Create table dept_emp
-- The dept_emp table is many-many relationship, so two primary keys are needed
DROP TABLE dept_emp

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no))

select * from dept_emp


-- Create table dept_managers
-- The dept_manager table is many-many relationship, so two primary keys are needed
DROP TABLE dept_managers

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no))
	
	
select * from dept_managers

--Creating salaries table

DROP TABLE salaries

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary BIGINT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

select * from salaries


--Creating titles table

DROP TABLE titles

--Changed title_id to emp_title_id to match the employees file
CREATE TABLE titles (
	emp_title_id VARCHAR(20) NOT NULL,
	title VARCHAR (40),
	PRIMARY KEY (emp_title_id)
		);

select * from titles

--Attempted forever to add this foreign key to employees.  Even tried using the option for creating a Constraint
--Within PGAdmin.  Finally shortent the contstraint name to just a few characters after hours for f cursewording with it
--and get the "Query returned successfully in 142 msec.
"
ALTER TABLE employees ADD CONSTRAINT distfk FOREIGN KEY (emp_title_id) REFERENCES titles (emp_title_id);

--Checking the employees table now

select * from employees


--Checking Tables after dataload
select * from employees

select * from departments

select * from dept_emp

select * from dept_manager

select * from salaries

select * from titles