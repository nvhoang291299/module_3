package com.example.ss11_mvc.repository.impl;

import com.example.ss11_mvc.model.Products;
import com.example.ss11_mvc.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Products> products = new ArrayList<>();
    static {
        products.add(new Products(1,"pen", 4000, "black", "deli"));
        products.add(new Products(2,"pencil", 2000, "black", "deli"));
        products.add(new Products(3,"pen", 4000, "blue", "thienlong"));
        products.add(new Products(4,"notebook", 10000, "80 paper", "campus"));
        products.add(new Products(5,"ruler", 5000, "20cm", "thienlong"));
    }
    @Override
    public List<Products> findAll() {
        return products;
    }

    @Override
    public void save(Products product) {
        product.setId(products.size()+1);
        products.add(product);
    }

    @Override
    public boolean findById(int idEdit) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == idEdit){
                return true;
            }
        }
        return false;
    }


}
