package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.dto.WarehouseDto;
import edu.miu.cs489.project.wms.entity.Warehouse;
import edu.miu.cs489.project.wms.mapper.DtoMapper;
import edu.miu.cs489.project.wms.service.WarehouseService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static edu.miu.cs489.project.wms.mapper.DtoMapper.*;

@RestController
@RequestMapping("/api/warehouses")
@RequiredArgsConstructor
public class WarehouseController {

    private final WarehouseService warehouseService;

    @PreAuthorize("hasAnyRole('ADMIN','MANAGER')")
    @PostMapping("/createWarehouse")
    public ResponseEntity<WarehouseDto> createWarehouse(@RequestBody Warehouse warehouse) {
        return ResponseEntity.ok(toDto(warehouseService.createWarehouse(warehouse)));
    }

    @GetMapping("/getWarehouseById/{id}")
    public ResponseEntity<WarehouseDto> getWarehouseById(@PathVariable Long id) {
        return ResponseEntity.ok(toDto(warehouseService.getWarehouseById(id)));
    }

    @GetMapping("/getAllWarehouses")
    public ResponseEntity<List<WarehouseDto>> getAllWarehouses() {
        return ResponseEntity.ok(mapList(warehouseService.getAllWarehouses(), DtoMapper::toDto));
    }

    @PreAuthorize("hasAnyRole('ADMIN','MANAGER')")
    @PutMapping("/updateWarehouse/{id}")
    public ResponseEntity<WarehouseDto> updateWarehouse(@PathVariable Long id, @RequestBody Warehouse updated) {
        return ResponseEntity.ok(toDto(warehouseService.updateWarehouse(id, updated)));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/deleteWarehouse/{id}")
    public ResponseEntity<String> deleteWarehouse(@PathVariable Long id) {
        warehouseService.deleteWarehouse(id);
        return ResponseEntity.ok("Warehouse deleted successfully.");
    }
}
