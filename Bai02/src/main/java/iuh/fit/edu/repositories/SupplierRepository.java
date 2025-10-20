/*
 * @ (#) .java    1.0
 * Copyright (c)  IUH. All rights reserved.
 */
package iuh.fit.edu.repositories;

import iuh.fit.edu.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/*
 * @description
 * @author: Huu Thai
 * @date:
 * @version: 1.0
 */
public interface SupplierRepository extends JpaRepository<Supplier, Long> {

    @Query("SELECT n FROM Supplier n " +
            "WHERE CAST(n.maNhaCungCap AS string) LIKE %:keyword% " +
            "OR LOWER(n.tenNhaCungCap) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(n.diaChi) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(n.soDienThoai) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Supplier> searchByKeyword(@Param("keyword") String keyword);
}
