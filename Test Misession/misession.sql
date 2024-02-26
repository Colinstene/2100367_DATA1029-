use epharmacy;
-- La liste des utilisateurs de l’application selon leur rôle. 
SELECT u.full_name AS User_Name, r.name AS Role_Name
FROM user u
JOIN role r ON u.role_id = r.id;

-- 2- Noms et quantités des produits achetés par Oumar Moussa. Le résultat doit
SELECT p.name AS Product_Name, ol.quantity AS Quantity
FROM user u
JOIN invoice i ON u.id = i.customer_id
JOIN orders o ON i.order_id = o.id
JOIN orderline ol ON o.id = ol.order_id
JOIN product p ON ol.product_id = p.id
WHERE u.full_name = 'Oumar Moussa';

-- 3  Quel sont les noms de produits dont le fournisseur est basé à Moncton ? 
SELECT p.name AS Product_Name
FROM product p
JOIN supplier s ON p.supplier_id = s.id
WHERE s.city = 'Moncton';
