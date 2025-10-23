package edu.miu.cs489.project.wms.repository;

import edu.miu.cs489.project.wms.entity.InventoryLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryLogRepository extends JpaRepository<InventoryLog, Long> { }
