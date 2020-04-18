# 2.Find the top 10 family names(last_name) in the company -------------------------------------------------------------------------

SELECT DISTINCT last_name FROM employees LIMIT 10;
/*
+-----------+
| last_name |
+-----------+
| Facello   |
| Simmel    |
| Bamford   |
| Koblick   |
| Maliniak  |
| Preusig   |
| Zielinski |
| Kalloufi  |
| Peac      |
| Piveteau  |
+-----------+

*/


# 3.List the number of Engineers each department has -------------------------------------------------------------------------


SELECT COUNT(*)
FROM dept_emp,titles
WHERE dept_emp.emp_no=titles.emp_no AND titles.title='Engineer' AND dept_emp.dept_no='d001'; 
#Like wise by changing dept_emp.dept_no from d001 to d009 


/*
#From MARKETING Department
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
#From FINANCE Department
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
#From HUMAN RESOURCE Departmen
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
#From PRODUCTION Department
+----------+
| COUNT(*) |
+----------+
|    14653 |
+----------+
#From DEVELOPMENT Department
+----------+
| COUNT(*) |
+----------+
|    17017 |
+----------+
#From QUALITY MANAGEMENT Department
+----------+
| COUNT(*) |
+----------+
|     4092 |
+----------+
#From SALES Department
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
#From RESEARCH Department
+----------+
| COUNT(*) |
+----------+
|      876 |
+----------+
#From COUSTOMER SERVICE Department
+----------+
| COUNT(*) |
+----------+
|      720 |
+----------+

*/


# 4.List all the female employees who are department managers and have worked as a senior engineer. -------------------------------------------------------------------------

SELECT employees.first_name
FROM employees
JOIN dept_manager ON (employees.emp_no = dept_manager.emp_no)
JOIN titles ON (employees.emp_no = titles.emp_no)
WHERE employees.sex='F' AND titles.title='Senior Engineer';
/*
+------------+
| first_name |
+------------+
| Rosine     |
| Sanjoy     |
+------------+
*/


# 5.Display the departments and titles of employees who has a salary greater than 115000. Display how many of such employees work for each department

SELECT DISTINCT departments.dept_name,titles.title
FROM titles
JOIN dept_emp ON titles.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
JOIN salaries ON dept_emp.emp_no=salaries.emp_no
WHERE salaries.salary>11500;
/*
+--------------------+--------------------+
| dept_name          | title              |
+--------------------+--------------------+
| Sales              | Staff              |
| Development        | Engineer           |
| Development        | Senior Engineer    |
| Human Resources    | Senior Staff       |
| Human Resources    | Staff              |
| Production         | Engineer           |
| Production         | Senior Engineer    |
| Marketing          | Senior Staff       |
| Marketing          | Staff              |
| Sales              | Senior Staff       |
| Customer Service   | Staff              |
| Development        | Assistant Engineer |
| Quality Management | Senior Engineer    |
| Production         | Assistant Engineer |
| Quality Management | Assistant Engineer |
| Production         | Technique Leader   |
| Research           | Staff              |
| Customer Service   | Senior Staff       |
| Quality Management | Engineer           |
| Research           | Senior Staff       |
| Production         | Senior Staff       |
| Production         | Staff              |
| Research           | Engineer           |
| Research           | Senior Engineer    |
| Development        | Senior Staff       |
| Development        | Staff              |
| Development        | Technique Leader   |
| Finance            | Senior Staff       |
| Finance            | Staff              |
| Customer Service   | Senior Engineer    |
| Customer Service   | Engineer           |
| Customer Service   | Assistant Engineer |
| Quality Management | Technique Leader   |
| Research           | Assistant Engineer |
| Research           | Technique Leader   |
| Customer Service   | Technique Leader   |
+--------------------+--------------------+
*/
SELECT DISTINCT departments.dept_name,COUNT(*) AS employees
FROM titles
JOIN dept_emp ON titles.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
JOIN salaries ON dept_emp.emp_no=salaries.emp_no
WHERE salaries.salary>11500
GROUP BY departments.dept_name;

/*
+--------------------+-----------+
| dept_name          | employees |
+--------------------+-----------+
| Sales              |    540973 |
| Development        |    861645 |
| Human Resources    |    182771 |
| Production         |    742196 |
| Marketing          |    207867 |
| Customer Service   |    242207 |
| Quality Management |    201700 |
| Research           |    217352 |
| Finance            |    181324 |
+--------------------+-----------+
*/


