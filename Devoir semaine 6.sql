use labrary;
-- 1  Noms complets des employés de plus haut grade par employeurs.
SELECT e.fname, e.lname, j.job_desc, p.pub_name AS employer
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN publishers p ON e.pub_id = p.pub_id
JOIN (
  SELECT pub_id, MAX(job_lvl) AS max_job_lvl
  FROM employees
  GROUP BY pub_id
) em ON e.pub_id = em.pub_id AND e.job_lvl = em.max_job_lvl
ORDER BY employer;


-- 2.Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo.
SELECT CONCAT(e.fname, ' ', e.lname) AS 'Full Name', e.salary        
FROM employees e
WHERE e.salary > (SELECT salary FROM employees WHERE lname = 'Zongo' AND fname = 'Norbert');

-- 3.Noms complets des employés des éditeurs canadiens.
select concat(e.fname, ' ',e.lname) AS 'Full Name', p.pub_name AS employer 
from  employees e 
inner join publishers p ON e.pub_id=p.pub_id
where P.country = 'Canada';

-- 4-- Noms complets des employés qui ont un manager

SELECT CONCAT(e.fname, ' ', e.lname) AS 'Full Name'
FROM employees e
WHERE e.job_id IN (
  SELECT job_id
  FROM jobs
  WHERE job_lvl < max_lvl
);

-- 5 Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur.

SELECT CONCAT(e.fname, ' ', e.lname) AS 'Full Name', e.salary, e.pub_id, AVG(e2.salary) AS 'Average Salary'
FROM employees e
JOIN employees e2 ON e.pub_id = e2.pub_id
GROUP BY e.pub_id, e.salary, e.emp_id
HAVING e.salary > AVG(e2.salary);


-- 6 Noms complets des employés qui ont le salaire minimum de leur grade

SELECT CONCAT(e.fname, ' ', e.lname) AS 'Full Name', e.salary, j.job_desc, j.min_lvl, j.max_lvl
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (
  SELECT MIN(e2.salary)
  FROM employees e2
  WHERE e2.job_id = e.job_id
);


-- 7.De quels types sont les livres les plus vendus?
SELECT t.type
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.type
ORDER BY SUM(s.qty) DESC;

-- 8.Pour chaque boutique, les 2 livres les plus vendus et leurs prix.
SELECT s.stor_name AS 'Store Name', t.title AS 'Title', t.price AS 'Price'
FROM stores s
JOIN (
  SELECT stor_id, title_id, SUM(qty) AS total_qty
  FROM sales
  GROUP BY stor_id, title_id
  ORDER BY total_qty DESC, stor_id
) sq ON s.stor_id = sq.stor_id
JOIN titles t ON sq.title_id = t.title_id
GROUP BY s.stor_id, t.title_id
ORDER BY s.stor_id, total_qty DESC
LIMIT 2;