
-- Consulta 1 — Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2 — Ranking de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;



-- Consulta 3 — Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;



-- Consulta 4 — Meses por encima/por debajo del promedio mensual general


SELECT
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS TotalFacturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(TotalMes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS TotalMes
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS Promedio
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Estado
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;




-- Bloque de cierre — 3 Hallazgos


-- 1. El producto 1 genera $3.600 y representa aproximadamente
--    el 55,87% de la facturación total.

-- 2. Los clientes 1, 2, 3, 4 y 5 realizaron más de un pedido,
--    por lo que todos son clientes recurrentes según el criterio
--    de la consulta.

-- 3. El cliente 1 es quien registra el mayor gasto acumulado,
--    con un total de $2.640.
