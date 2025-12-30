-- 1. Visualizar a tabela order_details
SELECT * FROM order_details;

-- 2. Qual é a data mais antiga e a data mais recente registradas na tabela?
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. Quantos pedidos foram feitos dentro desse intervalo de datas?
SELECT COUNT(DISTINCT order_id) FROM order_details;

-- 4. Quantos itens foram pedidos dentro desse intervalo de datas?
SELECT COUNT(*) FROM order_details;

-- 5. Quais pedidos tiveram o maior número de itens?
SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. Quantos pedidos tiveram mais de 12 itens?
SELECT COUNT(*) FROM 

(SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;