# 6.Assume that the company wants to reward the most senior employees who are morethan 50 years of age and have contributed to the company 
# for more than 10 years. Who are on the list? Display employee name, age, years of service in the company and joined date.

SELECT employees.first_name, (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)) AS age, (YEAR(CURRENT_TIMESTAMP) - YEAR(hire_date)) AS worked, employees.hire_date 
FROM employees
WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date))>50
AND (YEAR(CURRENT_TIMESTAMP) - YEAR(hire_date))>10;

/*
Only few entries
+----------------+------+--------+------------+
| first_name     | age  | worked | hire_date  |
+----------------+------+--------+------------+
| Georgi         |   67 |     34 | 1986-06-26 |
| Bezalel        |   56 |     35 | 1985-11-21 |
| Parto          |   61 |     34 | 1986-08-28 |
| Chirstian      |   66 |     34 | 1986-12-01 |
| Kyoichi        |   65 |     31 | 1989-09-12 |
| Anneke         |   67 |     31 | 1989-06-02 |
| Tzvetan        |   63 |     31 | 1989-02-10 |
| Saniya         |   62 |     26 | 1994-09-15 |
| Sumant         |   68 |     35 | 1985-02-18 |
| Duangkaew      |   57 |     31 | 1989-08-24 |
| Mary           |   67 |     30 | 1990-01-22 |
| Patricio       |   60 |     28 | 1992-12-18 |
| Eberhardt      |   57 |     35 | 1985-10-20 |
| Berni          |   64 |     33 | 1987-03-11 |
| Guoxiang       |   61 |     33 | 1987-07-02 |
| Kazuhito       |   59 |     25 | 1995-01-27 |
| Cristinel      |   62 |     27 | 1993-08-03 |
| Kazuhide       |   66 |     33 | 1987-04-03 |
| Lillian        |   67 |     21 | 1999-04-30 |
| Mayuko         |   68 |     29 | 1991-01-26 |

*/


# 7.Find all the names (first name + last name) of employees in the database who do not work in the Human Resources department. Assume that all the people work for exactly one department.--------------------

SELECT DISTINCT CONCAT(employees.first_name ,' ', employees.last_name) AS names 
FROM employees 
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no 
WHERE NOT dept_emp.dept_no='d003';

/*
Only few entries
+----------------------+
| names                 |
+----------------------+
| Cristinel Bouloucos  |
| Georgy Dredge        |
| Berhard McFarlin     |
| Lunjin Giveon        |
| Yucel Auria          |
| Aleksandar Ananiadou |
| Xiping Klerer        |
| Karoline Cesareni    |
| Nikolaos Llado       |
| Susanna Vesel        |


*/



# 8.Find the names of all employees in the database who earn more than every employee in the Finance department. Assume that all people work for at most one company


SELECT DISTINCT employees.first_name,employees.last_name
FROM employees
JOIN salaries on employees.emp_no=salaries.emp_no
WHERE salaries.salary > 

(SELECT MAX(salaries.salary)
 FROM salaries
 JOIN dept_emp on salaries.emp_no=dept_emp.emp_no
 WHERE dept_emp.dept_no='d002')

/*
+------------+--------------+
| first_name | last_name    |
+------------+--------------+
| Charmane   | Griswold     |
| Boalin     | Rosen        |
| Nikolaus   | Businaro     |
| JoAnne     | Matheson     |
| Wonhee     | Pagter       |
| Tadanori   | Sudbeck      |
| Weicheng   | Hatcliff     |
| Chaitali   | Baik         |
| Mitsuyuki  | Stanfel      |
| Dines      | Giaccio      |
| Arnd       | Junot        |
| Heping     | Brender      |
| Sanjai     | Luders       |
| Honesty    | Mukaidono    |
| Honglan    | Otillio      |
| Satoru     | Gruenwald    |
| Rance      | Chinin       |
| Eberhardt  | Gubsky       |
| Weijing    | Chenoweth    |
| Florina    | Tchuente     |
| Jungsoon   | Brendel      |
| Shin       | Birdsall     |
| Mohammed   | Moehrke      |
| Eldridge   | Heiserman    |
| Huiqun     | Birke        |
| Leaf       | Menyhert     |
| Zhanqiu    | Muntz        |
| Guenter    | Ranai        |
| Seongbin   | Mitsuhashi   |
| Qingxiang  | Piancastelli |
| Izaskun    | Wissmann     |
| Akemi      | Warwick      |
| Masato     | Heering      |
| Ghassan    | Birta        |
| Taiji      | Malinowski   |
| Lidong     | Meriste      |
+------------+--------------+
*/



