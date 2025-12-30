USE restaurant_db;
-- 1. Visualizar a tabela menu_items
SELECT * FROM menu_items;

-- 2. Encontrar a quantidade de itens no cardápio
SELECT COUNT(*) FROM menu_items;

-- 3. Quais são os itens mais baratos e mais caros do cardápio?
SELECT item_name, price FROM menu_items
ORDER BY price DESC;

-- 4. Quantos pratos italianos existem no cardápio?
SELECT * FROM menu_items
WHERE category = 'Italian';

-- 5. Quais são os pratos italianos mais baratos e mais caros do cardápio?
SELECT item_name, price FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

SELECT item_name, price FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- 6. Quantos pratos existem em cada categoria?
SELECT category, COUNT(menu_item_id) AS num_pratos
FROM menu_items
GROUP BY category;

-- 7. Qual é o preço médio dos pratos dentro de cada categoria?
SELECT category, AVG(price) AS avg_preço
 FROM menu_items
 GROUP BY category