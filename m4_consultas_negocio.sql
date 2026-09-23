 USE	Ventas_Tech_DB;
 GO
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;
SELECT
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE
WHEN SUM (cantidad * precio_unitario) >= 5000 THEN 'por encima'
ELSE 'por debajo'
END AS relacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
=============================
HALLAZGOS DE NEGOCIO
=============================
1. En el mes 3, que seria marzo, la facturacion llego a los 7524,00, lo que fue el mes con facturacion por encima del promedio.
2. En el tercer punto, pudimos lograr ver que clientes (id_cliente) hicieron mas de un pedido. Vimos cuantos pedidos hizo cada uno y cuanto fue el total gastado entre todos los pedidos de cada uno.
3. El producto con id_producto = 1 fue el de mayor facturacion del periodo. Llego a las 3600,00 ventas.