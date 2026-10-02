 --CONSULTA 1 — Vista base del proyecto (INNER JOIN)

SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS cliente,
    c.ciudad,
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM dbo.ventas AS v
INNER JOIN dbo.clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN dbo.productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN dbo.categoria AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

--CONSULTA 2 — Clientes sin ventas (LEFT JOIN)

SELECT
    c.id_cliente,
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

--CONSULTA 3 — Productos sin ventas (LEFT JOIN)

SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

--CONSULTA 4 — Consolidado por canal (UNION ALL)
--Como la tabla ventas no tiene una columna canal, se crea dentro de cada SELECT mediante un valor literal.

SELECT
    'Tienda física' AS canal,
    v.fecha_venta AS fecha,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto

UNION ALL

SELECT
    'Venta online' AS canal,
    v.fecha_venta AS fecha,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto

ORDER BY fecha;