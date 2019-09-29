-- Data Engineering
create table departments (
	dept_no Varchar(10) not null primary key,
    dept_name Varchar(50) not null
);

create table employees (
    emp_no Integer not null primary key,
    birth_date Date not null,
    first_name Varchar(50) not null,
    last_name Varchar(50) not null,
    gender Varchar(1) not null,
    hire_date Date not null
);

create table dept_emp (
    emp_no Integer not null,
    dept_no Varchar(10) not null,
    from_date Date not null,
    to_date Date not null,
	constraint dept_emp_pkey primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

create table dept_manager (
    dept_no Varchar(10) not null,
    emp_no Integer not null,
    from_date Date not null,
    to_date Date not null,
	constraint dept_manager_pkey primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

create table salaries (
    emp_no Integer not null,
    salary Integer not null,
    from_date Date not null,
    to_date Date not null,
	constraint salaries_pkey primary key (emp_no, salary),
    foreign key (emp_no) references employees(emp_no)
);

create table titles (
    emp_no Integer not null,
    title Varchar(50) not null,
    from_date Date not null,
    to_date Date not null,
	constraint titles_pkey primary key (emp_no, from_date),
	foreign key (emp_no) references employees(emp_no)
);