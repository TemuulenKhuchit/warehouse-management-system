package edu.miu.cs489.project.wms.dto;

import lombok.*;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class WarehouseDto {
    private Long warehouseId;
    private String name;
    private String street;
    private String city;
    private String state;
    private String zipCode;
}
