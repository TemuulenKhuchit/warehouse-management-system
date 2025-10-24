package edu.miu.cs489.project.wms.it;

import edu.miu.cs489.project.wms.entity.*;
import edu.miu.cs489.project.wms.repository.*;
import edu.miu.cs489.project.wms.service.StockService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ActiveProfiles("test") // <-- uses application-test.properties (H2)
class StockFlowIT {

    @Autowired ProductRepository productRepository;
    @Autowired WarehouseRepository warehouseRepository;
    @Autowired UserRepository userRepository;
    @Autowired StockService stockService;

    @Test
    void inboundThenOutbound_updatesQuantities() {
        // create minimal Address
        Address addr = new Address();
        addr.setStreet("123 Main");
        addr.setCity("Denver");
        addr.setState("CO");
        addr.setZipCode("80202");

        // seed Warehouse, Product, User in H2
        Warehouse w = warehouseRepository.save(Warehouse.builder()
                .name("Main Warehouse")
                .address(addr)
                .build());

        Product p = productRepository.save(Product.builder()
                .name("Rice 5kg")
                .sku("SKU-GR-005")
                .category(Category.GROCERY)
                .price(19.99)
                .build());

        User u = userRepository.save(User.builder()
                .username("emp")
                .password("x")
                .email("emp@wms.com")
                .role(Role.EMPLOYEE)
                .build());

        // 1) INBOUND +100
        var afterInbound = stockService.processInbound(
                p.getProductId(), w.getWarehouseId(), 100, u.getUserId());

        assertEquals(100, afterInbound.getQuantity(), "Inbound should add quantity");

        // 2) OUTBOUND -30
        var afterOutbound = stockService.processOutbound(
                p.getProductId(), w.getWarehouseId(), 30, u.getUserId());

        assertEquals(70, afterOutbound.getQuantity(), "Outbound should subtract quantity");

        // sanity: total stock by product should be 70
        int total = stockService.getTotalStockByProductId(p.getProductId());
        assertEquals(70, total);
    }
}
