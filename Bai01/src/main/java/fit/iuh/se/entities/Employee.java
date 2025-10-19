package fit.iuh.se.entities;

import fit.iuh.se.entities.enums.Gender;
import jakarta.persistence.*;
import jakarta.validation.constraints.*; // Import các chú thích Validation
import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data // Tốt hơn nên dùng @Data của Lombok để tránh code dài như dưới.
// (Tôi giữ lại getter/setter bạn cung cấp để tham khảo)

@Entity
@Table(name = "employees")
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Employee {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // Tên: Không được rỗng, không được chứa khoảng trắng, độ dài từ 2 đến 50 ký tự.
    @NotBlank(message = "Tên không được để trống")
    @Size(min = 2, max = 50, message = "Tên phải có từ 2 đến 50 ký tự")
    private String firstName;

    // Họ: Không được rỗng, độ dài từ 2 đến 50 ký tự.
    @NotBlank(message = "Họ không được để trống")
    @Size(min = 2, max = 50, message = "Họ phải có từ 2 đến 50 ký tự")
    private String lastName;

    // Giới tính: Không được để null (Phải được chọn từ Enum).
    @NotNull(message = "Giới tính không được để trống")
    @Enumerated(EnumType.STRING)
    private Gender gender;

    // Ngày sinh: Không được null và phải là ngày trong quá khứ (không thể sinh ra trong tương lai).
    @NotNull(message = "Ngày sinh không được để trống")
    @Past(message = "Ngày sinh phải là một ngày trong quá khứ")
    private Date dateOfBirth;

    // Email: Không được rỗng và phải đúng định dạng email.
    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    @Size(max = 100, message = "Email không được vượt quá 100 ký tự")
    private String email;

    // Số điện thoại: Không được rỗng và phải khớp với định dạng số điện thoại (ví dụ: 10 chữ số).
    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^(0|\\+84)\\d{9,10}$", message = "Số điện thoại không hợp lệ (ví dụ: 0xxxxxxxxxx hoặc +84xxxxxxxxx)")
    private String phone;

    // ... (Giữ nguyên getter/setter của bạn)
    // ...
}