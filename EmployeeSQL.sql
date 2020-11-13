-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, 
emp.last_name,
emp.first_name,
emp.sex,
sal.salary
FROM employees as emp
LEFT JOIN salaries as sal
ON emp.emp_no = sal.emp_no
ORDER BY emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT deptmgr.dept_no, 
dept.dept_name,
deptmgr.emp_no,
emp.last_name, 
emp.first_name
FROM dept_manager as deptmgr
LEFT JOIN department as dept
ON deptmgr.dept_no = dept.dept_no
LEFT JOIN employees as emp
ON deptmgr.emp_no = emp.emp_no
ORDER BY emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
emp.emp_no,
emp.last_name,
emp.first_name,
dept_emp.dept_no,
dept.dept_name
FROM employees as emp 
INNER JOIN dept_emp ON emp.emp_no=dept_emp.emp_no
INNER JOIN department as dept ON dept.dept_no=dept_emp.dept_no
order by emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name,
dept_emp.dept_no
FROM employees as emp
LEFT JOIN dept_emp 
ON emp.emp_no=dept_emp.emp_no
INNER JOIN department as dept
ON dept.dept_no=dept_emp.dept_no
WHERE dept.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name,
dept_emp.dept_no
FROM employees as emp 
LEFT JOIN dept_emp 
ON emp.emp_no=dept_emp.emp_no
INNER JOIN department as dept
ON dept.dept_no=dept_emp.dept_no
WHERE dept.dept_name in ('Sales', 'Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
