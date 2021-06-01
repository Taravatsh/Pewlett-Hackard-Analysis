# Pewlett-Hackard-Analysis

## Overview of Project

In this project, Pewlett Hackard which is a large company that has been boasting several thousand employees is looking toward the future for having a plan ready in hand for staff loss as baby boomers are beginning to retire at a rapid rate.

### Purpose

The purpose of this project is to assist Bobby, who is an up and coming HR analyst of Pewlett Hackard, to complete building an employee database so that Pewlett Hackard is prepared for "silver tsunami" as many current employees are reaching retirement age. Therefore, using SQL queries, knowledge of data modeling, engineering and analytical skills two technical analysis are required to be carried out for completing the employee database of Pewlett Hackard. These two technical analysis are as follows:

- Determining the number of retiring employees per title.
- Identifying employees who are eligible to participate for the mentorship program.

## Results

This section of the report focuses on the aforementioned technical analysis results achieved and displayed in form of tables using the constructed SQL queries.

### Number of Retiring Employees by Title

In this section of the project, retirement title table was created initially holding the titles of current employees at Pewlett Hackard who were born between January 1, 1952 and December 31, 1955. Since some employees had multiple titles in the database due to promotion, **DISTINCT ON** statement was then used for creating a table containing only the most recent titles of the employees as depicted in the figure below.
<br>
![Unique Titles Table](Resources/Unique_titles_table.png)

After achieveing the unique titles table, **COUNT()** function was used for creating the final table that had the number of retirement ready employees by their most recent job title as demonstrated in the figure below.

<div align="center">

![Retiring Titles Table](Resources/Retiring_titles_table.png)
</div>

Looking at the figure illustarted above, the following results can be observed:

- A total of **90,398** employees are eligible for retirement which means Pewlett Hackard has to spend lots of time and effort in filling those vacancies.

- Majority of employees are retiring from the main key titles of the company in terms **Senior Engineers** and **Senior Staffs**. In other words, about **64%** of retiring employees are having senior titles. Thus, recuriting team of Pewlett Hackard should definitely take an early step in having those positions filled again since a significantlty valuable portion of the company is going to be vacant.

- Only two employees are retiring from the management title which would be a positive point for Pewlett Hackard as managers are highly needed in helping the company continue running and being financially stable specially when there will be shortage of work force.

### Mentorship Eligible Employees

In this section of the report mentorship-eligibility table was created holding the data on current employees who were born between January 1, 1965 and December 31, 1965 as demonstarted in the figure below.

![Mentorship Eligibility Table](Resources/Mentorship_eligibility_table.png)

Looking at the mentorship eligibility table, the following was observed:

- Majority of employees who are eligible for mentorship are having senior titles which is definitely one of the most important titles in counseling the next generation of Pewlett Hackard employees.


## Summary

Pewlett Hackard should be prepared for the coming "silver tsunami" as the baby boomers are reaching their senior years and hence becoming eligible for retirement. As a result of this, additional tables were created using SQL quesries for providing more insights into the upcoming "silver tsunami".

### Number of Roles to be Filled

Table displayed below demonstrates the number of roles that are required to be filled per department as the "silver tsunami" begins to make an impact. As it can be seen a total of **90,398** roles are required to get filled as soon as the employees retire, in which bulk of retiring employees are from the Development and Production departments. 

As a result of this, Pewlett Hackard will be having significantly large number of vacancies soon and this requires a lot of effort to get enough work force on time and fill those roles again. Hence, it is recommended that Pewlett Hackard restructure the company departments or transfer some of the roles to the existing staff to overcome the challenge of looking for employees and not requiring as many employees to continue their operation and not facing a down time.

<div align="center">

![Roles to be filled per Department](Resources/Roles_to_filled_per_dept_table.png)
</div>

### Retirement-ready Mentors

Table below depicts the retirement-ready employees by department who are eligible to mentor the next generation of Pewlett Hackard. As it is evident from the table, total of **1,549** qualified retirement-ready employees exist in the departments. Hence, there would not be enough number of qualified mentors for the next generation of Pewlett Hackard employees as they are very few comparing to the number of employees who are retiring. However, if Pewlett Hackard attempts to reduce the number of employees needed in the future and fills less percentage of vacanies then this would increase the chance of having enough mentors for the future generation of employees.

<div align="center">

![Retirement Ready Employees to Mentor](Resources/Retirement_ready_mentors_per_dept_table.png)
</div>