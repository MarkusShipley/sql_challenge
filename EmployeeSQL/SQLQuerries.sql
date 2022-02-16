-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
;
--ASK MENTOR -- WHY WILL THESE NOT WORK?  NOTE, I COULD NOT LOAD DATA INTO DEPT_EMP AND DEPARTMENTS BECAUSE BOTH COLUMNS WERE FOREIGN KEYS
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, last_name, first_name
FROM dept_manager 
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no

--ASK MENTOR -- WHY WILL THESE NOT WORK?  NOTE, I COULD NOT LOAD DATA INTO DEPT_EMP AND DEPARTMENTS BECAUSE BOTH COLUMNS WERE FOREIGN KEYS
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--ASK MENTOR -- WHY WILL THESE NOT WORK?  NOTE, I COULD NOT LOAD DATA INTO DEPT_EMP AND DEPARTMENTS BECAUSE BOTH COLUMNS WERE FOREIGN KEYS
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Note: From loolking at the data, the department number of Sales department is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--NOTE: d007 and d005 are the department numbers of Sales and Development departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or departments.dept_no = 'd007';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;