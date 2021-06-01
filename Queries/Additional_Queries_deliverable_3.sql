-- Deliverable 3: Additional queries that may provide more insight into the upcoming "silver tsunami".

-- Use Distinct ON with Order By to remove duplicate rows.
SELECT DISTINCT ON (ut.emp_no) ut.emp_no,
	d.dept_name
INTO roles_dept
FROM unique_titles as ut
INNER JOIN dept_emp as de
ON (ut.emp_no = de.emp_no) 
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY (ut.emp_no);

-- Retrieving the number of roles that need to be filled in each department.
SELECT COUNT(emp_no), dept_name
INTO roles_to_be_filled
FROM roles_dept
GROUP BY (dept_name)
ORDER BY COUNT(emp_no) DESC;

-- Use Distinct ON with Order By to remove duplicate rows.
SELECT DISTINCT ON (me.emp_no) me.emp_no,
	d.dept_name
INTO mentors_dept
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de
ON (me.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY (me.emp_no);

-- Retrieving the number of retirement-ready employees in the departments eligible for mentorship.
SELECT COUNT(emp_no), dept_name
INTO mentors_retirement_dept
FROM mentors_dept
GROUP BY (dept_name)
ORDER BY COUNT(emp_no) DESC;