package edu.miu.cs489.project.wms.mapper;

import edu.miu.cs489.project.wms.dto.*;
import edu.miu.cs489.project.wms.entity.*;
import java.util.List;
import java.util.stream.Collectors;

public final class DtoMapper {
    private DtoMapper() {}

    // ----- Users -----
    public static UserDto toDto(User u) {
        if (u == null) return null;
        return UserDto.builder()
                .userId(u.getUserId())
                .username(u.getUsername())
                .email(u.getEmail())
                .role(u.getRole())
                .build();
    }

    // ----- Warehouses -----
    public static WarehouseDto toDto(Warehouse w) {
        if (w == null) return null;
        return WarehouseDto.builder()
                .warehouseId(w.getWarehouseId())
                .name(w.getName())
                .street(w.getAddress() != null ? w.getAddress().getStreet() : null)
                .city(w.getAddress() != null ? w.getAddress().getCity() : null)
                .state(w.getAddress() != null ? w.getAddress().getState() : null)
                .zipCode(w.getAddress() != null ? w.getAddress().getZipCode() : null)
                .build();
    }

    // ----- Products -----
    public static ProductDto toDto(Product p) {
        if (p == null) return null;
        return ProductDto.builder()
                .productId(p.getProductId())
                .name(p.getName())
                .sku(p.getSku())
                .category(p.getCategory())
                .price(p.getPrice())
                .build();
    }

    // ----- Stock -----
    public static StockDto toDto(Stock s) {
        if (s == null) return null;
        return StockDto.builder()
                .stockId(s.getStockId())
                .productId(s.getProduct() != null ? s.getProduct().getProductId() : null)
                .productName(s.getProduct() != null ? s.getProduct().getName() : null)
                .warehouseId(s.getWarehouse() != null ? s.getWarehouse().getWarehouseId() : null)
                .warehouseName(s.getWarehouse() != null ? s.getWarehouse().getName() : null)
                .quantity(s.getQuantity())
                .build();
    }

    // ----- InventoryLog -----
    public static InventoryLogDto toDto(InventoryLog log) {
        if (log == null) return null;
        return InventoryLogDto.builder()
                .logId(log.getLogId())
                .productId(log.getProduct() != null ? log.getProduct().getProductId() : null)
                .productSku(log.getProduct() != null ? log.getProduct().getSku() : null)
                .warehouseId(log.getWarehouse() != null ? log.getWarehouse().getWarehouseId() : null)
                .userId(log.getUser() != null ? log.getUser().getUserId() : null)
                .username(log.getUser() != null ? log.getUser().getUsername() : null)
                .changeType(log.getChangeType())
                .quantityChanged(log.getQuantityChanged())
                .timestamp(log.getTimestamp())
                .build();
    }

    // ----- Collections -----
    public static <S, T> List<T> mapList(List<S> src, java.util.function.Function<S, T> fn) {
        return src == null ? List.of() : src.stream().map(fn).collect(Collectors.toList());
    }
}
