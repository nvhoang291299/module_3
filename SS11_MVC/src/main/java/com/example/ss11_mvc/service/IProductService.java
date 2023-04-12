package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Products;

import java.util.List;

public interface IProductService {
    List<Products> findAll();
    void save(Products product);

    void findById(int idEdit);
}
