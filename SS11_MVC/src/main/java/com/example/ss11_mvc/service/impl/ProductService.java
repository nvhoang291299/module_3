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
    public Products findById(int idEdit) {
        List<Products> list = iProductRepository.findAll();
        boolean flag = iProductRepository.findById(idEdit);
        if (flag == true) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getId() == idEdit) {
                    return list.get(i);
                }
            }
        }
        return null;
    }

    @Override
    public List<Products> findByName(String nameSearch) {
        List<Products> listSearch = iProductRepository.findByName(nameSearch);
        return listSearch;
    }

    @Override
    public void delete(Products productDel) {
        iProductRepository.deleteProduct(productDel);
    }

    @Override
    public void update(Products product) {
        iProductRepository.update(product);
    }

    @Override
    public void save(Products product) {
        iProductRepository.save(product);
    }
}
