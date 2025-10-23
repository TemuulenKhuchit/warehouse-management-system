package edu.miu.cs489.project.wms.service;

import edu.miu.cs489.project.wms.entity.Category;
import edu.miu.cs489.project.wms.entity.Product;

import java.util.List;

public interface ProductService {
    Product createProduct(Product product);

    Product getProductById(Long id);

    List<Product> getAllProducts();

    Product updateProduct(Long id, Product updated);

    void deleteProduct(Long id);

    List<Product> getProductsByCategory(Category category);

    List<Product> getProductsByPriceRange(double min, double max);
}
