package edu.miu.cs489.project.wms.service.impl;

import edu.miu.cs489.project.wms.entity.*;
import edu.miu.cs489.project.wms.repository.*;
import edu.miu.cs489.project.wms.service.StockService;
import edu.miu.cs489.project.wms.service.InventoryLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class StockServiceImpl implements StockService {

    private final StockRepository stockRepository;
    private final ProductRepository productRepository;
    private final WarehouseRepository warehouseRepository;
    private final UserRepository userRepository;
    private final InventoryLogService inventoryLogService;

    @Override
    public Stock restock(Long productId, Long warehouseId, int quantity, Long userId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        Warehouse warehouse = warehouseRepository.findById(warehouseId)
                .orElseThrow(() -> new RuntimeException("Warehouse not found"));
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Stock stock = stockRepository
                .findByProduct_ProductIdAndWarehouse_WarehouseId(productId, warehouseId)
                .orElse(Stock.builder().product(product).warehouse(warehouse).quantity(0).build());

        stock.setQuantity(stock.getQuantity() + quantity);
        stockRepository.save(stock);

        inventoryLogService.logChange(
                InventoryLog.builder()
                        .product(product)
                        .warehouse(warehouse)
                        .user(user)
                        .changeType(StockChangeType.INBOUND)
                        .quantityChanged(quantity)
                        .timestamp(LocalDateTime.now())
                        .build()
        );

        return stock;
    }

    @Override
    public int getTotalStockByProductId(Long productId) {
        return stockRepository.findAll().stream()
                .filter(s -> s.getProduct().getProductId().equals(productId))
                .mapToInt(Stock::getQuantity)
                .sum();
    }
}
