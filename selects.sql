-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT 
  pedidos.id,
  pedidos.status,
  pedidos.cliente_id,
  produtos.id,
  produtos.nome,
  produtos.tipo,
  produtos.preço,
  produtos.pts_de_lealdade
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id =  produtos.id;

-- 2)

SELECT pedidos.id
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id =  produtos.id
WHERE produtos.nome = 'Fritas';

-- 3)

SELECT clientes.nome gostam_de_fritas
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id 
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos on produtos_pedidos.produto_id = produtos.id
WHERE produtos.nome = 'Fritas';

-- 4)

SELECT SUM(produtos.preço)
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id 
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos on produtos_pedidos.produto_id = produtos.id
WHERE clientes.nome = 'Laura';

-- 5)

SELECT produtos.nome, COUNT(*) quantidade
FROM produtos
INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
GROUP BY produtos.nome
ORDER BY nome;