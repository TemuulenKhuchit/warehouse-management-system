package edu.miu.cs489.project.wms.controller;

import edu.miu.cs489.project.wms.entity.User;
import edu.miu.cs489.project.wms.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/public/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // Public
    @PostMapping("/register")
    public ResponseEntity<User> registerUser(@RequestBody User user) {
        return ResponseEntity.ok(userService.registerUser(user));
    }
}

@RestController
@RequestMapping("/api/admin/users")
@RequiredArgsConstructor
class AdminUserController {

    private final UserService userService;

    // Admin only
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/getAllUsers")
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok(userService.getAllUsers());
    }
}
