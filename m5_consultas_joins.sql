--ENTREABLE MODULO 5: Consultas con JOINs para el proyecto--

--- CONSULTA 1: Vista base del proyeto (INNER JOIN)	

 SELECT
 ventas.fecha_venta,
 clientes.id_cliente,
 clientes.nombre AS nombre_cliente,
 clientes.email,
 clientes.ciudad,
 productos.nombre_producto,
 ventas.cantidad,
 ventas.precio_unitario,
 (ventas.cantidad * ventas.precio_unitario) AS total_venta
 FROM ventas
 INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
 INNER JOIN productos ON ventas.id_producto = productos.id_producto;

-- CONSULTA 2: Clientes sin ventas (LEFT JOIN)--

SELECT
clientes.id_cliente,
clientes.nombre AS nombre_cliente,
clientes.email,
clientes.fecha_registro
FROM clientes
LEFT JOIN ventas ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_venta is NULL

-- CONSULTA 3: Productos sin ventas (LEFT JOIN)--

SELECT
productos.id_producto,
productos.nombre_producto,
productos.id_categoria,
productos.precio
FROM productos
LEFT JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE ventas.id_venta IS NULL

-- CONSULTA 4: Consolidado por canal (UNION ALL) --
SELECT canal, SUM(total) AS total_canal
FROM (
SELECT fecha_venta, cantidad * precio_unitario AS total, 'Online' AS canal
FROM ventas WHERE id_venta % 2 = 1
UNION ALL
SELECT fecha_venta, cantidad * precio_unitario AS total, 'Prescencial' AS canal
FROM ventas WHERE id_venta % 2 = 0
) AS consolidado
GROUP BY canal;