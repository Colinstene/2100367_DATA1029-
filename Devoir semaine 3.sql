USE library;
-- Question 1: La liste des paires (auteur, éditeur) demeurant dans la même ville
-- SELECT au_id, pub_id
-- FROM authors
-- INNER JOIN publishers ON authors.city = publishers.city;

-- Question 2: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère
-- SELECT au_id, pub_id
-- FROM authors
-- LEFT JOIN publishers ON authors.city = publishers.city;

-- Question 3: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère.
-- SELECT au_id, pub_id
-- FROM authors
-- RIGHT JOIN publishers ON authors.city = publishers.city
-- WHERE publishers.city IS NOT NULL;
-- Question 4: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère.
-- SELECT au_id, pub_id
-- FROM authors
-- LEFT JOIN publishers ON authors.city = publishers.city
-- OR authors.city IS NULL OR publishers.city IS NULL;

-- Question 5: Effectif(nombre) d'employés par niveau d'expérience
-- SELECT hire_date, COUNT(*) AS nomber_of_employee
-- FROM employees
-- GROUP BY hire_date;
-- Question 6 Liste des employes par maison 
-- SELECT e.fname,p.pub_id
-- FROM employees e , publishers p
-- WHERE e.pub_id = p.pub_id ;

-- Question 7 Salaire moyens des employes par maison d'edition

-- SELECT MIN(e.salary) AS min_salary, e.fname, p.pub_id
-- FROM employees e 
-- JOIN publishers p ON e.pub_id = p.pub_id 
-- GROUP BY e.fname, p.pub_id;

-- Question 8 effectif  d'employees de niveau SENIOR par maison d'edition 
-- SELECT COUNT(*) as nombre_employee, e.job_lvl as niveau
-- FROM employees e 
-- JOIN publishers p ON e.pub_id = p.pub_id 
-- WHERE e.job_lvl = "SENIOR";

