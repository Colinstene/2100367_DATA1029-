-- Question 1 Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre :
SELECT au_fname, au_lname
FROM authors
WHERE au_id NOT IN (
    SELECT ta.au_id
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.pub_id = p.pub_id
    WHERE p.pub_name = 'Harmattan'
);

-- Question 2  Obtenir la liste des auteurs dont l'editeur <<Errolles>> a publie tous les livres 
SELECT au_fname, au_lname
   FROM authors
   WHERE au_id IN 
   (SELECT au_id FROM titleauthor
   JOIN titles ON titleauthor.title_id = titles.title_id
   JOIN publishers ON titles.pub_id = publishers.pub_id
	WHERE pub_name = 'Eyrolles'
	GROUP BY au_id
	HAVING COUNT(DISTINCT titles.title_id) = 
	(SELECT COUNT(DISTINCT titles.title_id) FROM titles 
	WHERE pub_id = (SELECT pub_id FROM publishers WHERE pub_name = 'Eyrolles'))
	);


SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (
    SELECT ta.au_id
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    GROUP BY ta.au_id
    HAVING MAX(advance) = ALL (
        SELECT MAX(advance)
        FROM titleauthor ta2
        JOIN titles t2 ON ta2.title_id = t2.title_id
        WHERE ta2.au_id = ta.au_id
    )
);
-- Question 3 Obtenir la liste des noms d'auteurs ayant touche une avance superieures a toutes les avances versees par l'editeur "Harmattan"

SELECT au_fname, au_lname
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE publishers.pub_name = 'Harmattan'
GROUP BY authors.au_id
HAVING MAX(titles.advance) > (SELECT MAX(advance) FROM titles INNER JOIN publishers ON titles.pub_id = publishers.pub_id WHERE publishers.pub_name = 'Harmattan');