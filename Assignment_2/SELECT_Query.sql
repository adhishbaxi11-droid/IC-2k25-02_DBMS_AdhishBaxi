1. 'Display names with column aliases.'
SELECT first_name AS "First Name", last_name AS "Last Name"
FROM employees;

2. 'Unique department IDs'
SELECT DISTINCT department_id
FROM employees;

3. 'All employee details ordered by first name, descending.'
SELECT *
FROM employees
ORDER BY first_name DESC;

4. 'Names, salary, and PF (15% of salary)'
SELECT first_name, last_name, salary, salary * 0.15 AS PF
FROM employees;

5. 'Employee ID, names, and salary in ascending order of salary.'
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary ASC;

6. 'Total salaries payable to employees'
SELECT SUM(salary) AS total_salary
FROM employees;

7. 'Maximum and minimum salary'
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees;

8. 'Average salary and number of employees'
SELECT AVG(salary) AS average_salary, COUNT(*) AS number_of_employees
FROM employees;

9. 'Number of employees working with the company'
SELECT COUNT(*) AS total_employees
FROM employees;

10. 'Number of distinct jobs.'
SELECT COUNT(DISTINCT job_id) AS number_of_jobs
FROM employees;

11. 'First names in upper case'
SELECT UPPER(first_name) AS first_name
FROM employees;

12. 'First 3 characters of first name.'
SELECT SUBSTRING(first_name, 1, 3) AS first_name_short
FROM employees;

13. 'Calculate an arithmetic expression (171 × 214 + 625)'
A standalone calculation — does not require any table, so SELECT is used plainly.
SELECT 171 * 214 + 625 AS result;

14. 'Full employee names (e.g. "Ellen Abel")'
SELECT CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees;

15. 'First name with white space removed from both sides'
SELECT TRIM(first_name) AS first_name
FROM employees;

16. 'Length of first name and last name'
SELECT first_name, LENGTH(first_name) AS first_name_length,
       last_name, LENGTH(last_name) AS last_name_length
FROM employees;

17. 'Check if first_name contains numbers'
SELECT first_name
FROM employees
WHERE first_name REGEXP '[0-9]';

18. 'Select the first 10 records'
SELECT *
FROM employees
LIMIT 10;

19. 'Monthly salary (rounded to 2 decimal places)'
SELECT employee_id, first_name, last_name,
       ROUND(salary / 12, 2) AS monthly_salary
FROM employees;
