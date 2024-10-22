package com.example.demo.dto;

import java.util.Date;

public class TourPackageRequest {
    private Integer tourPackageId;
    private String tourName;
    private String description;
    private double price;
    private Date startDate;
    private Date endDate;
    private int duration;
    private int noOfSeats;
    private String status;
    private Integer manager; // Field name should match request body
    private Integer guide; // Field name should match request body

    // Getters and setters
    public Integer getTourPackageId() {
        return tourPackageId;
    }

    public void setTourPackageId(Integer tourPackageId) {
        this.tourPackageId = tourPackageId;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getNoOfSeats() {
        return noOfSeats;
    }

    public void setNoOfSeats(int noOfSeats) {
        this.noOfSeats = noOfSeats;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getManager() {
        return manager;
    }

    public void setManager(Integer manager) {
        this.manager = manager;
    }

    public Integer getGuide() {
        return guide;
    }

    public void setGuide(Integer guide) {
        this.guide = guide;
    }
}
