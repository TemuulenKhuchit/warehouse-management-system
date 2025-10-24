package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.dto.StockDto;
import edu.miu.cs489.project.wms.entity.Stock;
import edu.miu.cs489.project.wms.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import static edu.miu.cs489.project.wms.mapper.DtoMapper.toDto;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderController {

    private final StockService stockService;

    @PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER','ADMIN')")
    @PostMapping("/sendOrderToWarehouse")
    public ResponseEntity<StockDto> sendOrder(
            @RequestParam Long productId,
            @RequestParam Long warehouseId,
            @RequestParam int quantity,
            @RequestParam Long userId) {
        return ResponseEntity.ok(toDto(stockService.processOutbound(productId, warehouseId, quantity, userId)));
    }

    @PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER','ADMIN')")
    @PostMapping("/returnOrderToWarehouse")
    public ResponseEntity<StockDto> returnOrder(
            @RequestParam Long productId,
            @RequestParam Long warehouseId,
            @RequestParam int quantity,
            @RequestParam Long userId) {
        return ResponseEntity.ok(toDto(stockService.processInbound(productId, warehouseId, quantity, userId)));
    }
}
