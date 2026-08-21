package com.orders.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.orders.entity.CustomerOrder;

import java.util.List;

public interface OrderRepository extends JpaRepository<CustomerOrder, Long> {

    // Used by API 4 - category summary
    List<CustomerOrder> findByCategoryIgnoreCase(String category);
}
