package edu.miu.cs489.project.wms.dto;

import lombok.*;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class StockDto {
    private Long stockId;
    private Long productId;
    private String productName;
    private Long warehouseId;
    private String warehouseName;
    private int quantity;
}
