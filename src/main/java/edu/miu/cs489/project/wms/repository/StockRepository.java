package edu.miu.cs489.project.wms.repository;

import edu.miu.cs489.project.wms.entity.Stock;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StockRepository extends JpaRepository<Stock, Long> {
    Optional<Stock> findByProduct_ProductIdAndWarehouse_WarehouseId(Long productId, Long warehouseId);
}