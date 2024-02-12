-- LISTE DES AUTEURS AYANT PLUS DE 2 PUBLICATIONS 
SELECT authors.au_id, au_fname, au_lname, COUNT(*) AS publication_count
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
HAVING publication_count > 2;
