package edu.miu.cs489.project.wms.service.impl;

import edu.miu.cs489.project.wms.entity.Product;
import edu.miu.cs489.project.wms.entity.Category;
import edu.miu.cs489.project.wms.repository.ProductRepository;
import edu.miu.cs489.project.wms.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    @Override
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product updateProduct(Long id, Product updated) {
        Product existing = getProductById(id);
        existing.setName(updated.getName());
        existing.setPrice(updated.getPrice());
        existing.setCategory(updated.getCategory());
        existing.setSku(updated.getSku());
        return productRepository.save(existing);
    }

    @Override
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    @Override
    public List<Product> getProductsByCategory(Category category) {
        return productRepository.findByCategory(category);
    }

    @Override
    public List<Product> getProductsByPriceRange(double min, double max) {
        return productRepository.findByPriceBetween(min, max);
    }
}
