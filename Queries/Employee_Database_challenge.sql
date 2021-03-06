-- Create Departments Table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- Create Employees Table 
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

-- Create Titles Table 
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

-- Create Department Employee Table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Deliverable 1: The Number of Retiring Employees by Title.

-- Retrieve the required columns from the employees and titles table.
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

-- Use Dictinct with Orderby to remove duplicate rows.
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of employees by their most recent title.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT(emp_no) DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program.

SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
LEFT JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;

