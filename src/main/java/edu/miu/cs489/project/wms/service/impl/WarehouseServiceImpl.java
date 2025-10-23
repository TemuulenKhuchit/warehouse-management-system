package edu.miu.cs489.project.wms.service.impl;

import edu.miu.cs489.project.wms.entity.Warehouse;
import edu.miu.cs489.project.wms.repository.WarehouseRepository;
import edu.miu.cs489.project.wms.service.WarehouseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WarehouseServiceImpl implements WarehouseService {

    private final WarehouseRepository warehouseRepository;

    @Override
    public Warehouse createWarehouse(Warehouse warehouse) {
        return warehouseRepository.save(warehouse);
    }

    @Override
    public Warehouse getWarehouseById(Long id) {
        return warehouseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Warehouse not found"));
    }

    @Override
    public List<Warehouse> getAllWarehouses() {
        return warehouseRepository.findAll();
    }

    @Override
    public Warehouse updateWarehouse(Long id, Warehouse updated) {
        Warehouse existing = getWarehouseById(id);
        existing.setName(updated.getName());
        existing.setAddress(updated.getAddress());
        return warehouseRepository.save(existing);
    }

    @Override
    public void deleteWarehouse(Long id) {
        warehouseRepository.deleteById(id);
    }
}
