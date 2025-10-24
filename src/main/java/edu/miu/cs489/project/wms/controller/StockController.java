package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.dto.StockDto;
import edu.miu.cs489.project.wms.entity.Stock;
import edu.miu.cs489.project.wms.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import static edu.miu.cs489.project.wms.mapper.DtoMapper.*;

@RestController
@RequestMapping("/api/stocks")
@RequiredArgsConstructor
public class StockController {

    private final StockService stockService;

    @PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER','ADMIN')")
    @PostMapping("/restock")
    public ResponseEntity<StockDto> restock(
            @RequestParam Long productId,
            @RequestParam Long warehouseId,
            @RequestParam int quantity,
            @RequestParam Long userId) {
        return ResponseEntity.ok(toDto(stockService.restock(productId, warehouseId, quantity, userId)));
    }

    @GetMapping("/getTotalStockByProductId/{productId}")
    public ResponseEntity<Integer> getTotalStock(@PathVariable Long productId) {
        return ResponseEntity.ok(stockService.getTotalStockByProductId(productId));
    }
}
