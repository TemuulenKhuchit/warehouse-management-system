------------------------------------------------------------
-- USERS
------------------------------------------------------------
INSERT INTO users (username, password, email, role)
VALUES ('admin',   'admin123',   'admin@wms.com',   'ADMIN');

INSERT INTO users (username, password, email, role)
VALUES ('manager', 'manager123', 'manager@wms.com', 'MANAGER');

INSERT INTO users (username, password, email, role)
VALUES ('emp1',    'emp123',     'emp1@wms.com',    'EMPLOYEE');

INSERT INTO users (username, password, email, role)
VALUES ('emp2',    'emp123',     'emp2@wms.com',    'EMPLOYEE');

------------------------------------------------------------
-- WAREHOUSES  (Address fields are embedded into warehouse)
------------------------------------------------------------
INSERT INTO warehouse (name, street, city, state, zip_code)
VALUES ('Main Warehouse', '123 Main St', 'Denver',  'CO', '80202');

INSERT INTO warehouse (name, street, city, state, zip_code)
VALUES ('East Branch',    '45 River Rd', 'Chicago', 'IL', '60616');

INSERT INTO warehouse (name, street, city, state, zip_code)
VALUES ('West Hub',       '9 Sunset Dr', 'Sacramento','CA','95814');

------------------------------------------------------------
-- PRODUCTS
------------------------------------------------------------
-- ELECTRONICS
INSERT INTO product (name, sku, category, price)
VALUES ('Laptop 13"', 'SKU-EL-001', 'ELECTRONICS', 899.00);

INSERT INTO product (name, sku, category, price)
VALUES ('Smartphone X', 'SKU-EL-002', 'ELECTRONICS', 699.00);

-- FASHION
INSERT INTO product (name, sku, category, price)
VALUES ('Winter Jacket', 'SKU-FA-003', 'FASHION', 129.99);

INSERT INTO product (name, sku, category, price)
VALUES ('Sneakers Pro', 'SKU-FA-004', 'FASHION', 89.50);

-- GROCERY
INSERT INTO product (name, sku, category, price)
VALUES ('Organic Rice 5kg', 'SKU-GR-005', 'GROCERY', 18.75);

INSERT INTO product (name, sku, category, price)
VALUES ('Olive Oil 1L', 'SKU-GR-006', 'GROCERY', 12.20);

-- HOME_APPLIANCES
INSERT INTO product (name, sku, category, price)
VALUES ('Air Fryer 4L', 'SKU-HA-007', 'HOME_APPLIANCES', 135.00);

INSERT INTO product (name, sku, category, price)
VALUES ('Vacuum Cleaner', 'SKU-HA-008', 'HOME_APPLIANCES', 159.99);

-- BOOKS
INSERT INTO product (name, sku, category, price)
VALUES ('Clean Code', 'SKU-BO-009', 'BOOKS', 34.99);

INSERT INTO product (name, sku, category, price)
VALUES ('Design Patterns', 'SKU-BO-010', 'BOOKS', 42.00);

-- TOYS
INSERT INTO product (name, sku, category, price)
VALUES ('RC Car', 'SKU-TY-011', 'TOYS', 49.99);

INSERT INTO product (name, sku, category, price)
VALUES ('Building Blocks 500pcs', 'SKU-TY-012', 'TOYS', 39.50);

-- BEAUTY_AND_PERSONAL_CARE
INSERT INTO product (name, sku, category, price)
VALUES ('Facial Cleanser', 'SKU-BP-013', 'BEAUTY_AND_PERSONAL_CARE', 14.20);

INSERT INTO product (name, sku, category, price)
VALUES ('Shampoo 500ml', 'SKU-BP-014', 'BEAUTY_AND_PERSONAL_CARE', 10.90);

-- SPORTS_AND_OUTDOORS
INSERT INTO product (name, sku, category, price)
VALUES ('Yoga Mat', 'SKU-SO-015', 'SPORTS_AND_OUTDOORS', 24.99);

INSERT INTO product (name, sku, category, price)
VALUES ('Trekking Poles', 'SKU-SO-016', 'SPORTS_AND_OUTDOORS', 59.99);

-- AUTOMOTIVE
INSERT INTO product (name, sku, category, price)
VALUES ('Engine Oil 5W-30', 'SKU-AU-017', 'AUTOMOTIVE', 28.00);

INSERT INTO product (name, sku, category, price)
VALUES ('Car Vacuum', 'SKU-AU-018', 'AUTOMOTIVE', 32.50);

-- HEALTH_AND_WELLNESS
INSERT INTO product (name, sku, category, price)
VALUES ('Vitamin D3', 'SKU-HW-019', 'HEALTH_AND_WELLNESS', 15.60);

INSERT INTO product (name, sku, category, price)
VALUES ('Protein Powder 1kg', 'SKU-HW-020', 'HEALTH_AND_WELLNESS', 44.00);

------------------------------------------------------------
-- STOCKS
------------------------------------------------------------
-- Main Warehouse
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 50
FROM product p, warehouse w
WHERE p.sku = 'SKU-EL-001' AND w.name = 'Main Warehouse';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 80
FROM product p, warehouse w
WHERE p.sku = 'SKU-EL-002' AND w.name = 'Main Warehouse';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 120
FROM product p, warehouse w
WHERE p.sku = 'SKU-GR-005' AND w.name = 'Main Warehouse';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 60
FROM product p, warehouse w
WHERE p.sku = 'SKU-HA-007' AND w.name = 'Main Warehouse';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 40
FROM product p, warehouse w
WHERE p.sku = 'SKU-BO-010' AND w.name = 'Main Warehouse';

-- East Branch
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 30
FROM product p, warehouse w
WHERE p.sku = 'SKU-FA-003' AND w.name = 'East Branch';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 45
FROM product p, warehouse w
WHERE p.sku = 'SKU-FA-004' AND w.name = 'East Branch';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 70
FROM product p, warehouse w
WHERE p.sku = 'SKU-TY-011' AND w.name = 'East Branch';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 65
FROM product p, warehouse w
WHERE p.sku = 'SKU-SO-015' AND w.name = 'East Branch';

-- West Hub
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 25
FROM product p, warehouse w
WHERE p.sku = 'SKU-AU-017' AND w.name = 'West Hub';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 55
FROM product p, warehouse w
WHERE p.sku = 'SKU-HW-020' AND w.name = 'West Hub';

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 95
FROM product p, warehouse w
WHERE p.sku = 'SKU-GR-006' AND w.name = 'West Hub';

------------------------------------------------------------
-- INVENTORY LOGS (INBOUND)
------------------------------------------------------------
-- Admin receives 100 Laptops into Main Warehouse
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 100, SYSTIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-EL-001' AND w.name = 'Main Warehouse' AND u.username = 'admin';

-- Manager receives 40 Yoga Mats into East Branch
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 40, SYSTIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-SO-015' AND w.name = 'East Branch' AND u.username = 'manager';

-- Employee returns 10 Olive Oil to West Hub (INBOUND)
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 10, SYSTIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-GR-006' AND w.name = 'West Hub' AND u.username = 'emp1';
