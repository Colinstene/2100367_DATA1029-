-- Exercice 1
SELECT title, price FROM titles WHERE title LIKE '%computer%' ;
-- Exercice 2
select title ,price from titles where title like "%computer%" or title like"%computer%" or title like"%computer%";
-- Execice 3
select title ,price from titles where title_id like "SU%" or title_id like "BU%";
-- Exercice 4
select title, price from titles where not(title_id like"SU%" or title_id like "BU%");
-- Exercice 5
 select title ,price from titles where title not like"S%" and title not like "B%" and title like"_o%";
 -- Exercice 6
 select title, price from titles where title not like "S%" and title not like"B%" and title like "_f%";
 -- Exercice 7
 select title ,price from titles where title like "A%"or title like "B%" or title like "C%" or title like "D%" or title like"E%" or title like "F%" or title like "G%" or title like "H%" or title like "I%" or title like"%J";