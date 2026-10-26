1. Find Employees Earning More Than Employee Bull
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Bull'
);

2. Find Employees Working in the IT Department
SELECT first_name, last_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
);

3. Find Employees Who Have a Manager and Work in a USA-Based Department
SELECT first_name, last_name
FROM employees
WHERE manager_id IS NOT NULL
AND department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id = 'US'
    )
);

4. Find Employees Who Are Managers
SELECT first_name, last_name
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
);

5. Find Employees Earning More Than the Average Salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

6. Find Employees Earning the Minimum Salary for Their Job Grade
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
WHERE e.salary = j.lowest_sal;

7. Find IT Employees Earning More Than the Average Salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
AND department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
);

8. Find Employees Earning More Than Mr. Bell
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Bell'
);

9. Find Employees Earning the Minimum Salary in the Company
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

10. Employees Earning Above the Overall Average Salary
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

11. Employees Earning More Than Every Shipping Clerk
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE job_id = 'SH_CLERK'
)
ORDER BY salary ASC;

12. Employees Who Are Not Supervisors
SELECT
    first_name,
    last_name
FROM employees
WHERE employee_id NOT IN (
    SELECT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
);

13. Employee Details With Department Name
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

14. Employees Earning Above Their Department Average
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

15. Even-Numbered Employee Records
SELECT *
FROM (
    SELECT
        e.*,
        ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num
    FROM employees e
)
WHERE MOD(row_num, 2) = 0;

16. Fifth Maximum Salary
SELECT salary AS fifth_maximum_salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
WHERE salary_rank = 5;

17. Fourth Minimum Salary
SELECT salary AS fourth_minimum_salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary ASC) AS salary_rank
    FROM employees
)
WHERE salary_rank = 4;

18. Last 10 Employee Records
SELECT *
FROM (
    SELECT *
    FROM employees
    ORDER BY employee_id DESC
)
WHERE ROWNUM <= 10;

19. Departments With No Employees
SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

20. Three Maximum Salaries
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;

21. Three Minimum Salaries
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC
FETCH FIRST 3 ROWS ONLY;

22. Nth Maximum Salary
SELECT salary AS nth_maximum_salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
WHERE salary_rank = :n;