# 9.Find the names of all employees who earn more than the average salary of all employees of their company.
SELECT DISTINCT employees.first_name,employees.last_name
FROM employees
JOIN salaries on employees.emp_no=salaries.emp_no
WHERE salaries.salary > 

(SELECT AVG(salaries.salary)
 FROM salaries)

/*
Only few entries
+----------------+------------------+
| first_name     | last_name        |
+----------------+------------------+
| Krassimir      | Linares          |
| Wonhee         | Perl             |
| Nidapan        | Provine          |
| Margareta      | Petersohn        |
| Urs            | Krone            |
| Franziska      | Marrevee         |
| Eishiro        | Garigliano       |
| Mary           | Gente            |
| Chinhyun       | Hiyoshi          |
| Shmuel         | Sudkamp          |
*/

#10 Compute the difference between the average salary of a Senior Engineer and the average salary of all employees (including Senior Engineers)
SELECT (
    (SELECT AVG(salaries.salary) FROM salaries 
    INNER JOIN titles 
    ON titles.emp_no = salaries.emp_no
    WHERE titles.title = 'Senior Engineer'

    )-
    (SELECT AVG(salaries.salary) FROM salaries)
) AS Difference;

/*
+------------+
| Difference |
+------------+
| -3297.7505 |
+------------+
*/

#11 Create a view current dept emp (emp no, fromdate, todate) to show only the current
#   department for each employee. You may have to use two views for this.

CREATE VIEW CURRENT_DE AS
SELECT dept_emp.emp_no,dept_emp.from_date,dept_emp.to_date, dept_emp.dept_no
FROM dept_emp
WHERE dept_emp.to_date>DATE(CURRENT_TIMESTAMP);

CREATE VIEW CURRENT_EMP AS
SELECT CURRENT_DE.emp_no, CURRENT_DE.from_date, CURRENT_DE.to_date, departments.dept_name 
FROM CURRENT_DE 
INNER JOIN departments ON departments.dept_no = CURRENT_DE.dept_no;

SELECT * FROM CURRENT_EMP;

/*
Only few entries
+--------+------------+------------+--------------------+
| emp_no | from_date  | to_date    | dept_name          |
+--------+------------+------------+--------------------+
|  10017 | 1993-08-03 | 9999-01-01 | Marketing          |
|  10058 | 1988-04-25 | 9999-01-01 | Marketing          |
|  10140 | 1991-03-14 | 9999-01-01 | Marketing          |
|  10228 | 1993-01-28 | 9999-01-01 | Marketing          |
|  10239 | 1996-05-04 | 9999-01-01 | Marketing          |
|  10340 | 1988-03-30 | 9999-01-01 | Marketing          |
|  10353 | 1989-08-24 | 9999-01-01 | Marketing          |
|  10367 | 1991-06-24 | 9999-01-01 | Marketing          |
*/

#12 Write a normal SQL query to do the above task in problem 11

SELECT dept_emp.emp_no,dept_emp.from_date,dept_emp.to_date,departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_emp.to_date>DATE(CURRENT_TIMESTAMP);

#13 Create a trigger to print salary changes of employees. For example, if you enter an SQL
# statement such as UPDATE salaries SET salary = salary + 1000 WHERE emp no =
# 1500, the trigger should fire once for each row that is updated and it should print the new
# and old salaries, and the difference.


DROP TRIGGER IF EXISTS tr_update;
DELIMITER |
CREATE TRIGGER tr_update
BEFORE UPDATE ON salaries
FOR EACH ROW BEGIN
    SET @op = CONCAT('emp_no:', OLD.emp_no, ' new_salary:', NEW.salary, ' old_salary:', OLD.salary, ' difference:', NEW.salary-OLD.salary);
    SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = @op;
END|
DELIMITER ;

#14 Create a trigger that will cause an error when an update occurs that would result in a
# salary increase greater than 10% of the current salary.

DROP TRIGGER IF EXISTS tr_increment;
DELIMITER |
CREATE TRIGGER tr_increment
BEFORE UPDATE ON salaries
FOR EACH ROW BEGIN

    IF (NEW.salary > 1.1*OLD.salary) 
    	THEN
        SET @error = 'salary increase greater than 10% of the current salary';
        SIGNAL SQLSTATE '03000' SET MESSAGE_TEXT = @error;
    END IF;

END|
DELIMITER ;