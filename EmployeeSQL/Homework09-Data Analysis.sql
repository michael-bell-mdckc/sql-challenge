-- Data Analysis
-- One
select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

-- Two
select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary,
	employees.hire_date
from employees
join salaries
on employees.emp_no = salaries.emp_no
where employees.hire_date between '1986-01-01' and '1986-12-31';

--Three
select departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	dept_manager.from_date,
	dept_manager.to_date
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
	join employees
	on dept_manager.emp_no = employees.emp_no;

--Four
select employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
from dept_emp
join departments
on dept_emp.dept_no = departments.dept_no
	join employees
	on dept_emp.emp_no = employees.emp_no;

--Five
select employees.emp_no, 
	employees.last_name, 
	employees.first_name
from employees
where employees.last_name like 'B%' and employees.first_name = 'Hercules'
order by employees.last_name;

--Six
select employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
from dept_emp
join departments
on dept_emp.dept_no = departments.dept_no
	join employees
	on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales'
order by (employees.last_name, employees.first_name);

--Seven
select employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
from dept_emp
join departments
on dept_emp.dept_no = departments.dept_no
	join employees
	on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
order by (employees.last_name, employees.first_name);

--Eight
select employees.last_name, count (employees.last_name)
from employees
group by employees.last_name
order by employees.last_name desc;
	