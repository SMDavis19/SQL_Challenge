/*1. List the following details of each employee: 
employee number, last name, first name, sex, and salary.*/

SELECT "emp_no","last_name","first_name","sex"
FROM "Employees";

/*2. List first name, last name, and hire date for employees who were hired in 1986.*/

SELECT "last_name","first_name"
FROM "Employees"
WHERE extract(year from hire_date) = 1986;

/*3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.*/

SELECT "Dept_manager".dept_no,"dept_name","Dept_manager".emp_no,"last_name","first_name"
FROM "Departments"
INNER JOIN "Dept_manager" ON 
"Departments".dept_no = "Dept_manager".dept_no
INNER JOIN "Employees" ON 
"Dept_manager".emp_no = "Employees".emp_no

/*4.List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/

SELECT "Employees".emp_no,"last_name","first_name","dept_name"
FROM "Employees"
INNER JOIN "Dept_emp" ON
"Employees".emp_no = "Dept_emp".emp_no
INNER JOIN "Departments" ON
"Dept_emp".dept_no = "Departments".dept_no

/*5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT "first_name","last_name","sex"
FROM "Employees"
WHERE "first_name" LIKE 'Hercule%'
AND "last_name" LIKE 'B%'

/*6. List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
SELECT "Employees".emp_no,"last_name","first_name","dept_name"
FROM "Employees"
INNER JOIN "Dept_emp" ON
"Dept_emp".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON 
"Departments".dept_no = "Dept_emp".dept_no
WHERE "Departments".dept_name = 'Sales'

/*7. List all employees in the Sales and Development departments, including their 
employee number, last name, first name, and department name.*/

SELECT "Employees".emp_no,"first_name","dept_name"
FROM "Employees"
INNER JOIN "Dept_emp" ON
"Employees".emp_no="Dept_emp".emp_no
INNER JOIN "Departments" 
ON "Dept_emp".dept_no="Departments".dept_no
WHERE "Departments".dept_name IN ('Sales','Development')

/*8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/

SELECT "last_name", COUNT("last_name")
FROM "Employees"
GROUP BY "last_name"
ORDER BY COUNT ("last_name") DESC
