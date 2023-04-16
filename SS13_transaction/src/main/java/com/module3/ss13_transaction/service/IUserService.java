package com.module3.ss12_crud.service;

import com.module3.ss12_crud.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void save(User user);

    User findById(int idEdit);

    void update(User user);

    void delete(int idDel);

    List<User> findByCountry(String country);

    List<User> sortByName();

    void addUserPermission();
}
