package edu.miu.cs489.project.wms.dto;

import edu.miu.cs489.project.wms.entity.StockChangeType;
import lombok.*;
import java.time.LocalDateTime;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class InventoryLogDto {
    private Long logId;
    private Long productId;
    private String productSku;
    private Long warehouseId;
    private Long userId;
    private String username;
    private StockChangeType changeType;
    private int quantityChanged;
    private LocalDateTime timestamp;
}
