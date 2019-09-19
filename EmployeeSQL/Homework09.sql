-- Data Engineering
create table departments (
	dept_no Varchar(10) not null primary key,
    dept_name Varchar(50) not null
);

create table dept_emp (
    emp_no Integer not null,
    dept_no Varchar(10) not null,
    from_date Date not null,
    to_date Date not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

create table dept_manager (
    dept_no Varchar(10) not null,
    emp_no Integer not null,
    from_date Date not null,
    to_date Date not null,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

create table employees (
    emp_no Integer not null primary key,
    birth_date Date not null,
    first_name Varchar(50) not null,
    last_name Varchar(50) not null,
    gender Varchar(1) not null,
    hire_date Date not null
);

create table salaries (
    emp_no Integer not null,
    salary Integer not null,
    from_date Date not null,
    to_date Date not null,
    foreign key (emp_no) references employees(emp_no)
);

create table titles (
    emp_no Integer not null,
    title Varchar(50) not null,
    from_date Date not null,
    to_date Date not null,
	foreign key (emp_no) references employees(emp_no)
);

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
select employees.last_name, count(employees.last_name)
from employees
group by employees.last_name
order by employees.last_name desc
	