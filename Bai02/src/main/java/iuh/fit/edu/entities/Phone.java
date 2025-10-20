/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.entities;

import jakarta.persistence.*;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "dienthoai")
public class Phone {
    @Id
    @Column(name = "MADT")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maDienThoai;

    @Column(name = "TENDT")
    @NotBlank(message = "Tên điện thoại không được để trống")
    private String tenDienThoai;

    @NotNull
    @Min(value = 1000, message = "Năm sản xuất phải có 4 chữ số")
    @Max(value = 9999, message = "Năm sản xuất phải có 4 chữ số")
    @Column(name = "NAMSANXUAT")
    private int namSanXuat;

    @NotBlank(message = "Cấu hình không đuọc để trống")
    @Pattern(regexp = "^.{1,255}$", message = "Thông tin cấu hình không được vượt quá 255 ký tự")
    @Column(name = "CAUHINH")
    private String cauHinh;

    @Column(name = "HINHANH")
    private String hinhAnh;

    @ManyToOne
    @JoinColumn(name = "MANCC")
    private Supplier nhaCungCap;
}
