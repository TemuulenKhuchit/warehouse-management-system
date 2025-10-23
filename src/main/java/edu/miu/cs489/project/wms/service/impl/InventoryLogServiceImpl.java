package edu.miu.cs489.project.wms.service.impl;

import edu.miu.cs489.project.wms.entity.InventoryLog;
import edu.miu.cs489.project.wms.repository.InventoryLogRepository;
import edu.miu.cs489.project.wms.service.InventoryLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class InventoryLogServiceImpl implements InventoryLogService {

    private final InventoryLogRepository inventoryLogRepository;

    @Override
    public InventoryLog logChange(InventoryLog log) {
        return inventoryLogRepository.save(log);
    }
}
