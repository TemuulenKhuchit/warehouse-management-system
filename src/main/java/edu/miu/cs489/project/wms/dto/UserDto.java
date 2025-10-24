package edu.miu.cs489.project.wms.dto;

import edu.miu.cs489.project.wms.entity.Role;
import lombok.*;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class UserDto {
    private Long userId;
    private String username;
    private String email;
    private Role role;
}
