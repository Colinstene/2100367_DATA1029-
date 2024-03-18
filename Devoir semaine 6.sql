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


-- 4.Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo.
SELECT CONCAT(e.fname, ' ', e.lname) AS 'Full Name', e.salary        
FROM employees e
WHERE e.salary > (SELECT salary FROM employees WHERE lname = 'Zongo' AND fname = 'Norbert');