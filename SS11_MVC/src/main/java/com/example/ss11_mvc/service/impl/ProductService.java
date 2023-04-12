package com.example.ss11_mvc.service.impl;

import com.example.ss11_mvc.model.Products;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.repository.impl.ProductRepository;
import com.example.ss11_mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Products> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public void findById(int idEdit) {
        boolean flag = iProductRepository.findById(idEdit);
        if (flag == true) {

        }
    }

    @Override
    public void save(Products product) {
        iProductRepository.save(product);
    }
}
