-- =========================
-- USERS (id starts at 101)
-- =========================
INSERT INTO users (user_id, username, password, email, role)
SELECT 101, 'admin', 'admin123', 'admin@wms.com', 'ADMIN'
/* Oracle: add "FROM dual" here */
    WHERE NOT EXISTS (
  SELECT 1 FROM users
  WHERE user_id = 101 OR username = 'admin' OR email = 'admin@wms.com'
);

INSERT INTO users (user_id, username, password, email, role)
SELECT 102, 'manager', 'manager123', 'manager@wms.com', 'MANAGER'
    WHERE NOT EXISTS (
  SELECT 1 FROM users
  WHERE user_id = 102 OR username = 'manager' OR email = 'manager@wms.com'
);

INSERT INTO users (user_id, username, password, email, role)
SELECT 103, 'emp1', 'emp123', 'emp1@wms.com', 'EMPLOYEE'
    WHERE NOT EXISTS (
  SELECT 1 FROM users
  WHERE user_id = 103 OR username = 'emp1' OR email = 'emp1@wms.com'
);

INSERT INTO users (user_id, username, password, email, role)
SELECT 104, 'emp2', 'emp123', 'emp2@wms.com', 'EMPLOYEE'
    WHERE NOT EXISTS (
  SELECT 1 FROM users
  WHERE user_id = 104 OR username = 'emp2' OR email = 'emp2@wms.com'
);

-- =========================
-- WAREHOUSE
-- =========================
INSERT INTO warehouse (warehouse_id, name, street, city, state, zip_code)
SELECT 101, 'Main Warehouse', '123 Main St', 'Denver', 'CO', '80202'
    WHERE NOT EXISTS (
  SELECT 1 FROM warehouse WHERE warehouse_id = 101 OR name = 'Main Warehouse'
);

INSERT INTO warehouse (warehouse_id, name, street, city, state, zip_code)
SELECT 102, 'East Branch', '45 River Rd', 'Chicago', 'IL', '60616'
    WHERE NOT EXISTS (
  SELECT 1 FROM warehouse WHERE warehouse_id = 102 OR name = 'East Branch'
);

INSERT INTO warehouse (warehouse_id, name, street, city, state, zip_code)
SELECT 103, 'West Hub', '9 Sunset Dr', 'Sacramento', 'CA', '95814'
    WHERE NOT EXISTS (
  SELECT 1 FROM warehouse WHERE warehouse_id = 103 OR name = 'West Hub'
);

-- =========================
-- PRODUCT
-- =========================
INSERT INTO product (product_id, name, sku, category, price)
SELECT 101, 'Laptop 13"', 'SKU-EL-001', 'ELECTRONICS', 899.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 101 OR sku = 'SKU-EL-001');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 102, 'Smartphone X', 'SKU-EL-002', 'ELECTRONICS', 699.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 102 OR sku = 'SKU-EL-002');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 103, 'Winter Jacket', 'SKU-FA-003', 'FASHION', 129.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 103 OR sku = 'SKU-FA-003');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 104, 'Sneakers Pro', 'SKU-FA-004', 'FASHION', 89.50
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 104 OR sku = 'SKU-FA-004');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 105, 'Organic Rice 5kg', 'SKU-GR-005', 'GROCERY', 18.75
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 105 OR sku = 'SKU-GR-005');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 106, 'Olive Oil 1L', 'SKU-GR-006', 'GROCERY', 12.20
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 106 OR sku = 'SKU-GR-006');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 107, 'Air Fryer 4L', 'SKU-HA-007', 'HOME_APPLIANCES', 135.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 107 OR sku = 'SKU-HA-007');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 108, 'Vacuum Cleaner', 'SKU-HA-008', 'HOME_APPLIANCES', 159.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 108 OR sku = 'SKU-HA-008');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 109, 'Clean Code', 'SKU-BO-009', 'BOOKS', 34.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 109 OR sku = 'SKU-BO-009');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 110, 'Design Patterns', 'SKU-BO-010', 'BOOKS', 42.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 110 OR sku = 'SKU-BO-010');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 111, 'RC Car', 'SKU-TY-011', 'TOYS', 49.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 111 OR sku = 'SKU-TY-011');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 112, 'Building Blocks 500pcs', 'SKU-TY-012', 'TOYS', 39.50
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 112 OR sku = 'SKU-TY-012');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 113, 'Facial Cleanser', 'SKU-BP-013', 'BEAUTY_AND_PERSONAL_CARE', 14.20
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 113 OR sku = 'SKU-BP-013');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 114, 'Shampoo 500ml', 'SKU-BP-014', 'BEAUTY_AND_PERSONAL_CARE', 10.90
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 114 OR sku = 'SKU-BP-014');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 115, 'Yoga Mat', 'SKU-SO-015', 'SPORTS_AND_OUTDOORS', 24.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 115 OR sku = 'SKU-SO-015');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 116, 'Trekking Poles', 'SKU-SO-016', 'SPORTS_AND_OUTDOORS', 59.99
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 116 OR sku = 'SKU-SO-016');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 117, 'Engine Oil 5W-30', 'SKU-AU-017', 'AUTOMOTIVE', 28.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 117 OR sku = 'SKU-AU-017');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 118, 'Car Vacuum', 'SKU-AU-018', 'AUTOMOTIVE', 32.50
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 118 OR sku = 'SKU-AU-018');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 119, 'Vitamin D3', 'SKU-HW-019', 'HEALTH_AND_WELLNESS', 15.60
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 119 OR sku = 'SKU-HW-019');

