package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.dto.ProductDto;
import edu.miu.cs489.project.wms.entity.*;
import edu.miu.cs489.project.wms.mapper.DtoMapper;
import edu.miu.cs489.project.wms.service.ProductService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static edu.miu.cs489.project.wms.mapper.DtoMapper.*;

@Tag(name = "Products", description = "Product CRUD & queries")
@SecurityRequirement(name = "bearerAuth")
@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @Operation(summary = "Create a product", description = "ADMIN or MANAGER only")
    @PostMapping("/createProduct")
    public ResponseEntity<ProductDto> createProduct(@RequestBody Product product) {
        return ResponseEntity.ok(toDto(productService.createProduct(product)));
    }

    @GetMapping("/getProductById/{id}")
    public ResponseEntity<ProductDto> getProductById(@PathVariable Long id) {
        return ResponseEntity.ok(toDto(productService.getProductById(id)));
    }

    @Operation(summary = "Get all products")
    @GetMapping("/getAllProducts")
    public ResponseEntity<List<ProductDto>> getAllProducts() {
        return ResponseEntity.ok(mapList(productService.getAllProducts(), DtoMapper::toDto));
    }

    @PreAuthorize("hasAnyRole('ADMIN','MANAGER')")
    @PutMapping("/updateProduct/{id}")
    public ResponseEntity<ProductDto> updateProduct(@PathVariable Long id, @RequestBody Product product) {
        return ResponseEntity.ok(toDto(productService.updateProduct(id, product)));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/deleteProduct/{id}")
    public ResponseEntity<String> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok("Product deleted successfully.");
    }

    @GetMapping("/getProductsByCategory/{category}")
    public ResponseEntity<List<ProductDto>> getByCategory(@PathVariable Category category) {
        return ResponseEntity.ok(mapList(productService.getProductsByCategory(category), DtoMapper::toDto));
    }

    @GetMapping("/getProductsByPriceRange")
    public ResponseEntity<List<ProductDto>> getByPriceRange(
            @RequestParam double min,
            @RequestParam double max) {
        return ResponseEntity.ok(mapList(productService.getProductsByPriceRange(min, max),  DtoMapper::toDto));
    }
}
