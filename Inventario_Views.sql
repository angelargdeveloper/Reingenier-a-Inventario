use Inventario

CREATE VIEW v_producto AS
    SELECT  P.idProducto,
            P.nombre,
            P.precio,
            P.estatus,
            C.idCategoria,
            C.nombre AS nombreCat
    FROM	producto P 
            INNER JOIN categoria C ON P.idCategoria = C.idCategoria;
            
            
CREATE VIEW v_venta AS
SELECT  
		v.idVenta,
        ve.nombre AS nombreVendedor,
        ve.idVendedor,
        p.nombre AS nombreProducto,
        p.idProducto,
        p.precio AS precioUnitario,
        dv.kilos,
        dv.precioVenta,
        dv.descuento,
        v.fechaVenta
FROM    venta v 
        INNER JOIN detalle_venta dv ON v.idVenta = dv.idVenta
        INNER JOIN producto p ON dv.idProducto = p.idProducto
        INNER JOIN vendedor ve ON v.idVendedor = ve.idVendedor
        order by v.idVenta desc 