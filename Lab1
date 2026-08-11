1. Create a simple table "countries".
--> create table countries(column_id int, country_name varchar(30), region_id int);
Output: Query OK, 0 rows affected (0.25 sec)

2. Create a simple table "countries" that already exists.
--> create table countries(column_id int, country_name varchar(30), region_id int);
Output: ERROR 1050 (42S01): Table 'countries' already exists

3. Create structure of the table dup_countries similar to countries. (Only Structure)
--> create table dup_countries like countries;
Output: Query OK, 0 rows affected (0.04 sec)

4. Create a copy of countries including structure and data both in a table named dup_countries.
--> create table dup_countries as select * from countries;
Output: Query OK, 0 rows affected (0.03 sec)
        Records: 0  Duplicates: 0  Warnings: 0

5. Create table countries set a constraint NULL.
--> create table countries(column_id int not null, country_name varchar(30), region_id int not null);
Output: Query OK, 0 rows affected (0.02 sec)

6. Create a table "jobs" with columns job_id, job_title, min_salary, max_salary where max salary cannot exceed 25000.
--> create table jobs(job_id int, job_title varchar(20), min_salary float, max_salary float, check (max_salary <= 25000));
Output: Query OK, 0 rows affected (0.05 sec)

7. Create a table countries where only "India" "Italy" "China" can be entered in the table.
--> create table countries(column_id int, country_name varchar(30), region_id int, check (country_name IN ("Italy", "India", "China")));
Output: Query OK, 0 rows affected (0.02 sec)
