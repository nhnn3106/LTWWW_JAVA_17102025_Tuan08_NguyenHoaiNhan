/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "nhacungcap")
public class Supplier {
    @Id
    @Column(name = "MANCC")
    private Long maNhaCungCap;

    @Column(name = "TENNHACC")
    private String tenNhaCungCap;
    @Column(name = "DIACHI")
    private String diaChi;
    @Column(name = "SODIENTHOAI")
    private String soDienThoai;

    @OneToMany(mappedBy = "nhaCungCap")
    private List<Phone> dienThoais;
}
