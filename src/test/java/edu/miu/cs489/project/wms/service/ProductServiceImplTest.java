package edu.miu.cs489.project.wms.service;

import edu.miu.cs489.project.wms.entity.Category;
import edu.miu.cs489.project.wms.entity.Product;
import edu.miu.cs489.project.wms.repository.ProductRepository;
import edu.miu.cs489.project.wms.service.impl.ProductServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class ProductServiceImplTest {

    @Mock
    ProductRepository productRepository;

    @InjectMocks
    ProductServiceImpl productService;

    @Test
    void createProduct_savesAndReturnsSavedEntity() {
        // given
        Product input = Product.builder()
                .name("Laptop 13")
                .sku("SKU-EL-001")
                .category(Category.ELECTRONICS)
                .price(899.0)
                .build();

        // mock repo.save to "assign" an id and return the saved entity
        when(productRepository.save(any(Product.class))).thenAnswer(inv -> {
            Product p = inv.getArgument(0);
            p.setProductId(1L);
            return p;
        });

        // when
        Product saved = productService.createProduct(input);

        // then
        assertNotNull(saved);
        assertEquals(1L, saved.getProductId());
        assertEquals("Laptop 13", saved.getName());
        verify(productRepository, times(1)).save(any(Product.class));
    }
}
