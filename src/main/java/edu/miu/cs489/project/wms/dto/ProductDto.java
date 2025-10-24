package edu.miu.cs489.project.wms.dto;

import edu.miu.cs489.project.wms.entity.Category;
import lombok.*;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ProductDto {
    private Long productId;
    private String name;
    private String sku;
    private Category category;
    private double price;
}