INSERT INTO product (product_id, name, sku, category, price)
SELECT 120, 'Protein Powder 1kg', 'SKU-HW-020', 'HEALTH_AND_WELLNESS', 44.00
    WHERE NOT EXISTS (SELECT 1 FROM product WHERE product_id = 120 OR sku = 'SKU-HW-020');

-- =========================
-- STOCK (avoid duplicates by (product_id, warehouse_id))
-- =========================
-- Main Warehouse
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 50
FROM product p, warehouse w
WHERE p.sku = 'SKU-EL-001' AND w.name = 'Main Warehouse'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 80
FROM product p, warehouse w
WHERE p.sku = 'SKU-EL-002' AND w.name = 'Main Warehouse'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 120
FROM product p, warehouse w
WHERE p.sku = 'SKU-GR-005' AND w.name = 'Main Warehouse'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 60
FROM product p, warehouse w
WHERE p.sku = 'SKU-HA-007' AND w.name = 'Main Warehouse'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 40
FROM product p, warehouse w
WHERE p.sku = 'SKU-BO-010' AND w.name = 'Main Warehouse'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

-- East Branch
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 30
FROM product p, warehouse w
WHERE p.sku = 'SKU-FA-003' AND w.name = 'East Branch'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 45
FROM product p, warehouse w
WHERE p.sku = 'SKU-FA-004' AND w.name = 'East Branch'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 70
FROM product p, warehouse w
WHERE p.sku = 'SKU-TY-011' AND w.name = 'East Branch'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 65
FROM product p, warehouse w
WHERE p.sku = 'SKU-SO-015' AND w.name = 'East Branch'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

-- West Hub
INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 25
FROM product p, warehouse w
WHERE p.sku = 'SKU-AU-017' AND w.name = 'West Hub'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 55
FROM product p, warehouse w
WHERE p.sku = 'SKU-HW-020' AND w.name = 'West Hub'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

INSERT INTO stock (product_id, warehouse_id, quantity)
SELECT p.product_id, w.warehouse_id, 95
FROM product p, warehouse w
WHERE p.sku = 'SKU-GR-006' AND w.name = 'West Hub'
  AND NOT EXISTS (
    SELECT 1 FROM stock s
    WHERE s.product_id = p.product_id AND s.warehouse_id = w.warehouse_id
);

-- =========================
-- INVENTORY LOG (use NOT EXISTS keyed by (product, warehouse, user, change_type, quantity))
-- =========================
-- Admin receives 100 Laptops into Main Warehouse
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 100, CURRENT_TIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-EL-001' AND w.name = 'Main Warehouse' AND u.username = 'admin'
  AND NOT EXISTS (
    SELECT 1
    FROM inventory_log il
    WHERE il.product_id = p.product_id
      AND il.warehouse_id = w.warehouse_id
      AND il.user_id = u.user_id
      AND il.change_type = 'INBOUND'
      AND il.quantity_changed = 100
);

-- Manager receives 40 Yoga Mats into East Branch
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 40, CURRENT_TIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-SO-015' AND w.name = 'East Branch' AND u.username = 'manager'
  AND NOT EXISTS (
    SELECT 1
    FROM inventory_log il
    WHERE il.product_id = p.product_id
      AND il.warehouse_id = w.warehouse_id
      AND il.user_id = u.user_id
      AND il.change_type = 'INBOUND'
      AND il.quantity_changed = 40
);

-- Employee returns 10 Olive Oil to West Hub (INBOUND)
INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 10, CURRENT_TIMESTAMP
FROM product p, warehouse w, users u
WHERE p.sku = 'SKU-GR-006' AND w.name = 'West Hub' AND u.username = 'emp1'
  AND NOT EXISTS (
    SELECT 1
    FROM inventory_log il
    WHERE il.product_id = p.product_id
      AND il.warehouse_id = w.warehouse_id
      AND il.user_id = u.user_id
      AND il.change_type = 'INBOUND'
      AND il.quantity_changed = 10
);
