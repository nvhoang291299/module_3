package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> findAll();
    void save(Products products);

    boolean findById(int idEdit);

    void update(Products product);

    void deleteProduct(int idDel);

    List<Products> findByName(String nameSearch);
}
