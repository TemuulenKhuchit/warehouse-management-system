package edu.miu.cs489.project.wms.service;

import edu.miu.cs489.project.wms.entity.Warehouse;
import java.util.List;

public interface WarehouseService {
    Warehouse createWarehouse(Warehouse warehouse);
    Warehouse getWarehouseById(Long id);
    List<Warehouse> getAllWarehouses();
    Warehouse updateWarehouse(Long id, Warehouse updated);
    void deleteWarehouse(Long id);
}
