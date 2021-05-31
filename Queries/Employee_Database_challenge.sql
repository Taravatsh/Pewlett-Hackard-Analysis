-- Creating Departments Table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- Creating Employees Table 
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
-- Confirming Employees table has been imported 
SELECT * FROM employees;

-- Creating Titles Table 
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

-- Confirming Titles Table has been imported
SELECT * FROM titles;

-- Creating Department Employee Table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Confirming Titles Table has been imported
SELECT * FROM dept_emp;

-- Deliverable 1: The Number of Retiring Employees by Title

-- Creating a Retirement Titles table that holds all the titles
-- of current employees who were born between January 1, 1952 and December 31, 1955
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of employees by their most recent title
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT(emp_no) DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program

-- Creating a Mentorship Eligibility table that holds the employees
-- who are eligible to participate in a mentorship program

SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
INNER JOIN dept_emp as de
ON em.emp_no = de.emp_no
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE de.to_date = ('9999-01-01')
AND em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY em.emp_no;

-- Additional queries that may provide more insight into the upcoming "silver tsunami"
SELECT COUNT(emp_no) 
FROM unique_titles;
----
-- Retrieving the number of employees eligible for mentorship
SELECT DISTINCT ON (ut.emp_no) ut.emp_no,
d.dept_name
INTO mentorship
FROM unique_titles as ut
INNER JOIN dept_emp as de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

SELECT COUNT(emp_no), dept_name
FROM mentorship
GROUP BY dept_name
ORDER BY COUNT DESC;

-- Retrieving the number of employees eligible for mentorship
SELECT COUNT(emp_no), title
-- INTO mentorship_counts
FROM mentorship_eligibility 
GROUP BY title
ORDER BY COUNT(emp_no) DESC;


-- Retrieving the number of employees eligible for mentorship
SELECT COUNT(me.emp_no), d.dept_name
-- INTO mentorship_counts
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de
ON (me.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
GROUP BY dept_name
ORDER BY COUNT(me.emp_no) DESC;
--

-- Retrieving the number of employees eligible for mentorship
SELECT DISTINCT ON (me.emp_no) d.dept_name,
	me.emp_no
INTO mentorship_counts
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de
ON (me.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

SELECT COUNT(emp_no), dept_name
FROM mentorship_counts
GROUP BY dept_name
ORDER BY COUNT DESC;