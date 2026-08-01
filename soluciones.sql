-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Matias Gomez
-- Fecha: 01/08/2026
-- ══════════════════════════════════════════

-- ──────────────────────────────────────────
-- CONSULTA 1: LEFT JOIN
-- ¿Qué productos del catálogo nunca fueron vendidos?
-- ──────────────────────────────────────────

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL
ORDER BY p.producto_id;


-- ──────────────────────────────────────────
-- CONSULTA 2: RIGHT JOIN
-- ¿Existen ventas con productos inexistentes?
-- ──────────────────────────────────────────

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.producto_id AS producto_vendido,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
RIGHT JOIN ventas AS v
    ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL
ORDER BY v.venta_id;


-- ──────────────────────────────────────────
-- CONSULTA 3: FULL OUTER JOIN (MySQL)
-- Vista completa de auditoría
-- ──────────────────────────────────────────

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.producto_id = v.producto_id

UNION

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
RIGHT JOIN ventas AS v
    ON p.producto_id = v.producto_id

ORDER BY producto_id, venta_id;