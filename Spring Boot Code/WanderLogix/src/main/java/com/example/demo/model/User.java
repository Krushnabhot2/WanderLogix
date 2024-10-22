package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.List;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "fname", nullable = false, length = 15)
    private String firstName;

    @Column(name = "lname", nullable = false, length = 15)
    private String lastName;

    @Column(name = "email", nullable = false, unique = true, length = 30)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "phone_no", nullable = false, unique = true, length = 15)
    private String phoneNumber;

    @Column(name = "address", length = 50)
    private String address;

    @Column(name = "aadhar_no", length = 15)
    private String aadharNumber;

    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    private Role role;

    @OneToMany(mappedBy = "manager")
    private List<TourPackage> managedPackages;

    @OneToMany(mappedBy = "guide")
    private List<TourPackage> guidedPackages;

    // Getters and Setters

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAadharNumber() {
        return aadharNumber;
    }

    public void setAadharNumber(String aadharNumber) {
        this.aadharNumber = aadharNumber;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<TourPackage> getManagedPackages() {
        return managedPackages;
    }

    public void setManagedPackages(List<TourPackage> managedPackages) {
        this.managedPackages = managedPackages;
    }

    public List<TourPackage> getGuidedPackages() {
        return guidedPackages;
    }

    public void setGuidedPackages(List<TourPackage> guidedPackages) {
        this.guidedPackages = guidedPackages;
    }
}
