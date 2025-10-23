package edu.miu.cs489.project.wms.service;

import edu.miu.cs489.project.wms.entity.Stock;

public interface StockService {
    Stock restock(Long productId, Long warehouseId, int quantity, Long userId);
    int getTotalStockByProductId(Long productId);
}
