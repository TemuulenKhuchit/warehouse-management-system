package edu.miu.cs489.project.wms.repository;

import edu.miu.cs489.project.wms.entity.Category;
import edu.miu.cs489.project.wms.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategory(Category category);
    List<Product> findByPriceBetween(double min, double max);
}