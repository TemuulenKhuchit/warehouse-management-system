package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.entity.Stock;
import edu.miu.cs489.project.wms.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderController {

    private final StockService stockService;

    @PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER','ADMIN')")
    @PostMapping("/sendOrderToWarehouse")
    public ResponseEntity<Stock> sendOrder(
            @RequestParam Long productId,
            @RequestParam Long warehouseId,
            @RequestParam int quantity,
            @RequestParam Long userId) {
        return ResponseEntity.ok(stockService.processOutbound(productId, warehouseId, quantity, userId));
    }

    @PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER','ADMIN')")
    @PostMapping("/returnOrderToWarehouse")
    public ResponseEntity<Stock> returnOrder(
            @RequestParam Long productId,
            @RequestParam Long warehouseId,
            @RequestParam int quantity,
            @RequestParam Long userId) {
        return ResponseEntity.ok(stockService.processInbound(productId, warehouseId, quantity, userId));
    }
}
