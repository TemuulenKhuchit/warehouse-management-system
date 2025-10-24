package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.dto.UserDto;
import edu.miu.cs489.project.wms.entity.User;
import edu.miu.cs489.project.wms.mapper.DtoMapper;
import edu.miu.cs489.project.wms.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

import static edu.miu.cs489.project.wms.mapper.DtoMapper.*;

@Tag(name = "Auth & Users (Public)")
@RestController
@RequestMapping("/api/public/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @Operation(summary = "Register new user (public)")
    @PostMapping("/register")
    public ResponseEntity<UserDto> registerUser(@RequestBody User user) {
        return ResponseEntity.ok(toDto(userService.registerUser(user)));
    }
}

@RestController
@RequestMapping("/api/admin/users")
@RequiredArgsConstructor
class AdminUserController {

    private final UserService userService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/getAllUsers")
    public ResponseEntity<List<UserDto>> getAllUsers() {
        return ResponseEntity.ok(mapList(userService.getAllUsers(), DtoMapper::toDto));
    }
}
