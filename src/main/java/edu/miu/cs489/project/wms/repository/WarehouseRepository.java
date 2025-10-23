package edu.miu.cs489.project.wms.repository;

import edu.miu.cs489.project.wms.entity.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WarehouseRepository extends JpaRepository<Warehouse, Long> { }