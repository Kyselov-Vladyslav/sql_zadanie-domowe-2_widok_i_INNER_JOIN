-- Active: 1668848863192@@127.0.0.1@3306@shop

CREATE VIEW products_and_supplier AS
SELECT products.name, supplier_of_goods.supplier_name
FROM products INNER JOIN supplier_of_goods
ON products.id_product = supplier_of_goods.id_supplier;


