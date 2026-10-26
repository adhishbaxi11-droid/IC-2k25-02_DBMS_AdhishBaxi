1. Number of distinct jobs available
SELECT COUNT(DISTINCT job_id) AS number_of_jobs
FROM employees;

2. Total salaries payable
SELECT SUM(salary) AS total_salary
FROM employees;

3. Minimum salary
SELECT MIN(salary) AS minimum_salary
FROM employees;

4. Maximum salary of a Programmer
SELECT MAX(salary) AS maximum_programmer_salary
FROM employees
WHERE job_id = 'IT_PROG';

5. Average salary and employee count in department 90
SELECT AVG(salary) AS average_salary, COUNT(*) AS employee_count
FROM employees
WHERE department_id = 90;

6. Highest, lowest, total, and average salary
SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM employees;

7. Number of employees for each job
SELECT job_id, COUNT(*) AS employee_count
FROM employees
GROUP BY job_id;

8. Difference between highest and lowest salaries
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employees;

9. Manager ID and lowest salary under each manager
SELECT manager_id, MIN(salary) AS lowest_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

10. Department ID and total salary payable in each department
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

11. Average salary for each job ID, excluding Programmer
SELECT
    job_id,
    AVG(salary) AS average_salary
FROM employees
WHERE job_id <> 'IT_PROG'
GROUP BY job_id;

12. Total, maximum, minimum, and average salary job-wise in department 90
SELECT
    job_id,
    SUM(salary) AS total_salary,
    MAX(salary) AS maximum_salary,
    MIN(salary) AS minimum_salary,
    AVG(salary) AS average_salary
FROM employees
WHERE department_id = 90
GROUP BY job_id;

13. Job ID and maximum salary where maximum salary is at least 4000
SELECT
    job_id,
    MAX(salary) AS maximum_salary
FROM employees
GROUP BY job_id
HAVING MAX(salary) >= 4000;

14. Average salary for departments with more than 10 employees
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;
