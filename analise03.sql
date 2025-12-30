-- 1. Combinar as tabelas menu_items e order_details em uma única tabela.
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- LEFT JOIN para manter todas todas as linhas na minha tabela de detalhes do pedido e em seguida 
-- adicionar todos os detalhes na minha tabela de items do menu. 
SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- 2. Quais foram os itens menos pedidos e os mais pedidos? Em quais categorias eles estavam?
SELECT item_name, category, COUNT(order_details_id) AS num_compras 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_compras;
-- Os itens mais pedidos são Americanos e Asiáticos. Menos pedido Comida Mexicana.

-- 3. Quais foram os 5 pedidos que gastaram mais dinheiro?
SELECT order_id, SUM(price) AS gasto_total
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY gasto_total DESC
limit 5;
    
-- 4. Visualizar os detalhes do pedido com maior gasto. Quais insights podem ser obtidos a partir dos resultados?
SELECT category, COUNT(item_id) AS num_itens
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
    
-- 5. Visualizar os detalhes dos 5 pedidos com maior gasto. Quais insights podem ser obtidos a partir dos resultados?
SELECT order_id, category, COUNT(item_id) AS num_itens
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

