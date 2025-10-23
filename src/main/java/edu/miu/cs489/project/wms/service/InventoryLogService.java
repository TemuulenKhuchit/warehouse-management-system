package edu.miu.cs489.project.wms.service;

import edu.miu.cs489.project.wms.entity.InventoryLog;

public interface InventoryLogService {
    InventoryLog logChange(InventoryLog log);
}