package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tour_transaction")
public class TourTransaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tour_transaction_id")
    private Integer tourTransactionId;

    // Add other fields as needed
    @Column(name = "package_id")
    private Integer packageId;

    @Column(name = "user_id")
    private Integer userId;

    // Getters and Setters

    public Integer getTourTransactionId() {
        return tourTransactionId;
    }

    public void setTourTransactionId(Integer tourTransactionId) {
        this.tourTransactionId = tourTransactionId;
    }

    public Integer getPackageId() {
        return packageId;
    }

    public void setPackageId(Integer packageId) {
        this.packageId = packageId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
