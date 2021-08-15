use employees;
select * from employees;
show tables;
desc titles;
select Count(title) as "Number with title", title from titles GROUP BY title;

select employees.birth_date, titles.title FROM employees INNER JOIN titles ON titles.emp_no = employees.emp_no having birth_date > '1965-01-01' union all SELECT Count(title) as "Number of Employees with each title", title from titles GROUP BY title;

select count(title) as "Number of Employees holding each title", titles.title FROM titles
INNER JOIN employees ON titles.emp_no = employees.emp_no
where birth_date > '1965-01-01' GROUP BY titles.title;

desc salaries;

select title as "job title", avg(salary) as "average salary" from titles
inner join salaries on titles.emp_no = salaries.emp_no group by title;

desc departments;
select * from departments;
desc dept_emp;

select d.dept_name as "Markteting", sum(s.salary) as "total spent" from departments d
inner join dept_emp de on de.dept_no = d.dept_no 
inner join salaries s on s.emp_no = de.emp_no
where d.dept_name = 'Marketing' and year(s.from_date) >='1990-01-01' and year(s.to_date) < '1992-01-01'
group by d.dept_name;
