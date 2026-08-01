# Outer Joins - MiniStore

## Autor

Matias Gomez Galeano

---

## 1. ¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN?

Utilicé LEFT JOIN porque necesitaba mostrar todos los productos del catálogo, incluso aquellos que nunca tuvieron ventas.

Si hubiera utilizado INNER JOIN, únicamente aparecerían los productos que tienen al menos una venta registrada, por lo que los productos 108 (Hub USB-C 7p) y 109 (Parlante Bluetooth) desaparecerían del resultado.

El LEFT JOIN permite conservar todos los registros de la tabla productos y mostrar NULL cuando no existe una venta asociada.

---

## 2. ¿Por qué usaste RIGHT JOIN para la Consulta 2?

Usé RIGHT JOIN porque el objetivo era conservar todas las filas de la tabla ventas, incluso aquellas que no tienen un producto asociado en el catálogo.

En mi consulta:

- La tabla productos está a la izquierda.
- La tabla ventas está a la derecha.

De esta manera, todas las ventas aparecen en el resultado. Si una venta corresponde a un producto inexistente, los datos del producto aparecen como NULL.

En este ejercicio se detecta la venta con producto_id = 999, que no existe en la tabla productos.

---

## 3. ¿Qué representan los valores NULL?

Los valores NULL indican que no existe una coincidencia entre ambas tablas.

### Consulta 1

Cuando venta_id es NULL significa que el producto nunca fue vendido.

Por ejemplo:

- producto_id 108 (Hub USB-C 7p)
- producto_id 109 (Parlante Bluetooth)

Estos productos existen en el catálogo, pero no tienen ninguna venta registrada.

### Consulta 2

Cuando producto_id de la tabla productos es NULL significa que existe una venta cuyo producto no figura en el catálogo.

En este caso ocurre con la venta número 10, donde el producto_id es 999.

Esto puede indicar un error de carga de datos o un producto eliminado del catálogo.

---

## 4. ¿Cuándo usarías FULL OUTER JOIN en un caso real?

FULL OUTER JOIN resulta útil cuando se necesita realizar una auditoría completa de la información.

Permite visualizar:

- productos que nunca se vendieron,
- ventas con productos inexistentes,
- registros correctamente relacionados.

Este tipo de consulta ayuda a detectar inconsistencias en la base de datos antes de elaborar reportes o indicadores de negocio.
