package com.example.ss10_jsp_jstl.model;

public class Customer {
    private String fullName;
    private String dateOfBirth;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String fullName, String dateOfBirth, String address, String image) {
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.image = image;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
