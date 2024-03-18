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


-- 9.Les auteurs des 5 livres les plus vendus.
SELECT a.au_id, CONCAT(a.au_fname, ' ', a.au_lname) AS author_name, COUNT(s.title_id) AS total_sales
FROM titles t
INNER JOIN sales s ON t.title_id = s.title_id
INNER JOIN titleauthor ta ON t.title_id = ta.title_id
INNER JOIN authors a ON ta.au_id = a.au_id
GROUP BY a.au_id, author_name
ORDER BY total_sales DESC
LIMIT 5;


-- 10--Prix moyens des livres par maisons d’édition.
SELECT p.pub_id, p.pub_name, AVG(t.price) AS average_price
FROM titles t
INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY p.pub_id, p.pub_name
ORDER BY average_price DESC;

-- 11-Les 3 auteurs ayant les plus de livres
SELECT authors.au_id, au_fname, au_lname, COUNT(*) AS book_count 
FROM titleauthor 
JOIN authors ON titleauthor.au_id = authors.au_id 
GROUP BY authors.au_id, au_fname, au_lname 
ORDER BY book_count DESC 
LIMIT 3;

