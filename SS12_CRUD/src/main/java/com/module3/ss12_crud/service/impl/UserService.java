package com.module3.ss12_crud.service.impl;

import com.module3.ss12_crud.model.User;
import com.module3.ss12_crud.repository.IUserRepository;
import com.module3.ss12_crud.repository.impl.UserRepository;
import com.module3.ss12_crud.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void save(User user) {
        iUserRepository.save(user);
    }
}
