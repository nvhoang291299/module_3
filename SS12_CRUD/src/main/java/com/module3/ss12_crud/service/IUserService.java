package com.module3.ss12_crud.service;

import com.module3.ss12_crud.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void save(User user);
}
