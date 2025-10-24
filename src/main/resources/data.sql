DECLARE
  v_users NUMBER := 0;
  v_wh    NUMBER := 0;
  v_prod  NUMBER := 0;
  v_stock NUMBER := 0;
  v_ilog  NUMBER := 0;
BEGIN
  ----------------------------------------------------------------
  -- USERS (run only if empty)
  ----------------------------------------------------------------
  SELECT COUNT(*) INTO v_users FROM users;
  IF v_users = 0 THEN
    INSERT ALL
      INTO users (user_id, username, password, email, role) VALUES (101, 'admin',   'admin123',   'admin@wms.com',   'ADMIN')
      INTO users (user_id, username, password, email, role) VALUES (102, 'manager', 'manager123', 'manager@wms.com', 'MANAGER')
      INTO users (user_id, username, password, email, role) VALUES (103, 'emp1',    'emp123',     'emp1@wms.com',    'EMPLOYEE')
      INTO users (user_id, username, password, email, role) VALUES (104, 'emp2',    'emp123',     'emp2@wms.com',    'EMPLOYEE')
    SELECT 1 FROM dual;
  END IF;

  ----------------------------------------------------------------
  -- WAREHOUSE (run only if empty)
  ----------------------------------------------------------------
  SELECT COUNT(*) INTO v_wh FROM warehouse;
  IF v_wh = 0 THEN
    INSERT ALL
      INTO warehouse (warehouse_id, name, street, city, state, zip_code)
      VALUES (101, 'Main Warehouse', '123 Main St', 'Denver',     'CO', '80202')
      INTO warehouse (warehouse_id, name, street, city, state, zip_code)
      VALUES (102, 'East Branch',    '45 River Rd', 'Chicago',    'IL', '60616')
      INTO warehouse (warehouse_id, name, street, city, state, zip_code)
      VALUES (103, 'West Hub',       '9 Sunset Dr', 'Sacramento', 'CA', '95814')
    SELECT 1 FROM dual;
  END IF;

  ----------------------------------------------------------------
  -- PRODUCT (run only if empty)
  ----------------------------------------------------------------
  SELECT COUNT(*) INTO v_prod FROM product;
  IF v_prod = 0 THEN
    INSERT ALL
      -- ELECTRONICS
      INTO product (product_id, name, sku, category, price) VALUES (101, 'Laptop 13"',             'SKU-EL-001', 'ELECTRONICS',              899.00)
      INTO product (product_id, name, sku, category, price) VALUES (102, 'Smartphone X',           'SKU-EL-002', 'ELECTRONICS',              699.00)
      -- FASHION
      INTO product (product_id, name, sku, category, price) VALUES (103, 'Winter Jacket',          'SKU-FA-003', 'FASHION',                  129.99)
      INTO product (product_id, name, sku, category, price) VALUES (104, 'Sneakers Pro',           'SKU-FA-004', 'FASHION',                   89.50)
      -- GROCERY
      INTO product (product_id, name, sku, category, price) VALUES (105, 'Organic Rice 5kg',       'SKU-GR-005', 'GROCERY',                   18.75)
      INTO product (product_id, name, sku, category, price) VALUES (106, 'Olive Oil 1L',           'SKU-GR-006', 'GROCERY',                   12.20)
      -- HOME_APPLIANCES
      INTO product (product_id, name, sku, category, price) VALUES (107, 'Air Fryer 4L',           'SKU-HA-007', 'HOME_APPLIANCES',          135.00)
      INTO product (product_id, name, sku, category, price) VALUES (108, 'Vacuum Cleaner',         'SKU-HA-008', 'HOME_APPLIANCES',          159.99)
      -- BOOKS
      INTO product (product_id, name, sku, category, price) VALUES (109, 'Clean Code',             'SKU-BO-009', 'BOOKS',                     34.99)
      INTO product (product_id, name, sku, category, price) VALUES (110, 'Design Patterns',        'SKU-BO-010', 'BOOKS',                     42.00)
      -- TOYS
      INTO product (product_id, name, sku, category, price) VALUES (111, 'RC Car',                 'SKU-TY-011', 'TOYS',                      49.99)
      INTO product (product_id, name, sku, category, price) VALUES (112, 'Building Blocks 500pcs', 'SKU-TY-012', 'TOYS',                      39.50)
      -- BEAUTY_AND_PERSONAL_CARE
      INTO product (product_id, name, sku, category, price) VALUES (113, 'Facial Cleanser',        'SKU-BP-013', 'BEAUTY_AND_PERSONAL_CARE',  14.20)
      INTO product (product_id, name, sku, category, price) VALUES (114, 'Shampoo 500ml',          'SKU-BP-014', 'BEAUTY_AND_PERSONAL_CARE',  10.90)
      -- SPORTS_AND_OUTDOORS
      INTO product (product_id, name, sku, category, price) VALUES (115, 'Yoga Mat',               'SKU-SO-015', 'SPORTS_AND_OUTDOORS',       24.99)
      INTO product (product_id, name, sku, category, price) VALUES (116, 'Trekking Poles',         'SKU-SO-016', 'SPORTS_AND_OUTDOORS',       59.99)
      -- AUTOMOTIVE
      INTO product (product_id, name, sku, category, price) VALUES (117, 'Engine Oil 5W-30',       'SKU-AU-017', 'AUTOMOTIVE',                28.00)
      INTO product (product_id, name, sku, category, price) VALUES (118, 'Car Vacuum',             'SKU-AU-018', 'AUTOMOTIVE',                32.50)
      -- HEALTH_AND_WELLNESS
      INTO product (product_id, name, sku, category, price) VALUES (119, 'Vitamin D3',             'SKU-HW-019', 'HEALTH_AND_WELLNESS',       15.60)
      INTO product (product_id, name, sku, category, price) VALUES (120, 'Protein Powder 1kg',     'SKU-HW-020', 'HEALTH_AND_WELLNESS',       44.00)
    SELECT 1 FROM dual;
  END IF;

  ----------------------------------------------------------------
  -- STOCKS (run only if empty)
  ----------------------------------------------------------------
  SELECT COUNT(*) INTO v_stock FROM stock;
  IF v_stock = 0 THEN
    -- Main Warehouse
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 50  FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' WHERE p.sku = 'SKU-EL-001';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 80  FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' WHERE p.sku = 'SKU-EL-002';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 120 FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' WHERE p.sku = 'SKU-GR-005';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 60  FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' WHERE p.sku = 'SKU-HA-007';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 40  FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' WHERE p.sku = 'SKU-BO-010';

    -- East Branch
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 30  FROM product p JOIN warehouse w ON w.name = 'East Branch' WHERE p.sku = 'SKU-FA-003';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 45  FROM product p JOIN warehouse w ON w.name = 'East Branch' WHERE p.sku = 'SKU-FA-004';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 70  FROM product p JOIN warehouse w ON w.name = 'East Branch' WHERE p.sku = 'SKU-TY-011';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 65  FROM product p JOIN warehouse w ON w.name = 'East Branch' WHERE p.sku = 'SKU-SO-015';

    -- West Hub
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 25  FROM product p JOIN warehouse w ON w.name = 'West Hub' WHERE p.sku = 'SKU-AU-017';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 55  FROM product p JOIN warehouse w ON w.name = 'West Hub' WHERE p.sku = 'SKU-HW-020';
    INSERT INTO stock (product_id, warehouse_id, quantity)
      SELECT p.product_id, w.warehouse_id, 95  FROM product p JOIN warehouse w ON w.name = 'West Hub' WHERE p.sku = 'SKU-GR-006';
  END IF;

  ----------------------------------------------------------------
  -- INVENTORY LOGS (run only if empty)
  ----------------------------------------------------------------
  SELECT COUNT(*) INTO v_ilog FROM inventory_log;
  IF v_ilog = 0 THEN
    -- Admin receives 100 Laptops into Main Warehouse
    INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
      SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 100, SYSTIMESTAMP
        FROM product p JOIN warehouse w ON w.name = 'Main Warehouse' JOIN users u ON u.username = 'admin'
       WHERE p.sku = 'SKU-EL-001';

    -- Manager receives 40 Yoga Mats into East Branch
    INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
      SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 40, SYSTIMESTAMP
        FROM product p JOIN warehouse w ON w.name = 'East Branch' JOIN users u ON u.username = 'manager'
       WHERE p.sku = 'SKU-SO-015';

    -- Employee returns 10 Olive Oil to West Hub (INBOUND)
    INSERT INTO inventory_log (product_id, warehouse_id, user_id, change_type, quantity_changed, timestamp)
      SELECT p.product_id, w.warehouse_id, u.user_id, 'INBOUND', 10, SYSTIMESTAMP
        FROM product p JOIN warehouse w ON w.name = 'West Hub' JOIN users u ON u.username = 'emp1'
       WHERE p.sku = 'SKU-GR-006';
  END IF;
END;
